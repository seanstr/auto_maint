describe Api::V1::AutomobilesController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/v1, #{Mime::JSON}" }
  before(:each) { request.headers['Content-Type'] = Mime::JSON.to_s }

  describe "GET #index" do
    it "show a list of all automobiles" do        
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    before(:each) do
      @automobile = FactoryGirl.create :automobile
      get :show, id: @automobile.id, format: :json
    end

    it "returns the information about an automobile on a hash" do
      automobile_response = json_response
      expect(automobile_response[:model]).to eql @automobile.model
    end

    it { is_expected.to respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @automobile_attributes = FactoryGirl.attributes_for :automobile
        post :create, { automobile: @automobile_attributes }, format: :json
      end

      it "renders the json representation for the automobile record just created" do
        automobile_response = json_response
        expect(automobile_response[:model]).to eql @automobile_attributes[:model]
      end

      it { is_expected.to respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_automobile_attributes = { fuel_mode: "12345678",
                            year: "AAAAA" }
        post :create, { automobile: @invalid_automobile_attributes },
                                format: :json
      end

      it "renders an errors json" do
        automobile_response = json_response
        expect(automobile_response).to have_key(:errors)
      end

      it "renders the json errors on why the automobile could not be created" do
        automobile_response = json_response
        expect(automobile_response[:errors]).to include("Invalid")
      end

      it { is_expected.to respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @automobile = FactoryGirl.create :automobile
    end

    context "when successfully updated" do
      before(:each) do
        patch :update, { id: @automobile.id, automobile: { model: "Toyota" } },
                         format: :json
      end

      it "renders the json representation for the updated automobile" do
        automobile_response = json_response
        expect(automobile_response[:model]).to eql "Toyota"
      end

      it { is_expected.to respond_with 200 }
    end

    context "when not updated" do
      before(:each) do
        patch :update, { id: @automobile.id, automobile: { year: "AAAAA" } },
                         format: :json
      end

      it "renders an errors json" do
        automobile_response = json_response
        expect(automobile_response).to have_key(:errors)
      end

      it "renders the json errors on why the automobile could not be created" do
        automobile_response = json_response
        expect(automobile_response[:errors][:year][0]).to include "not a number"
      end

      it { is_expected.to respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @automobile = FactoryGirl.create :automobile
      delete :destroy, { id: @automobile.id }, format: :json
    end

    it { is_expected.to respond_with 204 }
  end
end
