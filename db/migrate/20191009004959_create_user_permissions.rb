class CreateUserPermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_permissions do |t|
      t.references :blog
      t.references :user
      t.timestamps
    end
  end
end
