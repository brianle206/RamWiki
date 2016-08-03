class WikiPagesController < ApplicationController

  acts_as_wiki_pages_controller
  def create
  end
  def current_user
  	@current_user = User.find(session[:user_id])
  end
end
