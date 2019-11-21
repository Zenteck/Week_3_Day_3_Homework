require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/albums')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class AlbumTest < MiniTest::Test

  def test_can_create_artist
    album_info = {
      'title' => 'Folsom Prison Blues',
      'genre' => 'Blues'
    }

    new_album = Album.new(album_info)
    assert_equal('Folsom Prison Blues', new_album.title)
    assert_equal('Blues', new_album.genre)
  end

end
