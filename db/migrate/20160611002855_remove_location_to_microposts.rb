class RemoveLocationToMicroposts < ActiveRecord::Migration
  def change
    remove_column :microposts, :location, :string
  end
end
