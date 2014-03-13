class EventsController < ApplicationController

before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
 
  def index
    @events = Event.all

    Event.for_today
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(create_params)
    @event.user = current_user

    authorize @event

    #@event = Event.create(create_params)

    
    if @event.save
     redirect_to @event #root_path # es como pasar event con su :id
    else                # se ve en la ruta event_path q necesita
     render :new        # su :id , la ruta completa aki abajo
    end         # event_path   GET   /events/:id(.:format)   events#show        
  end

  def edit
    @event = Event.find (params[:id])
    authorize @event

  end

  def update

    @event = Event.find params[:id]
    if update.attributes?
      redirect_to events_path
    else
      redirect_to edit_event_path
    end
  end

  def destroy
  end

  private

  def create_params
   # if user.admin?
    #  params.require(:event).permit(:name, :description, :start_at, :end_at, :address, :moderate, :published)
    #else
      params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
    #end
  end
end
