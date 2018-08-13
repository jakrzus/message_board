class AddCommentToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :comment, :text
  end
end
