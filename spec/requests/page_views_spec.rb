require "rails_helper"

RSpec.describe "PageViews API", type: :request do
  let!(:page_views) { create_list(:page_view, 10) }
  let(:page_view_id) { page_views.first.id }

  describe "GET /page_views" do
    before { get "/page_views" }

    it "returns page views" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /page_views/:id' do
    before { get "/page_views/#{page_view_id}" }

    context 'when the record exists' do
      it 'returns the page_view' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(page_view_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:page_view_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PageView/)
      end
    end
  end

  describe 'POST /page_views' do
    let(:valid_attributes) {
      {
        viewed_at: DateTime.now,
        utm_source: "Twitter",
        utm_campaign: "Testing",
        utm_medium: "RSPEC"
      }
    }

    context 'when the request is valid' do
      before { post '/page_views', params: valid_attributes }

      it 'creates a page_view' do
        expect(json["utm_source"]).to eq("Twitter")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/page_views', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Viewed at can't be blank, Utm source can't be blank, Utm campaign can't be blank, Utm medium can't be blank/)
      end
    end
  end

  describe 'PUT /page_views/:id' do
    let(:valid_attributes) {
      {
        viewed_at: DateTime.now,
        utm_source: "Twitter",
        utm_campaign: "Testing",
        utm_medium: "RSPEC"
      }
    }

    context 'when the record exists' do
      before { put "/page_views/#{page_view_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /page_views/:id' do
    before { delete "/page_views/#{page_view_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
