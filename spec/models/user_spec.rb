require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(username: 'mrtest', email: 'mrtest@user.com', password: '212341234')
  }

  describe "Validation" do

    it 'is valid with a valid attributes' do
      expect(subject).to be_valid
    end
    
    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).not_to be_valid
    end
    
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it { should validate_presence_of(:username) }
    # it { should validate_uniqueness_of(:username) }
  end

  describe 'Associations' do
    it { should have_many(:tweets) }
    it { should have_many(:likes) }
    it { should have_many(:follower_relationships) }
    it { should have_many(:following_relationships) }
  end
    
end