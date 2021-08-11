class PagesController < ApplicationController
  def index
    @rounds = Round.order("id DESC")
  end
end
