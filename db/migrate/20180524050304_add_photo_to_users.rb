class AddPhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo, :string
    add_column :users, :rate, :integer, array: true, default: []
    add_column :users, :rates, :float
  end
end
