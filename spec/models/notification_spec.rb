require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:message) }
  end

  describe "enum validation" do
    it { should define_enum_for(:status).with_values([ :unread, :read ]) }
  end

  describe "callback validation" do
    let(:notification) { create(:notification, status: nil) }
    let(:notification2) { build(:notification, status: :read) }

    it 'set default status' do
      expect(notification.status).to eq("unread")
    end

    it "does not overwrite status if it is already set" do
      notification2.save
      expect(notification2.status).to eq("read")
    end
  end
end
