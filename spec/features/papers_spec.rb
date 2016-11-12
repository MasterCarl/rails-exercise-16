require 'rails_helper'

describe 'New paper page' do

  before(:each) do
    @paper = FactoryGirl.build(:paper)
  end

  it 'should render the page' do
    visit new_paper_path
    expect(page).to have_field('Title')
    expect(page).to have_field('Year')
    expect(page).to have_field('Venue')
    expect(page).to have_button('Create Paper')
  end

  it 'should validate the input' do
    @paper.year = nil
    @paper.save()
    expect { Paper.where(title: @paper.title, venue: @paper.venue).take! }.to raise_error ActiveRecord::RecordNotFound
  end
end

describe 'Paper editing page' do
  before(:each) do
    @paper = FactoryGirl.build(:paper)
  end
  it 'should render the page' do
    @paper.save()
    visit edit_paper_path(@paper)
  end
end