require "minitest_helper"

describe TasksController do

  subject { TasksController }


  before do
    @task = Fabricate(:task)
    @user = Fabricate(:user)
  end

  it "must get index" do
    get :index, user_id: @user
    @response.status.must_equal 200
  end

  it "must get new" do
    get :new, user_id: @user
    assert_response :success
    @response.status.must_equal 200
  end

  it "must create task" do
    post :create, task: @task.attributes, user_id: @user
    @response.status.must_equal 302
  end

  it "must show task" do
    get :show, id: @task.to_param, user_id: @user
    @response.status.must_equal 200
  end

  it "must get edit" do
    get :edit, id: @task.to_param, user_id: @user
    @response.status.must_equal 200
  end

  it "must update task" do
    put :update, id: @task.to_param, task: @task.attributes, user_id: @user
    @response.status.must_equal 302
  end

  it "must destroy task" do
    delete :destroy, id: @task.to_param, user_id: @user
    @response.status.must_equal 302
  end

end
