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

  describe 'GET /index' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end
end
