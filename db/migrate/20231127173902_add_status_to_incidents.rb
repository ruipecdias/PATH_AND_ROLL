class AddStatusToIncidents < ActiveRecord::Migration[7.1]
  def change
    add_column :incidents, :status, :boolean
  end
end
