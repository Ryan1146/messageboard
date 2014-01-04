class MessagesController < ApplicationController
	before_action :set_message, only: [ :show, :edit , :update , :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	

	def index
		@messages = Message.all.order("created_at DESC")
	end

	def show
	end

	def new
		#@message = Message.new
		@message = current_user.messages.build
	end

	def create
		
		#@message = Message.new(message_params)
		@message = current_user.messages.build(message_params)

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

				#防止別結透過網址入侵，修改別人的message
		def correct_user		
      	@message = current_user.messages.find_by_id(params[:id])
      	redirect_to messages_path, notice: "Not authorized to edit this message" if @message.nil?
    end

		def message_params
			params.require(:message).permit(:name , :message)
		end



end
