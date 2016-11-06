require 'rails_helper'

describe 'authors page' do

  it 'should render the page with the correct input fields and buttons' do
    visit 'authors/new'
    expect(page).to have_field('First name')
    expect(page).to have_field('Last name')
    expect(page).to have_field('Homepage')
    expect(page).to have_button('Create author')
  end

  it "should create a new author instance when data is submitted" do
    @author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
    expect(@author).not_to be_nil
  end

  it 'should return the full name' do
    @author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
    expect(@author.name).to eq('Alan Turing')
  end

  it 'should save the author if created on the new authors page' do
    visit 'authors/new'
    @author = build(:author)
    fill_in 'First name', :with => @author.first_name
    fill_in 'Last name', :with => @author.last_name
    fill_in 'Homepage', :with => @author.homepage
    click_button 'Create author'
    expect(Author.find_by(first_name: @author.first_name, last_name: @author.last_name, homepage: @author.homepage)).to_not be_nil
  end

end