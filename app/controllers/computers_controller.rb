class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  # GET /computers
  # GET /computers.json
  def index
    @computers = current_user.computers.order(created_at: :desc)
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
    @arr = []

    @computer.update_attribute(:price, 0)

    @computer.parts.each do |part|
      @arr.push(Computer.retrieve(part.api_id))
      @computer.price += @arr[@arr.length-1][0]["FinalPrice"].reverse.chop.reverse.to_f
      @computer.update_attribute(:price, @computer.price)
    end
  end

  # GET /computers/new
  def new
    @computer = Computer.new
  end

  # GET /computers/1/edit
  def edit
  end

  # POST /computers
  # POST /computers.json
  def create
    @computer = Computer.new(computer_params)
    @computer.user = current_user

    respond_to do |format|
      if @computer.save
        format.html { redirect_to @computer, notice: 'Computer was successfully created.' }
        format.json { render :show, status: :created, location: @computer }
      else
        format.html { render :new }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    respond_to do |format|
      if @computer.update(computer_params)
        format.html { redirect_to @computer, notice: 'Computer was successfully updated.' }
        format.json { render :show, status: :ok, location: @computer }
      else
        format.html { render :edit }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer.destroy
    respond_to do |format|
      format.html { redirect_to computers_url, notice: 'Computer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_params
      params.require(:computer).permit(:name, :description, :price)
    end

    def correct_user
      @todo = current_user.computers.find_by(id: params[:id])
      redirect_to root_url if @todo.nil?
    end
end
