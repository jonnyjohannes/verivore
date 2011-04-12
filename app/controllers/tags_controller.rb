class TagsController < ApplicationController

def index
  @tags = Tag.paginate :page => params[:page], :order => 'created_at DESC'
end

def show
  @tag = Tag.find(params[:id])
  @tagged_posts = @tag.posts.paginate :page => params[:page], :order => 'created_at DESC'
end

end
