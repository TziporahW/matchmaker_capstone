class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  # before_action :authenticate_admin, except: [:create, :show]

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      gender: params[:gender],
      birthday: params[:birthday],
      address: params[:address],
      phone_number: params[:phone_number],
      currently_doing: params[:currently_doing],
      education: params[:education],
      references: params[:references],
      additional_info: params[:additional_info],
      image_url: params[:image_url],
    )
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jb"
  end

  def index
    @users = User.where(admin: false)
    render "index.json.jb"
  end
end
