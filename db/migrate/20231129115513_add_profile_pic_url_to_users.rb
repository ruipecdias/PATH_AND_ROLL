class AddProfilePicUrlToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile_pic_url, :string
  end
end
