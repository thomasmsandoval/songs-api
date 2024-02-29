require "test_helper"

class SongsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "songs" do
    get "/songs.json"
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal Song.count, data.length
  end
  test "create" do
    assert_difference "Song.count", 1 do
      post "/songs.json", params: { title: "test song", album: "1", artist: "artist", year: 1 }
    end
  end
  test "show" do
    get "/songs/#{Song.first.id}.json"
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal ["id", "title", "album", "artist", "year"], data.keys
  end
  test "update" do
    song = Song.first
    patch "/songs/#{song.id}.json", params: { title: "Updated title" }
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end
  test "destroy" do
    assert_difference "Song.count", -1 do
      delete "/songs/#{Song.first.id}.json"
      assert_response 200
    end
  end
end
