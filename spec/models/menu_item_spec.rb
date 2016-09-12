require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let(:menu){ Menu.new }
  let(:menu_page){ MenuPage.new(menu: menu) }
  let(:dish){ Dish.new(name: 'TestDish') }
  subject {
    described_class.new(menu_page: menu_page, dish: dish)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid with less or equal to 0 price" do
      subject.price = 0
      expect(subject).to_not be_valid
    end
    it "is not valid with less or equal to 0 high price" do
      subject.high_price = 0
      expect(subject).to_not be_valid
    end
    it "is not valid with negative xpos" do
      subject.xpos = -1
      expect(subject).to_not be_valid
    end
    it "is not valid with negative ypos" do
      subject.ypos = -1
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:dish) }
    it { should belong_to(:menu_page) }
  end
end
