class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :destroy]
  before_action :authorize
  before_action :correct_user?, only: [:edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  #Trailblazer
  def new
    run Tweet::Create::Present
  end

  # POST /tweets
  # POST /tweets.json
  #Trailblazer
  def create

    if Tweet::Create.(current_user, tweet_params)
      return redirect_to tweets_path, notice: 'Tweet was successfully created.'
    end

  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    run Tweet::Delete

    flash[:alert] = "Tweet deleted"
    redirect_to tweets_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content)
    end

end
