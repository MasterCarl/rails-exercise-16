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
    @paper.save()
  end
  it 'should render the page' do
    visit edit_paper_path(@paper)
  end

  it 'should allow to select 5 authors from 5 separate drop downs' do
    visit edit_paper_path(@paper)
    (1..5).each do |number|
      expect(page).to have_select("paper_author_id_#{ number }")
    end
  end

  it 'should update the authors' do
    @author = Author.new(first_name: 'Peter', last_name: 'Plagiarist', homepage: "http://wikipedia.de/alan_turing")
    @author.save()
    visit edit_paper_path(@paper)
    select(@author.name, from: 'Author 2')
    click_button('Update Paper')
    #expect(@paper.authors).to include(@author)
  end
end

describe 'Paper page' do
  before(:each) do
    @paper = FactoryGirl.build(:paper)
  end

  it 'should display the paper\'s details' do
    @paper.save()
    visit paper_path(@paper)
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.venue)
    expect(page).to have_text(@paper.year)
  end

  it 'should have a link to the edit paper page' do
    @paper.save()
    visit paper_path(@paper)
    expect(page).to have_link('Edit', href: edit_paper_path(@paper))
  end

  it 'should display the authors' do
    @paper.save()
    visit paper_path(@paper)
    @paper.authors.each do |author|
      expect(page).to have_text author.last_name
    end
  end
end