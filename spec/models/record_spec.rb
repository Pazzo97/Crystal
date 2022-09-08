require_relative '../rails_helper'

RSpec.describe 'Record', type: :model do
  before :each do
    @user = User.create(name: 'Patrick')
    @record = Record.new(name: 'Purchased a book', amount: 10, user: @user)
    @record.save!
  end

  it 'name must be present' do
    @record.name = nil
    expect(@record).to_not be_valid
  end

  it 'name length must be less then 250 characters' do
    @record.name = 'aaa' * 250
    expect(@record).to_not be_valid
  end

  it 'amount must be present' do
    @record.amount = nil
    expect(@record).to_not be_valid
  end

  it 'amount must be an integer' do
    @record.amount = 'one'
    expect(@record).to_not be_valid
  end
end
