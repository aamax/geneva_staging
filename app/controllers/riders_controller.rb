class RidersController < ApplicationController
  #load_and_authorize_resource

  def index
    @riders = Rider.all(:order => 'event_id, name') #.sort_by &:event_id
  end

  def show
    @riders = Rider.find_all_by_event_id(params[:id])
    @event = Event.find(params[:id])
  end

  def edit
    @rider = Rider.find(params[:id])
    @event = Event.find(@rider.event_id)
  end

  def new
    @event = Event.find(params[:event_id])
    @rider = Rider.new
    @rider.event_id = @event.id
  end

  def create
    @rider = Rider.new(params[:rider])
    if @rider.save
      params[:id] = @rider.event_id
      @event = Event.find(@rider.event_id)
      @riders = Rider.find_all_by_event_id(@rider.event_id)
      redirect_to "/riders_for_event/#{@event.id}", notice: 'Rider was successfully created.'
    else
      redirect_to "/riders_for_event/#{@event.id}", :alert=>"Error creating rider..."
    end
  end

  def update
    authorize! :update, @rider, :message => 'Not authorized as an administrator.'
    @rider = Rider.find(params[:id])
    @event = Event.find(@rider.event_id)
    @riders = Rider.find_all_by_event_id(@rider.event_id)

    if @rider.update_attributes(params[:rider])
      redirect_to "/riders_for_event/#{@event.id}", :notice => "Rider updated."
    else
      redirect_to "/riders_for_event/#{@event.id}", :alert => "ERROR updating rider information."
    end
  end

  def destroy
    @rider = Rider.find(params[:id])
    @event = Event.find(@rider.event_id)
    @riders = Rider.find_all_by_event_id(@rider.event_id)
    if @rider.destroy
      redirect_to "/riders_for_event/#{@event.id}", :notice=>"Rider Deleted."
    else
      redirect_to "/riders_for_event/#{@event.id}", :alert => "ERROR Rider not Deleted."
    end
  end
end
