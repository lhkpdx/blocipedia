class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @wikis = Wiki.all
  end

end
