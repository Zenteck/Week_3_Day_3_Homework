require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/artists')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ArtistTest < MiniTest::Test

  def test_can_create_artist
    artist_info = {
      'name' => 'Johnny Cash'
    }

    new_artist = Artist.new(artist_info)
    assert_equal('Johnny Cash', new_artist.name)
  end

end
