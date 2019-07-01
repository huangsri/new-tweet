require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:user) { User.new(username: 'mrtest', email: "mrtest@user.com", password: "12341234") }

  subject {
    described_class.new(content: 'my second tweet maybe', user: user)
  }

  describe 'validation' do
    it "is not valid without a content" do
      subject.content = nil
      expect(subject).not_to be_valid
    end
    
    it "is valid with a content and user" do
      expect(subject).to be_valid
    end
    
    it "is not valid without a user" do
      subject.user = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'Association' do
    it { should belong_to(:user) }
    it { should belong_to(:parent) }
    it { should have_many(:retweets)}
    it { should have_many(:replies)}
    it { should have_many(:likes)}
    it { should have_many(:tags)}
  end
end
