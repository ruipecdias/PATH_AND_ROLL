class RenameAffectedPinsToAffectingPins < ActiveRecord::Migration[7.1]
  def change
    rename_table :affected_pins, :affecting_pins
  end
end