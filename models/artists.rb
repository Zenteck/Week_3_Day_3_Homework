require_relative('../db/sql_runner.rb')
require_relative('./albums.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    SqlRunner.run("DELETE FROM artists;")
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    result = SqlRunner.run(sql, values)
    return result
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result
  end


#Forgot to write this!!!
  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map{|artist_hash|Artist.new(artist_hash)}
  end

  def find_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end



  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return nil if result.count == 0
    artist_hash = result[0]
    return Artist.new(artist_hash)
  end

end
