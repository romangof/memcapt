class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :image, index: true, foreign_key: true
      t.string :tagname

      t.timestamps null: false
    end
  end
end
