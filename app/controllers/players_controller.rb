class PlayersController < ApplicationController
  before_action :set_player, except: [:index, :new, :create]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create 
    @player = Player.new(create_params)
    respond_to do |format|
      if @player.save
        format.html { redirect_to players_path, notice: "Player was successfully created" }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if @player.update(update_params)
        format.html { redirect_to players_path, notice: "Player was edited successfully" }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @player.destroy
        format.html { redirect_to players_path, notice: "Player was disenrolled successfully" }
      else
        format.html { render :action => "index" }
      end
    end
  end

  def change_status
    respond_to do |format|
      if params[:status].present? && Player.statuses.include?(params[:status])
        if @player.update(status: params[:status])
          format.html { redirect_to players_path, notice: "Player was updated successfully"}
        else
          format.html { redirect_to players_path, alert: "There was a problem, try again" }
        end
      else
        format.html { redirect_to players_path, alert: "There was a problem, try again" }
      end
    end
  end

  private
  def create_params
    params.require(:player).permit(:name, :last_name)
  end

  def update_params
    params.require(:player).permit(:name, :last_name, :balance, :status)
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
