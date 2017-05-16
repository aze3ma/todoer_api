class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]

  # GET /todos/:todo_id/items
  def index
    respond_to do |format|
      format.json { render json: @todo.items }
    end
  end

  # GET /todos/:todos_id/items/:id
  def show
    respond_to do |format|
      format.json { render json: @item }
    end
  end

  # POST /todos/:todos_id/items
  def create
    @todo.items.create!(item_params)

    respond_to do |format|
      format.json { render json: @todo }
    end
  end

  # PUT /todos/:todos_id/items/:id
  def update
    @item.update(item_params)

    head :no_content
  end

  # DELETE /todos/:todos_id/items/:id
  def destroy
    @item.destroy

    head :no_content
  end

  private
  def item_params
    params.require(:todo).permit(:body, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end  
end
