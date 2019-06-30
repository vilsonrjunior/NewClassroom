class PagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:home, :careers, :contact]

  def home
    # raise
  end

  def contact
  end

  def careers
  end

end
