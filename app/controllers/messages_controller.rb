class MessagesController < ApplicationController
	before_action :set_message, only: [ :show, :edit , :update , :destroy]
	

	def index
		@messages = Message.all
	end

	def show
	end

	def new
		@message = Message.new
	end

	def create
		
		@message = Message.new(message_params)

		if(@message.save)
			redirect_to message_path(@message)
		else
			render action: 'new'
		end
	end

	def edit
	end

	def update
		if(@message.update(message_params))
			redirect_to message_path(@message)
		else
			render action: 'edit'
		end
	end

	def destroy
		if(@message.present?)
			@message.destroy
		end	
		redirect_to messages_path
		

	end

	private

		def set_message
			@message = Message.find(params[:id])
		end

		def message_params
			params.require(:message).permit(:name , :message)
		end




end
