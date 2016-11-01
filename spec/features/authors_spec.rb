require 'rails_helper'

describe 'authors page' do

  it 'should render the page with the correct input fields' do
    visit 'authors/new'
    expect(page).to have_field('First name')
    expect(page).to have_field('Last name')
    expect(page).to have_field('Homepage')
  end
end