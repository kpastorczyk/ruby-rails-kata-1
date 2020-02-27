require 'csv'

module Seeds
  class ImportMagazines
    attr_reader :csv_file_path
    DEFAULT_CSV_PATH = Rails.root.join('data', 'magazines.csv')

    def initialize(csv_file_path = DEFAULT_CSV_PATH)
      @csv_file_path = csv_file_path
    end

    def call
      ActiveRecord::Base.transaction do
        magazines_csv.each do |row|
          magazine = Magazine.where(isbn: row.fetch('isbn')).first_or_initialize
          magazine.update_attributes!(remaining_attributes(row))
        end
      end
    end

    private

    def magazines_csv
      CSV.parse(File.read(csv_file_path), headers: true, col_sep: ';')
    end

    def remaining_attributes(row)
      {
        title: row.fetch('title'),
        isbn: row.fetch('isbn'),
        published_at: row.fetch('publishedAt'),
        authors: row.fetch('authors')
      }
    end
  end
end