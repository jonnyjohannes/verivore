class CommentsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show, :new, :create]
  
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end
    
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build

    respond_to do |format|
      format.html { }
      format.xml  { render :xml => @post.comments.build }
    end
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(post_path(@comment.post_id), :notice => 'Comment posted, thanks for the feedback') }
        format.xml  { render :xml => @comment, :status => :created, :location => post_path(@comment.post_id) }
      else
        format.html { redirect_to(post_path(@comment.post_id), :notice => 'Sorry, but there was some missing information') }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    #@post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(@comment.post, :notice => "Comment Deleted") }
      format.xml { render :xml => @comment.errors, :status => :unprocessable_entitiy }
    end
  end
end
