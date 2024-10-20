require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  describe "POST #create" do
    context "when notifiction is created successfully" do
      let(:notification_valid) { attributes_for(:notification, status: :unread) }
      let(:url) { "/notifications" }

      it "returns a successful response" do
        post url, params: { notification: notification_valid }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response["message"]).to eq("Notification receives successfully")

        expect(Notification.count).to eq(1)
        expect(Notification.last.title).to eq(notification_valid[:title])
      end
    end
  end
end
