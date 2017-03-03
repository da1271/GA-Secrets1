class AddAnonymousToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :anonymous, :boolean
    remove_column :comments, :name, :string 
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :post, foreign_key: true
  end
end
