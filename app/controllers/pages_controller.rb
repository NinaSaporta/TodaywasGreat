class PagesController < ApplicationController
before_action :sign_up_if_not_authenticated!, only: [:create]

  def about
  
  end

  def contact

  end
end

