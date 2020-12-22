class Api::MatchesController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except: [:show, :index]

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
    elsif current_user.gender == "M" && current_user.girl_matches.length >= 1
      @matches = Match.where(boy_id: current_user.id)
      render "index.json.jb"
    elsif current_user.gender == "F" && current_user.boy_matches.length >= 1
      @matches = Match.where(girl_id: current_user.id)
      render "index.json.jb"
    else
      render json: { sorry: "You have no matches yet" }
    end
  end
end
