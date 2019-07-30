class CreateCourts < ActiveRecord::Migration[5.2]
  def change
    create_table :courts do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :details

      t.timestamps
    end
  end
end
