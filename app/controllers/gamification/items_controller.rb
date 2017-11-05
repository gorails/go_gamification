class Gamification::ItemsController < ApplicationController
  before_action :set_gamification_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource except: [:create]
  # GET /gamification/items
  def index
    @gamification_items = Gamification::Item.all
  end

  # GET /gamification/items/1
  def show
  end

  # GET /gamification/items/new
  def new
    @gamification_item = Gamification::Item.new
  end

  # GET /gamification/items/1/edit
  def edit
  end

  # POST /gamification/items
  def create
    authorize! :create, @gamification_item

    @gamification_item = Gamification::Item.new(gamification_item_params)

    if @gamification_item.save
      redirect_to @gamification_item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gamification/items/1
  def update
    if @gamification_item.update(gamification_item_params)
      redirect_to @gamification_item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gamification/items/1
  def destroy
    @gamification_item.destroy
    redirect_to gamification_items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamification_item
      @gamification_item = Gamification::Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gamification_item_params
      params.require(:gamification_item).permit(:name, :gamification_item_type_id,:gamification_item_group_id, :image, :rarity, :cost,:user_id, :description)
    end
end
