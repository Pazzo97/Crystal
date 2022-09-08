require_relative '../rails_helper'

RSpec.describe 'User', type: :model do
  subject { User.new(name: 'Patrick', email: 'test@test.com', password: '123456') }
  before { subject.save! }

  it 'name is required' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should not be over 250 chars' do
    subject.name = 'aaa' * 256
    expect(subject).to_not be_valid
  end
end
