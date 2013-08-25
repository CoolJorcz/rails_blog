class PostsController < ApplicationController

	include PostHelper

	def index
		@posts = Post.all
	end

	def edit
		@post = current_post
  end
  
  def new
  	@tags = Tag.all
  end

  def show
  	@post = current_post
  end

  def create
  	@post = Post.create(params[:post])
  	redirect_to "/posts/#{@post.id}"
  end

  def update
  	@post = Post.find(params[:post_id])
	  	
		if @post
	  	@post.update_attributes(params[:post])
	  	@post.save
	  	redirect_to "/posts/#{@post.id}"
		else
	  	redirect_to "/"
		end
	end

  def destroy
  	p params[:id]
  	puts "*" * 100
  	@post = Post.find(params[:id])
  	p @post
	  if @post
	    @post.destroy
	    redirect_to "/"
	  else
	    redirect_to "/"
	  end
  end
end