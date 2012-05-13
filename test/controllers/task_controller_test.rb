require "minitest_helper"

describe TaskController do

  subject { TaskController }

  # fixtures :all

  before do
    @task = tasks(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create task" do
    assert_difference('Task.count') do
      post :create, task: @task.attributes
    end

    assert_redirected_to task_path(assigns(:task))
  end

  it "must show task" do
    get :show, id: @task.to_param
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @task.to_param
    assert_response :success
  end

  it "must update task" do
    put :update, id: @task.to_param, task: @task.attributes
    assert_redirected_to task_path(assigns(:task))
  end

  it "must destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task.to_param
    end

    assert_redirected_to tasks_path
  end

end
