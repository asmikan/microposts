class RemoveProfileToMicroposts < ActiveRecord::Migration
  def change
    remove_column :microposts, :profile, :string
  end
end
