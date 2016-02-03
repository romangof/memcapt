class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :privacity, null: false
      t.string :meme, null: false
      t.string :memeid, null: false

      t.timestamps null: false
    end
  end
end
