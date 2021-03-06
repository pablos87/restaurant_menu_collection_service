require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject {
    described_class.new(name: 'TestName')
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      subject.date = '2016-09-05'
      expect(subject).to be_valid
    end
    it "is not valid with too long name" do
      subject.name = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      expect(subject).to_not be_valid
    end
    it "is not valid with too long physical description" do
      subject.physical_description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      expect(subject).to_not be_valid
    end
    it "is not valid with too long notes" do
       subject.notes = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
       expect(subject).to_not be_valid
    end
    it "is not valid with negative page_count" do
      subject.page_count = -1
      expect(subject).to_not be_valid
    end
    it "is not valid with negative dish_count" do
      subject.dish_count = -1
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:menu_pages) }
    it { have_and_belong_to_many(:keywords) }
    it { should belong_to(:sponsor) }
    it { should belong_to(:event) }
    it { should belong_to(:venue) }
    it { should belong_to(:place) }
    it { should belong_to(:occasion) }
    it { should belong_to(:language) }
    it { should belong_to(:location) }
    it { should belong_to(:currency) }
    it { should belong_to(:status) }
  end
end

