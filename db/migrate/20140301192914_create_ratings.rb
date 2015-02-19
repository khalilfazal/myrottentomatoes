class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :label
      t.timestamps
    end

    change_table :movies do |t|
      t.remove :rating
      t.belongs_to :rating
    end
  end
end
