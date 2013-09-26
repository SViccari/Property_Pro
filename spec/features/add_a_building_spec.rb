require 'spec_helper'

feature 'add a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria

  # * I must specify a street address, city, state, and postal code
  # * Only US states can be specified
  # * I can optionally specify a description of the building
  # * If I enter all of the required information in the required format, the building is recorded.
  # * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # * Upon successfully creating a building, I am redirected so that I can record another building.



  scenario 'specify valid information' do 
    visit new_building_url
    fill_in 'Street address', with: '2 China Moon'
    fill_in 'City', with: 'Ormond Beach'
    select 'FL', from: 'State'
    fill_in 'Postal code', with: '12345'
    fill_in 'Description', with: 'Grade A Building'

    click_button 'Save'
    expect(page).to have_content('Building has been saved.')
    expect(Building.count).to eql(prev_count +1 )
  end

  scenario 'specify invalid information' do 
  end 

end