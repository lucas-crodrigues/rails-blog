class ChangeUsersDefaultPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :photo, from: nil, to: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Sample_User_Icon.png/640px-Sample_User_Icon.png')
  end
end
