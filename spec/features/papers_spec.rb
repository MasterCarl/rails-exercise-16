require 'rails_helper'

describe 'New paper page' do

  before(:each) do
    @author = FactoryGirl.build(:author)
  end

  it 'should render the page' do
    visit new_paper_path
    expect(page).to have_field('Title')
    expect(page).to have_field('Year')
    expect(page).to have_field('Venue')
    expect(page).to have_button('Create Paper')
  end

end