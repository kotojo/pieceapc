class PartsController < ApplicationController
  def new
    @parts = Part.new
    if params[:item] != nil
      @item = Part.retrieve(params[:item])
    end
    @computers = current_user.computers
  end

  def create
    puts "PartsController.create has params = #{params}"
    @part = Part.new(part_params)
    @part.save
    redirect_to computer_path(@part.computer_id)
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to computer_path(@part.computer_id)
  end

  private

    def part_params
      params.require(:part).permit(:api_id, :computer_id, :name)
    end
end
