class CreateAffectingPins < ActiveRecord::Migration[7.1]
  def change
    create_table :affecting_pins do |t|
      t.references :user, null: false, foreign_key: true
      t.references :incident, null: false, foreign_key: true

      t.timestamps
    end
  end
end
