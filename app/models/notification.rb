class Notification < ApplicationRecord
  validates :title, :message, presence: true

  enum status: { unread: 0, read: 1 }

  before_create :set_status_default

  private

  def set_status_default
    self.status ||= :unread
  end
end
