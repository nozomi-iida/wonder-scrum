FactoryBot.define do
  factory :project_membership do
    role { 'owner' }
    state { 'inviting' }

    association :project
    association :account
  end
end
