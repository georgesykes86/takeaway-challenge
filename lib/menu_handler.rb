require 'csv'
require 'find'

class Menu_handler

  attr_reader :file_summaries

  ROOT = '/Users/georgesykes/Projects/MakersAcademy/WeekendChallenges/takeaway-challenge/resources/menus/'

  def initialize(root = ROOT)
    @root = root
    @file_summaries = []
    get_summaries
  end

  def get_menu_items(category)
    path = @file_summaries.select { |file_sum| file_sum[:category] == category }.first[:path]
    load_menu_items(path)
  end

  private

  def get_files
    csv_files = []
    Find.find(@root) do |path|
      csv_files << path if path =~ /.*\.csv$/
    end
    csv_files
  end

  def get_summaries
    get_files.each do |file_path|
      load_summaries(file_path)
    end
  end

  def load_summaries(filepath)
    CSV.open(filepath) do |csv|
      flag, category, summary = csv.first
      if flag == "Description"
      @file_summaries << { path: filepath,
                           summary: summary,
                           category: category
                         }
      end
    end
  end

  def load_menu_items(filepath)
    menu_items = []
    CSV.foreach(filepath) do |line|
      title, description, price = line
      next if title == "Description"
      menu_items << { item: title, description: description, price: price }
    end
    menu_items
  end

end
