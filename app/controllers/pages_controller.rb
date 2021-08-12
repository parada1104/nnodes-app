class PagesController < ApplicationController
  def index
    @rounds = Round.order("id DESC").paginate(page: params[:page], per_page: 10)
  end
end
