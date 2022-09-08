require_relative '../rails_helper'

RSpec.describe 'Transactions Page', type: :system do
  include Devise::Test::IntegrationHelpers
  before :all do
    driven_by(:rack_test)
    User.create(name: 'Patrick', email: 'patrick@test.com', password: '123456').encrypted_password
    @user = User.last
    @category = Category.create(name: "car#{rand(10_000)}", icon: 'fa-car', user: @user)
    @transaction = @category.records.create(name: 'fuel', amount: 11, user: @user)
  end

  before :each do
    sign_in @user
  end

  it 'has the transaction name' do
    visit category_transactions_path(@category.id)
    expect(page).to have_content(@transaction.name)
  end

  it 'has the transaction amount' do
    visit category_transactions_path(@category.id)
    expect(page).to have_content(@transaction.amount)
  end
end
