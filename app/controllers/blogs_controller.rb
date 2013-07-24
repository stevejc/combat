class BlogsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :admin_only, except: [:index, :show]
  
  def index
    @blogs = Blog.order("created_at asc")
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(params[:blog])
    
    if @blog.save
      redirect_to blogs_path, notice: "Your blog article has been saved."
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
  
  private
  
  def admin_only
    redirect_to root_path, alert: "Whoops, you do not have access to the requested page." if !current_user.admin?
  end
  
end