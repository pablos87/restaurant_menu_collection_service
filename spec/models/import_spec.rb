require 'rails_helper'

RSpec.describe Import, type: :model do
  menu_file = ActionDispatch::Http::UploadedFile.new({
    :filename => 'test_menu.csv',
    :type => 'text/csv',
    :tempfile => File.new("#{Rails.root}/spec/support/files/test_menu.csv")
  }) 
  menu_page_file = ActionDispatch::Http::UploadedFile.new({
    :filename => 'test_menu_page.csv',
    :type => 'text/csv',
    :tempfile => File.new("#{Rails.root}/spec/support/files/test_menu_page.csv")
  })
  menu_item_file = ActionDispatch::Http::UploadedFile.new({
    :filename => 'test_menu_item.csv',
    :type => 'text/csv',
    :tempfile => File.new("#{Rails.root}/spec/support/files/test_menu_item.csv")
  })
  dish_file = ActionDispatch::Http::UploadedFile.new({
    :filename => 'test_dish.csv',
    :type => 'text/csv',
    :tempfile => File.new("#{Rails.root}/spec/support/files/test_dish.csv")
  })

  subject{ described_class.new(data_files: [menu_file, menu_page_file, menu_item_file, dish_file])  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid with empty data files" do
      subject.data_files = []
      expect(subject).to_not be_valid
    end
    it "is not valid with some missing file" do
      subject.data_files.slice!(3)
      expect(subject).to_not be_valid
    end
  end
end
