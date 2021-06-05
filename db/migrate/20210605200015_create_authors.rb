class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :authors, :slug, unique: true
  end
end
