# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show
    redirect_to list_tasks_path(@list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = 'List was created successfully'
      redirect_to lists_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      flash[:success] = 'List was updated successfully'
      redirect_to lists_path
    else
      render 'new'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :color, :priority)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
