class Gamification::InventoriesController < ApplicationController
  before_action :set_gamification_inventory, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:update]
  before_action :authenticate_user!
  load_and_authorize_resource except: [:create]

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
    authorize! :create, @gamification_inventory

    @gamification_inventory = Gamification::Inventory.new(inventory_params)

    if @gamification_inventory.save
      redirect_to @gamification_inventory, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gamification/inventories/1
  def update
    respond_to do |format|
      if @gamification_inventory.equip_item(params[:user_id].to_i)

        format.js
        format.json { head :no_content }
      else
        format.js
        format.json { render json: @gamification_inventory.errors, status: :unprocessable_entity }
      end
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

  def set_user
    @user = User.find(params[:user_id])
  end

  # Only allow a trusted parameter "white list" through.

  def inventory_params
    params.require(:inventory).permit(:user_id, :equipped, :gamification_item_id)
  end
end
