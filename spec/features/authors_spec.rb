require 'rails_helper'

describe 'authors page' do

  it 'should render the page with the correct input fields and buttons' do
    visit 'authors/new'
    expect(page).to have_field('First name')
    expect(page).to have_field('Last name')
    expect(page).to have_field('Homepage')
    expect(page).to have_button('Create Author')
  end
end