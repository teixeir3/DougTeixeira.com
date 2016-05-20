class PagesController < ApplicationController
  
  def google
    render "pages/google.html.erb", layout: false
  end
end
