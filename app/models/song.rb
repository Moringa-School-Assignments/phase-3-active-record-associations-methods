class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if Drake is *not found*
    drake = Artist.find_by(name: "Drake")
    if drake.name != "Drake"
      new_drake = Artist.create(name: "Drake")
      new_drake_id = Artist.find_by(name: "Drake").id

      self.update(self.id, :artist_id => new_drake_id )
    else
      new_drake_id = Artist.find_by(name: "Drake").id
      self.update(self.id, :artist_id => new_drake_id )
    end

  end
end