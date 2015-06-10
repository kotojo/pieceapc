class PartsController < ApplicationController
  def new
    @parts = Part.new
    @item = Part.retrieve(params[:item])
    @computers = current_user.computers
  end

  def create
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
