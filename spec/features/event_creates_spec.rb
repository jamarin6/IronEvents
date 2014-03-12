require 'spec_helper'

feature 'Event creation' do 

	scenario 'creating an event' do

		visit new_event_url

		fill_in "event_name", with: "Evento de prueba"
		fill_in "event_description", with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam, dicta, deserunt, atque voluptate molestiae a ea distinctio voluptas esse laborum dolor itaque mollitia aperiam quaerat earum minus at sunt. Ullam."

		fill_in "event_start_at", with: "01-01-2014"
		fill_in "event_end_at", with: "02-01-2014"

		click_button "Create new"

		page.should have_content "Evento de prueba"
	end
	
end