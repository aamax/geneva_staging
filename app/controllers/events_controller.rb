class EventsController < ApplicationController
  load_and_authorize_resource

  # GET /events
  # GET /events.json
  def index
    @event_type = params[:event_type]
    if @event_type == 'outside'
      @events = Event.outside.order(:date_and_time)
      @event_title = "Outside"
    elsif @event_type == 'clinic'
      @events = Event.clinics.order(:date_and_time)
      @event_title = "Clinic"
    elsif @event_type == 'schooling'
      @events = Event.schooling.order(:date_and_time)
      @event_title = "Geneva Equestrian Schooling"
    else # get all events
      @events = Event.order(:date_and_time)
      @event_title = "All Scheduled Events"
      @event_type = "clinic"
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.category = params[:id] unless params[:id] == 'calendar'
    @event.category ||= "clinic"
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @event.category = params[:event_type]
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    if @event.save
      redirect_to events_path(:event_type => @event.category), notice: 'Event was successfully created.'
    else
      render action: "new?event_type=#{@event.category}", :alert=>"Error creating event..."
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", alert: 'Error updating event.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_url(:event_type=>@event.category), :notice=>"Successfully deleted event."
      else
        redirect_to events_url(:event_type=>@event.category), :alert=>"Error deleting event."
      end
  end
end
