# encoding: utf-8

require "spec_helper"
feature '', %q{
	As an unregistered user
	I want to see the home/landing page
}do 
	background do
		#put something here
	end

	scenario "Home page" do
		visit "/"
		page.should have_link('Sign In')
		page.should have_selector('title', :content => "Kay Ka Fèt")
		page.should have_content('What is Kay Ka Fèt?')
	end		
end