require 'spec_helper'
feature "Delete Event", %q{
  As a registered user,
  I want to delete an event
} do
  background do
    Capybara.current_driver = :selenium   #FIRST
    @user = Factory(:user)
    @event = Factory(:event, :user => @user, :name=>"Dead Event Walking")
    login_user @user
  end
  after do                      #afterFIRST
    Capybara.use_default_driver
  end
  scenario "Delete Event" do
    page.should have_content("Dead Event Walking")
    page.should have_selector("form[action='/events/#{@event.id}'] input[value='delete']") #SECOND
    # auto confirm the dialog
    page.execute_script('window.confirm = function() {return true;}')   #FIRST
    click_button "X"
    page.should_not have_content("Dead Event Walking")
  end
end
