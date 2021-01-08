class Api::MatchesController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except: [:show, :index, :update]

  def create
    @match = Match.new(
      girl_id: params[:girl_id],
      boy_id: params[:boy_id],
    )
    if @match.save
      render "show.json.jb"
    else
      render json: { error: "unsuccessful" }
    end
  end

  def show
    @match = Match.find_by(id: params[:id])
    if current_user.id == @match.girl_id
    elsif current_user.id == @match.boy_id
    elsif current_user.admin
      render "show.json.jb"
    else
      render json: { error: "not your match!" }, status: :unauthorized
    end
  end

  def index
    if current_user.admin
      @matches = Match.all
      render "index.json.jb"
    elsif current_user.gender == "M"
      @matches = Match.where(boy_id: current_user.id)
      render "index.json.jb"
    elsif current_user.gender == "F"
      @matches = Match.where(girl_id: current_user.id)
      render "index.json.jb"
    else
      @matches = []
    end
  end

  def update
    @match = Match.find_by(id: params[:id])
    @match.girl_approval = params[:girl_approval] || @match.girl_approval
    @match.boy_approval = params[:boy_approval] || @match.boy_approval

    if @match.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end
end
