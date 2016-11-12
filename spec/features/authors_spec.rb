require 'rails_helper'

describe 'New author page' do

  before(:each) do
    @author = FactoryGirl.build(:author)
  end

  it 'should render the page with the correct input fields and buttons' do
    visit 'authors/new'
    expect(page).to have_field('First name')
    expect(page).to have_field('Last name')
    expect(page).to have_field('Homepage')
    expect(page).to have_button('Create Author')
  end

  it "should create a new author instance when data is submitted" do
    expect(@author).not_to be_nil
  end

  it 'should return the full name' do
    expect(@author.name).to eq('Alan Turing')
  end

  it 'should save the author if created on the new authors page' do
    visit 'authors/new'
    fill_in 'First name', :with => @author.first_name
    fill_in 'Last name', :with => @author.last_name
    fill_in 'Homepage', :with => @author.homepage
    click_button 'Create Author'
    Author.where(first_name: @author.first_name, last_name: @author.last_name, homepage: @author.homepage).take!
  end

  it 'should be saved' do
    @author.save
    Author.where(first_name: 'Alan', last_name: 'Turing').take!
  end

  it 'should validate the input' do
    @author.first_name = nil
    @author.save()
    expect(Author.exists?(@author)).to be false
  end
end

describe 'Author edit page' do

  before(:each) do
    @author = FactoryGirl.build(:author)
  end
  it 'should render' do
    @author.save()
    visit edit_author_path(@author)
    expect(page).to_not be_nil
    expect(page).to have_text(@author.first_name)
  end

  it 'should update the author' do
    @author.save()
    visit edit_author_path(@author)
    fill_in 'First name', :with => 'Carl'
    click_button 'Update Author'
    Author.where(first_name: 'Carl', last_name: @author.last_name, homepage: @author.homepage).take!
  end
end

describe 'Author page' do
  before(:each) do
    @author = FactoryGirl.build(:author)
  end

  it 'should display the author\'s details' do
    @author.save()
    visit author_path(@author)
    expect(page).to have_text(@author.first_name)
    expect(page).to have_text(@author.last_name)
    expect(page).to have_text(@author.homepage)
  end

  it 'should have a link to the edit author page' do
    @author.save()
    visit author_path(@author)
    expect(page).to have_link('Edit', href: edit_author_path(@author))
  end
end

describe 'Authors page' do
  it 'should render the page' do
    visit authors_path
    expect(page).not_to be_nil
  end

  it 'should have a link to the new author page' do
    visit authors_path
    expect(page).to have_link('Add author', href: new_author_path)
  end
end