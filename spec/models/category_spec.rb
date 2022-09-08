require_relative '../rails_helper'

RSpec.describe 'Category', type: :model do
  before :each do
    @user = User.new(name: 'Patrick')
    @category = Category.new(name: 'Books', icon: 'fa-books', user: @user)
    @category.save!
  end

  it 'name is required' do
    @category.name = ''
    expect(@category).to_not be_valid
  end

  it 'name must be less then 250 chars' do
    @category.name = 'aaa' * 250
    expect(@category).to_not be_valid
  end

  it 'icon is required' do
    @category.icon = ''
    expect(@category).to_not be_valid
  end

  it 'icon must be less then 250 chars' do
    @category.icon = 'aaa' * 250
    expect(@category).to_not be_valid
  end
end
