class RemoveAnonymousFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :anonymous, :string
  end
end
