class CampaignsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)

    if @campaign.save
      flash[:notice] = "Your campaign was created successfully!"
      redirect_to campaign_path(@campaign)
    else
      flash.now[:alert] = "Something went wrong!"
      render 'new'
    end
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
    @campaign = Campaign.find(params[:id])
    if @campaign.update campaign_params
      flash[:notice] = "Your campaign was created successfully!"
      redirect_to campaign_path(@campaign)
    else
      flash.now[:alert] = "Something went wrong!"
      render 'new'
    end
  end

  def destroy
  end

  private
    def campaign_params
      params.require(:campaign).permit(:title, :description)
    end

    def correct_user
      campaign = Campaign.find(params[:id])
      raise ActionController::RoutingError.new('Not Found') unless current_user.id == campaign.user_id
    end
    
    def logged_in_user
      unless logged_in?
        flash[:alert] = "You need to log in first"
        redirect_to login_url
      end
    end

end
