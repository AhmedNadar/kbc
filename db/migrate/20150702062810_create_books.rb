class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :author
      t.text :notes
      t.index :name
      t.index :author

      t.timestamps null: false
    end
  end
end
