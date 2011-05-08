class TagsController < ApplicationController

  def index
    @unsorted_tags = Tag.all
    @tag_alph_sort = @unsorted_tags.sort { |a,b| a.name.downcase <=> b.name.downcase }
    @tags = @tag_alph_sort.paginate :page => params[:page]
  end

  def show
    @tag = Tag.find(params[:id])
    @tagged_posts = @tag.posts.paginate :page => params[:page], :order => 'created_at DESC'
  end

end
