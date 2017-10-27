class Gamification::ItemTypesController < ApplicationController
  before_action :set_gamification_item_type, only: [:show, :edit, :update, :destroy]

  # GET /gamification/item_types
  def index
    @gamification_item_types = Gamification::ItemType.all
  end

  # GET /gamification/item_types/1
  def show
  end

  # GET /gamification/item_types/new
  def new
    @gamification_item_type = Gamification::ItemType.new
  end

  # GET /gamification/item_types/1/edit
  def edit
  end

  # POST /gamification/item_types
  def create
    @gamification_item_type = Gamification::ItemType.new(gamification_item_type_params)

    if @gamification_item_type.save
      redirect_to @gamification_item_type, notice: 'Item type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gamification/item_types/1
  def update
    if @gamification_item_type.update(gamification_item_type_params)
      redirect_to @gamification_item_type, notice: 'Item type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gamification/item_types/1
  def destroy
    @gamification_item_type.destroy
    redirect_to gamification_item_types_url, notice: 'Item type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamification_item_type
      @gamification_item_type = Gamification::ItemType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gamification_item_type_params
      params.require(:gamification_item_type).permit(:name,:key)
    end
end
