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

      if @vitamin.save
        redirect_to @vitamin, notice: 'Vitamin was successfully created.' 
      else
        render action: 'new' 
      end
    
  end


  def update
      if @vitamin.update(vitamin_params)
        redirect_to @vitamin, notice: 'Vitamin was successfully updated.' 
      else
        render action: 'edit'
      end
    
  end

 
  def destroy
    @vitamin.destroy
    respond_to do |format|
      redirect_to vitamins_url 
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
