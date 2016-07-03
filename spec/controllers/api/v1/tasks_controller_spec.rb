describe Api::V1::TasksController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/v1, #{Mime::JSON}" }
  before(:each) { request.headers['Content-Type'] = Mime::JSON.to_s }

  describe "GET #index" do
   	let!(:gasoline) {FactoryGirl.create(:gasoline)}
    let!(:maintenance_task) {FactoryGirl.create(:maintenance_task)}

   	puts Gasoline.inspect
   	#puts 'Gasoline.maintenance_tasks'
   	#puts Gasoline.maintenance_tasks

    it "shows an automobile and a list of its tasks" do 
      get :index, gasoline_id: 1, type: :gasoline, format: :json
      expect(response).to be_success
    end
  end

  describe "POST #create" do
	  let!(:gasoline) {FactoryGirl.create(:gasoline)}
	  let!(:maintenance_task) {FactoryGirl.create(:maintenance_task)}
  	before(:each) do
      post :create, gasoline_id: 1, type: :gasoline, format: :json, maintenance_tasks: [1]
	  end

    it "returns the information about an automobile in a hash" do
      expect(response).to be_success
      	task_response = json_response
	      expect(task_response[:model]).to eql "3"
    end

    it { is_expected.to respond_with 201 }
  end

  describe "DELETE #destroy" do
   	let!(:gasoline) {FactoryGirl.create(:gasoline)}
   	let!(:maintenance_task) {FactoryGirl.create(:maintenance_task)}

    before(:each) do
      delete :destroy, gasoline_id: 1, id: 1, type: :gasoline, format: :json
    end

    it { is_expected.to respond_with 204 }
  end
end
