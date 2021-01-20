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
      parents: params[:parents],
      siblings: params[:siblings],
      shul: params[:shul],
      summers: params[:summers],
      height: params[:height],
      shadchan_info: params[:shadchan_info],
      looking_for: params[:looking_for],
    )
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.birthday = params[:birthday] || @user.birthday
    @user.address = params[:address] || @user.address
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.currently_doing = params[:currently_doing] || @user.currently_doing
    @user.education = params[:education] || @user.education
    @user.references = params[:references] || @user.references
    @user.additional_info = params[:additional_info] || @user.additional_info
    @user.image_url = params[:image_url] || @user.image_url
    @user.parents = params[:parents] || @user.parents
    @user.siblings = params[:siblings] || @user.siblings
    @user.shul = params[:shul] || @user.shul
    @user.summers = params[:summers] || @user.summers
    @user.height = params[:height] || @user.height
    @user.shadchan_info = params[:shadchan_info] || @user.shadchan_info
    @user.looking_for = params[:looking_for] || @user.looking_for

    if @user.save
      render "show.json.jb"
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

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    @matches = Match.where(girl_id: params[:id])
    @matches.each do |match|
      match.destroy
    end
    @matches = Match.where(boy_id: params[:id])
    @matches.each do |match|
      match.destroy
    end
    render json: { success: "destroyed and the matches too!" }
  end
end
