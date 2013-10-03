class AddVideoRemoteUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_remote_url, :string
  end
end
