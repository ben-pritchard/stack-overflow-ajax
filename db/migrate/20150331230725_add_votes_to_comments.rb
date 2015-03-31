class AddVotesToComments < ActiveRecord::Migration
  def up
    add_column :comments, :votes, :integer, default: 0
  end
end
