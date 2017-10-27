class Gamification::InventoriesController < ApplicationController
  before_action :set_gamification_inventory, only: [:show, :edit, :update, :destroy]

  # GET /gamification/inventories
  def index
    @gamification_inventories = Gamification::Inventory.all
  end

  # GET /gamification/inventories/1
  def show
  end

  # GET /gamification/inventories/new
  def new
    @gamification_inventory = Gamification::Inventory.new
  end

  # GET /gamification/inventories/1/edit
  def edit
  end

  # POST /gamification/inventories
  def create
    @gamification_inventory = Gamification::Inventory.new(gamification_inventory_params)

    if @gamification_inventory.save
      redirect_to @gamification_inventory, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gamification/inventories/1
  def update
    if @gamification_inventory.update(gamification_inventory_params)
      redirect_to @gamification_inventory, notice: 'Inventory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gamification/inventories/1
  def destroy
    @gamification_inventory.destroy
    redirect_to gamification_inventories_url, notice: 'Inventory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamification_inventory
      @gamification_inventory = Gamification::Inventory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gamification_inventory_params
      params.require(:gamification_inventory).permit(:User_id, :Item_id, :equipped)
    end
end
