class AddStatusesCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :statuses_count, :string
  end
end
