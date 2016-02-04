class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.boolean :privacity, null: false
      t.string :top_text
      t.string :bot_text
      t.string :img_id, null: false
      t.string :ext_url
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
