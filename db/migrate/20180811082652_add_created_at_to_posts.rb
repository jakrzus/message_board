class AddCreatedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :created, :datetime
  end
end
