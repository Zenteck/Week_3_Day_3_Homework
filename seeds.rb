require('pry')
require_relative('models/artists')
require_relative('models/albums')

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new(
  {
    'name' => "Johnny Cash"
  }
)
artist1.save()

artist2 = Artist.new(
  {
    'name' => "Pink Floyd"
  }
)
artist2.save()


album1 = Album.new(
  {
    'title' => "Folsom Prison Blues",
    'genre' => "Blues",
    'artist_id' => artist1.id
  }
)
album1.save()

album2 = Album.new(
  {
    'title' => "The Wall",
    'genre' => "Rock",
    'artist_id' => artist2.id
  }
)
album2.save()

album3 = Album.new(
  {
    'title' => "Darkside of the Moon",
    'genre' => 'Rock',
    'artist_id' => artist2.id
  }
)
album3.save()

binding.pry

nil
