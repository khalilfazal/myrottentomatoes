class CreateMovies < ActiveRecord::Migration
  def change

    # @param [Object] t pointer to new table
    create_table :movies do |t|
      t.string      :title
      t.string      :rating
      t.text        :description
      t.datetime    :release_date
      t.timestamps
    end
  end
end
