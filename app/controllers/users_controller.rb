class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

# GET /users/:id
    #returns a user with an array of all items associated with that user
  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end


end
