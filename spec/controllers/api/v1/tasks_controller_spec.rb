describe Api::V1::TasksController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/v1, #{Mime::JSON}" }
  before(:each) { request.headers['Content-Type'] = Mime::JSON.to_s }

  describe "GET #index" do
    before(:each) do
      @automobile = FactoryGirl.create :automobile
      get :show, id: @automobile.id, format: :json
    end

    it "show a list of all tasks" do        
      get :index, automobile_id: @automobile.id
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @automobile = FactoryGirl.create :automobile
        get :show, id: @automobile.id, format: :json

        #@task_attributes = FactoryGirl.attributes_for :task
        task_attributes = FactoryGirl.build(:tasks_hash, path:"/tasks", is_dir:false)
        post :create, { task: @task_attributes }, format: :json
      end

      it "creates an array of maintenance tasks" do
        expect(json_response[:model]).to eql @task_attributes[:model]
      end

      it "renders the json representation for the task records just created" do
        expect(json_response[:model]).to eql @task_attributes[:model]
      end

      it { is_expected.to respond_with 201 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      #@task = FactoryGirl.create :task
      @tasks = FactoryGirl.build(:tasks_hash, path:"/tasks", is_dir:false)
      delete :destroy, @tasks, format: :json
    end

    it { is_expected.to respond_with 204 }
  end
end
