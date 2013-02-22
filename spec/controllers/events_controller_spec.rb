require 'spec_helper'

describe EventsController do
  include Devise::TestHelpers

  before :each do
    @admin_user = User.create(:name => "admin user", :email => "admin@example.com",
                              :password => "password", :password_confirmation => "password")
    @admin_user.add_role :admin
  end

  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:date_and_time => DateTime.now, :name => "test name", :category => "clinic", :description => "description"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  context "not logged in" do
    describe "GET index" do
      it "assigns all events as @events" do
        event = Event.create! valid_attributes
        get :index, {}
        assigns(:events).should eq([event])
      end
    end

    describe "GET show" do
      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        get :show, {:id => event.to_param}
        assigns(:event).should eq(event)
      end
    end

    describe "GET new" do
      it "assigns a new event as @event" do
        get :new, {}
        assigns(:event).should be_a_new(Event)
      end
    end

    describe "GET edit" do
      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        get :edit, {:id => event.to_param}
        assigns(:event).should eq(event)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Event" do
          expect {
            post :create, {:event => valid_attributes}
          }.to change(Event, :count).by(0)
        end

        it "assigns a newly created event as @event" do
          post :create, {:event => valid_attributes}
          assigns(:event).should be_a(Event)
          assigns(:event).should_not be_persisted
        end

        it "redirects to the created event" do
          post :create, {:event => valid_attributes}
          response.should_not redirect_to(Event.last)
        end
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {}}
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {}}
        response.should redirect_to(root_path)
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        #it "updates the requested event" do
        #  event = Event.create! valid_attributes
        #  # Assuming there are no other events in the database, this
        #  # specifies that the Event created on the previous line
        #  # receives the :update_attributes message with whatever params are
        #  # submitted in the request.
        #  Event.any_instance.should_receive(:update_attributes).with({"these" => "params"})
        #  put :update, {:id => event.to_param, :event => {"these" => "params"}}
        #end
        #
        it "assigns the requested event as @event" do
          event = Event.create! valid_attributes
          put :update, {:id => event.to_param, :event => valid_attributes}
          assigns(:event).should eq(event)
        end

        it "redirects to the event" do
          event = Event.create! valid_attributes
          put :update, {:id => event.to_param, :event => valid_attributes}
          response.should redirect_to(root_path)
        end
      end

      describe "with invalid params" do
        it "assigns the event as @event" do
          event = Event.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Event.any_instance.stub(:save).and_return(false)
          put :update, {:id => event.to_param, :event => {}}
          assigns(:event).should eq(event)
        end

        it "re-renders the 'edit' template" do
          event = Event.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Event.any_instance.stub(:save).and_return(false)
          put :update, {:id => event.to_param, :event => {}}
          response.should redirect_to(root_path)
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested event" do
        event = Event.create! valid_attributes
        expect {
          delete :destroy, {:id => event.to_param}
        }.to change(Event, :count).by(0)
      end

      it "redirects to the events list" do
        event = Event.create! valid_attributes
        delete :destroy, {:id => event.to_param}

        response.should redirect_to(root_path)
      end
    end
  end

  context "admin user" do
    before :each do
      #sign_in @admin_user
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in @admin_user
    end

    describe "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, {:event => valid_attributes}
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}

        response.should redirect_to("#{events_path}?event_type=#{valid_attributes[:category]}")
      end
    end
  end


end
