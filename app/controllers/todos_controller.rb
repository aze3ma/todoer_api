class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all

    respond_to do |format|
      format.json { render json: @todos }
    end
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)

    respond_to do |format|
      format.json { render json: @todo }
    end
  end


  # GET /todos/:id
  def show
    respond_to do |format|
      format.json { render json: @todo }
    end
  end

  # PUT /todos/:id
  def update
    @todo.update!(todo_params)

    head :no_content
  end


  # DELETE /todos/:id
  def destroy
    @todo.destroy

    head :no_content
  end


  private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
