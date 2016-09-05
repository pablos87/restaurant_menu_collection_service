require 'csv'

class Import
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :data_files

  validates :data_files, :presence => true
  validate :data_files_format, unless: Proc.new { |i| i.data_files.blank? }
  validate :data_files_headers, unless: Proc.new { |i| i.data_files.blank? }

  MENU_HEADER = [:id, :name, :sponsor, :event, :venue, :place,
		 :physical_description, :occasion, :notes, :call_number,
		 :keywords, :language, :date, :location, :location_type,
		 :currency, :currency_symbol, :status, :page_count,
		 :dish_count]
  DISH_HEADER = [:id, :name, :description, :menus_appeared, :times_appeared,
                 :first_appeared, :last_appeared, :lowest_price,
		 :highest_price]
  MENU_ITEM_HEADER = [:id, :menu_page_id, :price, :high_price, :dish_id,
                     :created_at, :updated_at, :xpos, :ypos]
  MENU_PAGE_HEADER = [:id, :menu_id, :page_number, :image_id, :full_height,
                      :full_width, :uuid]

  def initialize(params = {})
    self.data_files = params[:data_files]
  end

  def persisted?
    false
  end

  def parse_files
    print_memory_usage do
      print_time_spent do
        sum = 0
	data_files.each do |file|
          model_name = ''
          CSV.foreach(file.path, headers: true) do |row|
            model_name = get_model_name(row.headers) if model_name.blank?
	    sum += 1
          end
	  model_name = ''
          puts "Sum: #{sum}"
        end
      end
    end
  end

  private

  def data_files_headers
    data_files.each do |file|
      CSV.foreach(file.path, headers: true) do |row|
        if get_model_name(row.headers).blank?
          errors.add(:data_files, "Invalid headers in CSV file #{file.original_filename}")
        end
        break
      end
    end
  end

  def get_model_name(headers)
    case headers.map(&:to_sym)
    when MENU_HEADER
      'Menu'
    when DISH_HEADER
      'Dish'
    when MENU_ITEM_HEADER
      'MenuItem'
    when MENU_PAGE_HEADER
      'MenuPage'
    else
      ''
    end
  end

  def data_files_format
    unless data_files.all?{ |file| file.content_type == 'text/csv' }
      errors.add(:data_files, "Invalid file format - csv files required")
    end
  end

  def print_memory_usage
    memory_before = `ps -o rss= -p #{Process.pid}`.to_i
    yield
    memory_after = `ps -o rss= -p #{Process.pid}`.to_i
    puts "Memory: #{((memory_after - memory_before) / 1024.0).round(2)} MB"
  end

  def print_time_spent
    time = Benchmark.realtime do
      yield
    end
    puts "Time: #{time.round(2)}"
  end

end
