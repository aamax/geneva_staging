require 'spec_helper'

describe RidersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      rider = FactoryGirl.create(:rider)
      event = FactoryGirl.create(:event)
      get :show, {:id => event.id}
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      rider = FactoryGirl.create(:rider)
      get :edit, {:id => rider.id}

      response.should redirect_to('/')
      flash.alert.should == 'UnAuthorized: Not authorized as an administrator.'
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should redirect_to('/')
      flash.alert.should == 'UnAuthorized: Not authorized as an administrator.'
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should redirect_to('/')
      flash.alert.should == 'UnAuthorized: Not authorized as an administrator.'
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      rider = FactoryGirl.create(:rider)
      get 'update', {:id => rider.id}
      response.should redirect_to('/')
      flash.alert.should == 'UnAuthorized: Not authorized as an administrator.'
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      rider = FactoryGirl.create(:rider)
      get 'destroy', {:id => rider.id}
      response.should redirect_to('/')
      flash.alert.should == 'UnAuthorized: Not authorized as an administrator.'
    end
  end

end
