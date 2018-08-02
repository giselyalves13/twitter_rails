class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :destroy]
  before_action :authorize
  # before_action :correct_user?(@tweet.user_id), only: [:edit, :update, :destroy]

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
  # def new
  #   @tweet = Tweet.new
  #   redirect_to tweets_path
  # end

  # POST /tweets
  # POST /tweets.json
  #Trailblazer
  def create

    if Tweet::Create.(current_user, tweet_params) 
      return redirect_to tweets_path, notice: 'Tweet was successfully created.'
    end

    # @tweet.errors.full_messages.each do |message|
    #   redirect_to tweets_path, notice: message
    # end
  end

  # def create
  #   @tweet = current_user.tweets.create(tweet_params)
  #   if @tweet.save
  #     redirect_to tweets_path, notice: 'Tweet was successfully created.' 
  #   else
  #     @tweet.errors.full_messages.each do |message|
  #       redirect_to tweets_path, notice: message
  #     end
  #   end
  # end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    unless correct_user?(@tweet.user_id)
      @tweet.destroy
      redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
    end
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
