class HomeController < ApplicationController
  def index
  end
  
  def podcaster
  end
  
  def advertiser
  end
  
  def advertiser_contact
    @advertiser = Advertiser.new
  end
  
  def podcaster_contact
  end
  

end
