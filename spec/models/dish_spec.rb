require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject{
    described_class.new(name: 'TestName')
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
      subject.name = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      expect(subject).to_not be_valid
    end
    it "is not valid with too long description" do
      subject.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      expect(subject).to_not be_valid
    end
    it "is not valid with negative menus_appeared" do
      subject.menus_appeared = -1
      expect(subject).to_not be_valid
    end
    it "is not valid with negative times_appeared" do
      subject.times_appeared = -1
      expect(subject).to_not be_valid
    end
    it "is not valid with negative first_appeared" do
      subject.first_appeared = -1
      expect(subject).to_not be_valid
    end
    it "is not valid with negative last_appeared" do
      subject.last_appeared = -1
      expect(subject).to_not be_valid
    end
    it "is not valid with less or equal to 0 lowest_price" do
      subject.lowest_price = 0
      expect(subject).to_not be_valid
    end
    it "is not valid with less or equal to 0 highest_price" do
      subject.highest_price = 0
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:menu_items) }
  end
end
