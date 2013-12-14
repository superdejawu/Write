class VitaminsController < ApplicationController
  before_action :set_vitamin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @vitamins = Vitamin.all.order("created_at DESC")
  end


  def show
  end


  def new
    @vitamin = current_user.vitamins.build
  end

  def edit
  end


  def create
    @vitamin = current_user.vitamins.build(vitamin_params)

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
      format.html {redirect_to vitamins_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vitamin
      @vitamin = Vitamin.find(params[:id])
    end

    def correct_user
      @vitamin = current_user.vitamins.find_by(id: params[:id])
      redirect_to vitamins_path, notice: "Not authorized to edit this vitamin" if @vitamin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vitamin_params
      params.require(:vitamin).permit(:description, :image)
    end
end
