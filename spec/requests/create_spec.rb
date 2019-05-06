require "rails_helper"

RSpec.describe "POST /rating_questions" do
  let(:new_title) { "Hello World" }
  let(:new_tag) { "new tag" }

  context "when the request has a body" do
    before do
      post "/rating_questions.json", params: { rating_question: { title: new_title, tag: new_tag } }
    end

    it "returns a 201 Created" do
      expect(response).to have_http_status(:created)
    end

    it "returns the new document" do
      question = JSON.parse(response.body)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question.key?("id")).to eq(true)
      expect(question["title"]).to eq(new_title)
      expect(question["tag"]).to eq(new_tag)
    end
  end

  context 'when the request has no body' do
    it 'raises an exception' do
      expect{ post '/rating_questions.json' }.to raise_error ActionController::ParameterMissing
    end
  end

  context "when the request has a blank title" do
    before do
      post "/rating_questions.json", params: { rating_question: { title: ""} }
    end

    it "returns a 422 Invalid Resource" do
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "shows errors that the title cannot be blank" do
      error = JSON.parse(response.body)
      expect(error).to eq({"errors" => {"title" => ["can't be blank"]}})
    end
  end
end
