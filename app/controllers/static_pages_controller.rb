class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  helper_method :sort_column, :sort_direction

  def home
  end

  def about
  end

  def build
    @computers = Computer.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: 2)
  end

  private

  def sort_column
    Computer.column_names.include?(params[:sort]) ? params[:sort] : "price"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
