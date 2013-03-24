require "spec_helper"

feature 'User Events Page', %q{
	As a signed in user
	I want to see my events
	on my events page
}do
	background do
		@user = FactoryGirl.create(:user)
		@event = FactoryGirl.create(:event, :user => @user)
	end
	scenario "User is not signed in" do
		visit events_path
		current_path.should == new_user_session_path
	end	
end

feature 'Signed In User Events Page', %q{
	As a signed in user
	I want to see my events
	on my events page
}do 
	background do
		@user = FactoryGirl.create(:user)
		@event = FactoryGirl.create(:event, :user => @user)
		login_user(@user)
	end	
	scenario "User is signed in" do
		visit events_path
		page.should have_content(@user.name)
		page.should have_content(@event.name)
	end
end