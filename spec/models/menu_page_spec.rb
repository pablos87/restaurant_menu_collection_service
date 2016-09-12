require 'rails_helper'

RSpec.describe MenuPage, type: :model do
  let(:menu){ Menu.new }
  subject {
    described_class.new(menu: menu, uuid: '12345678-5sdA-122a-a3kK-12345678uytr')
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid with less or equal to 0 page_number" do
      subject.page_number = 0
      expect(subject).to_not be_valid
    end
    it "is not valid with less or equal to 0 full_height" do
      subject.full_height = 0
      expect(subject).to_not be_valid
    end
    it "is not valid with less or equal to 0 full_width" do
      subject.full_width = 0
      expect(subject).to_not be_valid
    end
    it "is not valid with wrong format of uuid" do
      subject.uuid = 'fds22fsd-sdfsq123we123dfsd-sdfs-fsds-sdf'
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:menu) }
    it { should belong_to(:image) }
    it { should have_many(:menu_items) }
  end
end
