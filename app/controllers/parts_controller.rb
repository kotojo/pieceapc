class PartsController < ApplicationController
  def new
    @part = Part.new
    if params[:item] != nil
      @item = Part.retrieve(params[:item])
    end
    @computers = current_user.computers
  end

  def create
    puts "PartsController.create has params = #{params}"
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to computer_path(@part.computer_id), notice: 'Post was successful.' }
        format.json { head :no_content }
      else
        format.html { redirect_to new_part_path }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end

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
