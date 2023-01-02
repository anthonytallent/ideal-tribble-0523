class AddActorToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :actors, :movie, foreign_key: true
  end
end
