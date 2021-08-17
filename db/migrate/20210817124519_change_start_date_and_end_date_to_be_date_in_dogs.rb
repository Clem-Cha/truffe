class ChangeStartDateAndEndDateToBeDateInDogs < ActiveRecord::Migration[6.0]
  def change
    change_column :dogs, :start_date, :date
    change_column :dogs, :end_date, :date
  end
end
