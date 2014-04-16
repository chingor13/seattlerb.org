class AddApprovedToDudes < ActiveRecord::Migration
  def up
    add_column :dudes, :verified, :boolean, :default => false
    Dude.update_all(:verified => true)
  end

  def down
    remove_column :dudes, :verified
  end
end
