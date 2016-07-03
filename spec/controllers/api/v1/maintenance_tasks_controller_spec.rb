describe Api::V1::MaintenanceTasksController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/v1, #{Mime::JSON}" }
  before(:each) { request.headers['Content-Type'] = Mime::JSON.to_s }

  describe "GET #index" do
    it "show a list of all maintenance tasks" do        
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    before(:each) do
      @maintenance_task = FactoryGirl.create :maintenance_task
      get :show, id: @maintenance_task.id, format: :json
    end

    it "returns the information about a maintenance tasks on a hash" do
      maintenance_task_response = json_response
      expect(maintenance_task_response[:name]).to eql @maintenance_task.name
    end

    it { is_expected.to respond_with 200 }
  end

  describe "POST #create" do
    context "when successfully created" do
      before(:each) do
        @maintenance_task_attributes = FactoryGirl.attributes_for :maintenance_task
        post :create, { maintenance_task: @maintenance_task_attributes }, format: :json
      end

      it "renders the json representation for the maintenance task record just created" do
        expect(json_response[:name]).to eql @maintenance_task_attributes[:name]
      end

      it { is_expected.to respond_with 201 }
    end

    context "when not created" do
      before(:each) do
        @invalid_maintenance_task_attributes = FactoryGirl.attributes_for :invalid_maintenance_task
        post :create, { maintenance_task: @invalid_maintenance_task_attributes }, format: :json
      end

      it "renders an errors json" do
        expect(json_response).to have_key(:errors)
      end

      it "renders the json errors on why the maintenance task could not be created" do
        expect(json_response[:errors][:name]).to include("can't be blank")
      end

      it { is_expected.to respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @maintenance_task = FactoryGirl.create :maintenance_task
    end

    context "when successfully updated" do
      before(:each) do
        patch :update, format: :json, id: @maintenance_task.id, maintenance_task: { name: "glow plugs" }
      end

      it "renders the json representation for the updated maintenance task" do
        maintenance_task_response = json_response
        expect(maintenance_task_response[:name]).to eql "glow plugs"
      end

      it { is_expected.to respond_with 200 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @maintenance_task = FactoryGirl.create :maintenance_task
      delete :destroy, format: :json, id: @maintenance_task.id
    end

    it { is_expected.to respond_with 204 }
  end
end
