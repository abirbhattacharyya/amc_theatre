class CreateMovieShows < ActiveRecord::Migration
  def self.up
    create_table :movie_shows do |t|
      t.string :name
      t.integer :theatre_id
      t.string :show_time
      t.string :web_url
      t.integer :run_time
      t.boolean :imax
      t.boolean :etx
      t.boolean :threeD

      t.timestamps
    end
  end

  def self.down
    drop_table :movie_shows
  end
end
