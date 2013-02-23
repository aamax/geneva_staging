require 'spec_helper'

feature 'event management and access - not logged in' do
  before :each do
    @event = FactoryGirl.create(:event, name: "test event")
  end

  scenario 'can access event listings' do
    visit(events_path)
    expect(page).to have_content('test event')
  end

  scenario 'can access specific event show page' do
    visit(events_path(@event))
    expect(page).to have_content('test event')
  end

  scenario 'cannot access edit page' do
    visit(edit_event_path(@event))
    expect(page).to have_content('UnAuthorized:')
  end

  scenario 'cannot access new page' do
    visit(new_event_path)
    expect(page).to have_content('UnAuthorized:')
  end
end

feature 'event management and access - admin logged in' do
  before :each do
    @event = FactoryGirl.create(:event, name: "test event")
    browser_auth(:admin)
  end

  scenario 'can access edit page' do
    visit(edit_event_path(@event))
    expect(page).to have_content('test event')
  end

  scenario 'cannot access new page' do
    visit(new_event_path)
    expect(page).to have_content('test event')
  end
end