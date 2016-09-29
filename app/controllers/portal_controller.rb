class PortalController < ApplicationController
  def index
    @radius = params[:radius] || 5;
  end
end
