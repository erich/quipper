require "minitest_helper"

describe TasksController do

  subject { TasksController }


  before do
    @task = Fabricate(:task)
  end

  it "must get index" do
    get :index
    @response.status.must_equal 200
  end

  it "must get new" do
    get :new
    assert_response :success
    @response.status.must_equal 200
  end

  it "must create task" do
    post :create, task: @task.attributes
    @response.status.must_equal 302
  end

  it "must show task" do
    get :show, id: @task.to_param
    @response.status.must_equal 200
  end

  it "must get edit" do
    get :edit, id: @task.to_param
    @response.status.must_equal 200
  end

  it "must update task" do
    put :update, id: @task.to_param, task: @task.attributes
    @response.status.must_equal 302
  end

  it "must destroy task" do
    delete :destroy, id: @task.to_param
    @response.status.must_equal 302
  end

end
