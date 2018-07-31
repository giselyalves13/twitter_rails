require_relative "../concepts/user/contract/create"

class UsersController < ApplicationController
  # before_action :authorize, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user?, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  #Trailblazer
  def new
    run User::Create::Present
    render cell(User::Cell::New, @form), layout: false
  end

  # def new
  #   @user = User.new
  # end



  # GET /users/1/edit
  def edit
    run User::Update::Present
    render cell(User::Cell::Edit, @form), layout: false
  end
  # def edit
  # end

  # POST /users
  # POST /users.json
  #Trailblazer
  def create
    run User::Create do |result|
      return redirect_to root_path
    end

    render cell(User::Cell::New, @form), layout: false
  end 
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path, notice: 'Usuário criado com sucesso!'
  #     sign_in
  #   else
  #     render :new
  #   end  
  # end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    run User::Update do |result|
      flash[:notice] = "#{result["model"].title} has been saved"
      return redirect_to user_path(result["model"].id)
    end

    render cell(User::Cell::Edit, @form), layout: false
  end
  # def update
  #   @user = User.find(params[:id]) 
  #   if @user.update(user_params)
  #     redirect_to root_path, notice: 'User was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    sign_out
    redirect_to root_path, notice: 'User was successfully destroyed.'   
  end

  def tweets
    @tweets = current_user.tweets.all 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user, :password, :password_confirmation, :user_img)
    end
    
end
