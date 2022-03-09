class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    
   list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
      
    end
    redirect_to '/top'
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[ :id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end


  private
   def list_params
     params.require(:list).permit(:title, :body, :imege)
   end

end
