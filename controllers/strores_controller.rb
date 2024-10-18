class StoresController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin, only: [:create, :new]
  
    def index
      @stores = Store.all
    end
  
    def show
      @store = Store.find(params[:id])
    end
  
    def new
      @store = Store.new
    end
  
    def create
      @store = Store.new(store_params)
      @store.owner = current_user
  
      if @store.save
        redirect_to @store, notice: 'Store added successfully!'
      else
        render :new
      end
    end
  
    private
  
    def store_params
      params.require(:store).permit(:name, :address)
    end
  
    def authorize_admin
      redirect_to root_path unless current_user.system_admin?
    end
  end
  