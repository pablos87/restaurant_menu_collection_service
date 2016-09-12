require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location_type){ LocationType.new(name: 'Test') }
  subject {
    described_class.new(name: 'TestLocation',
                        location_type: location_type)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end
    it "is not valid with empty name" do
       subject.name = nil
       expect(subject).to_not be_valid
    end
    it "is not valid with too long name" do
      subject.name = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea c
ommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      expect(subject).to_not be_valid
    end
    it "is not valid without location_type" do
      subject.location_type = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:location_type) }
    it { should have_many(:menus) }
  end
end
