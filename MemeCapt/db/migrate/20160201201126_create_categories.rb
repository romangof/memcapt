class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :image, index: true, foreign_key: true
      t.string :catname, presence: true

      t.timestamps null: false
    end
  end
end
