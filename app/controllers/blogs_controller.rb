class BlogsController < ApplicationController
  def index
    @blogs = Blog.order("created_at asc")
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params[:blog])
    
    if @blog.save
      redirect_to root_path, notice: "Your blog article has been saved."
    else
      render :new
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog]) 
      redirect_to @blog, notice: 'Your blog post was successfully updated.'
    else
      render :edit 
    end
  end
end