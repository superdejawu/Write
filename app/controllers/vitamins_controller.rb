class VitaminsController < ApplicationController
  before_action :set_vitamin, only: [:show, :edit, :update, :destroy]

  def index
    @vitamins = Vitamin.all
  end


  def show
  end


  def new
    @vitamin = Vitamin.new
  end

  def edit
  end


  def create
    @vitamin = Vitamin.new(vitamin_params)

    respond_to do |format|
      if @vitamin.save
        format.html { redirect_to @vitamin, notice: 'Vitamin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vitamin }
      else
        format.html { render action: 'new' }
        format.json { render json: @vitamin.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @vitamin.update(vitamin_params)
        format.html { redirect_to @vitamin, notice: 'Vitamin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vitamin.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @vitamin.destroy
    respond_to do |format|
      format.html { redirect_to vitamins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vitamin
      @vitamin = Vitamin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vitamin_params
      params.require(:vitamin).permit(:description)
    end
end
