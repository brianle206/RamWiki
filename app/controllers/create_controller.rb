class CreateController < ApplicationController
	def index
	end
	def create
		@title = params[:title]
		redirect_to "/wiki/new/#{@title}"
	end
end


