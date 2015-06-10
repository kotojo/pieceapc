class StaticPagesController < ApplicationController
  def home
    @computers = Computer.all
  end

  def about
  end
end
