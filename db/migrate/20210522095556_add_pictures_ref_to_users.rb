class AddPicturesRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :picture, foreign_key: true
  end
end
