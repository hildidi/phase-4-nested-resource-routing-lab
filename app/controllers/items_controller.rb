class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

#GET /items
  #returns an array of all items with user info  
def index
    items = Item.all
    render json: items, include: :user
  end

  # GET /users/:user_id/items/:id
  # returns the item with the matching id
  # returns a 404 response if the item is not found
  def show 
      item = Item.find(params[:id])
      render json: item
  end

  # Items POST /users/:user_id/items 
  #creates a new item belonging to a user
  #returns the newly created item
  #returns a 201 created status if the item was created
  def create
    user = User.find(params[:user_id])
    item = user.items.create(item_params)
    render json: item, status: :created 
  end


  private 

  def item_params
    params.permit(:name, :description, :price)
  end

      #returns a 404 response if the item is not found
    def render_not_found_response(exception)
      render json: { error: "#{exception.model} not found" }, status: :not_found
    end

end
