require_relative '../rails_helper'

RSpec.describe 'Categories Page', type: :system do
  include Devise::Test::IntegrationHelpers
  before :all do
    driven_by(:rack_test)
    User.create(name: 'Patrick', email: 'patrick@test.com', password: '123456').encrypted_password
    @user = User.last
    @category = Category.create(name: "car#{rand(10_000)}", icon: 'fa-car', user: @user)
  end

  before :each do
    sign_in @user
  end

  it 'has the category name' do
    visit '/'
    expect(page).to have_content(@category.name)
  end

  it 'should redirect to add new category' do
    visit '/'
    click_on 'Add Category'
    expect(page).to have_current_path(new_category_path)
  end
end
