FactoryBot.define do
  factory :notification do
    title { "Title of Notification" }
    message { "Message of Notification" }
    status { nil }
  end
end
