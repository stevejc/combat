class MessagesController < ApplicationController
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to root_path, notice: "Thanks for your message, we will get back to you asap."
    else 
      render :new
    end
  end
end