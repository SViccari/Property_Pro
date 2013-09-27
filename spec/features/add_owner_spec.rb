require 'spec_helper'

feature 'add a building owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do 

  # Acceptance Criteria
  # * I must specify a building owner's first name, last name, 
  #   and email address

  # * I can optionally specify a company name

  # * If I specify the required information, 
  #   the owner is recorded and I am redirected to enter 
  #   another new owner

  # * If I do not specify the required information, 
  #   I am presented with errors

  scenario 'specify valid owner information' do 
    #---totally not DRY...but it's green---
    visit new_owner_url
    fill_in 'First name', with: 'Lloyd'
    fill_in 'Last name', with: 'Christmas'
    fill_in 'Email', with: 'mostannoyingsound@gmail.com'
    fill_in 'Company name', with: 'The Rockies'

    click_button 'Save'
    expect(page).to have_content('Information has been saved.')
  end

  scenario 'specify invalid information' do
    visit new_building_url

    click_button 'Save'
    expect(page).to have_content("can't be blank")
  end 

end 