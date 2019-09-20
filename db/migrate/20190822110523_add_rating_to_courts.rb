class AddRatingToCourts < ActiveRecord::Migration[5.2]
  def change
    add_column :courts, :rating, :float
  end
end
