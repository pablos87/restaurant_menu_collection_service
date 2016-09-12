require 'rails_helper'

RSpec.describe KeywordsMenu, type: :model do
  let(:menu){ Menu.new() }
  let(:keyword){ Keyword.new(name: 'Test')  }
  subject{
    described_class.new(keyword: keyword, menu: menu)
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without keyword and menu" do
      subject.menu = nil
      subject.keyword = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:keyword) }
    it { should belong_to(:menu) }
  end
end
