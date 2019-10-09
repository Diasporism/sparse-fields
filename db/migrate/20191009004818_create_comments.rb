class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :note
      t.references :user
      t.references :parent
      t.timestamps
    end
  end
end
