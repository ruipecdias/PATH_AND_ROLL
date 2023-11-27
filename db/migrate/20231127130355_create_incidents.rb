class CreateIncidents < ActiveRecord::Migration[7.1]
  def change
    create_table :incidents do |t|
      t.string :location
      t.string :category
      t.string :img_url
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :comments_count

      t.timestamps
    end
  end
end
