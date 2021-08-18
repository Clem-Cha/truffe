class AddCoordinatesToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :latitude, :float
    add_column :dogs, :longitude, :float
    add_column :dogs, :address, :string
  end
end
