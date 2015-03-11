class ConnectRestaurantsWithUsers < ActiveRecord::Migration
  def up
    add_column :restaurants, :user_id, :integer
  end

  def down
    remove_column :restaurants, :user_id
  end
end
