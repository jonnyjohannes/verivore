class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    Post.find_each(&:save)
  end
end
