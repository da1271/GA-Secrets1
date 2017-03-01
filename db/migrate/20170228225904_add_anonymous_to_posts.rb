class AddAnonymousToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :anonymous, :boolean
  end
end
