class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.belongs_to :owner
      t.string :name
      t.string :price
      t.text :description
      t.timestamps
    end
  end
end
