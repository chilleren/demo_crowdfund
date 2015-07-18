class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
  end

  def create
  end

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
