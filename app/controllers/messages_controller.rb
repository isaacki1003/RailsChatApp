class MessagesController < ApplicationController
    def index
      @messages = Message.all
    end
    def new
      @message = Message.new(user: current_user)
    end
  end
