require "minitest_helper"

describe UsersController do

  subject { UsersController }

  # fixtures :all

  before do
    @user = Fabricate(:user)
  end

  it "must get index" do
    get :index
    @response.status.must_equal 200
  end

  it "must get new" do
    get :new
    @response.status.must_equal 200
  end

  it "must create user" do
    post :create, user: @user.attributes
    @response.status.must_equal 302
  end

  it "must show user" do
    get :show, id: @user.to_param
    @response.status.must_equal 200
  end

  it "must get edit" do
    get :edit, id: @user.to_param
    @response.status.must_equal 200
  end

  it "must update user" do
    put :update, id: @user.to_param, user: @user.attributes
    @response.status.must_equal 302
  end

  it "must destroy user" do
    delete :destroy, id: @user.to_param
    @response.status.must_equal 302
  end

end
