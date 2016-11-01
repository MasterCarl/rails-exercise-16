require 'rails_helper'

describe 'authors page' do

  it 'should render the page' do
    visit 'authors/new'
  end
end