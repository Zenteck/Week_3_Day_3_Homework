require_relative('../db/sql_runner')
require_relative('./artists')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @title = info['title']
    @genre = info['genre']
    @artist_id = info['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM albums;")
  end

  def edit()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@title, @genre, @artist_id, @id]
    result = SqlRunner.run(sql, values)
    return result
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result
  end

  def find_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)[0]
    return Artist.new(result)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return nil if result.count == 0
    album_hash = result[0]
    return Album.new(album_hash)
  end



end
