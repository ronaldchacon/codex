class AddDefaultValueToPublicAttribute < ActiveRecord::Migration
  def up
    change_column :wikis, :public, :boolean, :default => true
  end

  def down
    change_column :wikis, :public, :boolean, :default => false
  end
end

