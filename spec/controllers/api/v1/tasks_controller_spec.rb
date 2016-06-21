describe Api::V1::TasksController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/v1, #{Mime::JSON}" }
  before(:each) { request.headers['Content-Type'] = Mime::JSON.to_s }

  ## TODO: "GET #index"

  ## TODO: "POST #create"

  ## TODO: "DELETE #destroy" 
end
