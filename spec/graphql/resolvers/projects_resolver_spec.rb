require 'rspec'

Rspec.describe Resolvers::ProjectsResolver do
  subject(:resolver) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account, :with_projects) }
  let(:context) { { current_account: account } }

  describe '#resolver' do
    subject(:result) { mutation.resolve }
    it 'get projects created by current_account' do
      debugger
      expect(result).to all(be_a(Project))
    end
  end
end