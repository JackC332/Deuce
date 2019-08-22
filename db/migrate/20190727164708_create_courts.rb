class CreateCourts < ActiveRecord::Migration[5.2]
  def change
    create_table :courts do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :rating

      t.timestamps
    end
  end
end
