class EventsController < ApplicationController
  def index
    @events = Event.all

    Event.for_today
  end

  def show
    
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(create_params)

    redirect_to events_path
  end

  def edit
    @event = Event.find params[:id]

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
