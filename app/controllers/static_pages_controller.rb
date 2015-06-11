class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def build
    @computers = Computer.all.paginate(page: params[:page], per_page: 2)
  end

end
