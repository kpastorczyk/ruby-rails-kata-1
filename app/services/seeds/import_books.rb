require 'csv'

module Seeds
  class ImportBooks
    attr_reader :csv_file_path
    DEFAULT_CSV_PATH = Rails.root.join('data', 'books.csv')

    def initialize(csv_file_path = DEFAULT_CSV_PATH)
      @csv_file_path = csv_file_path
    end

    def call
      ActiveRecord::Base.transaction do
        books_csv.each do |row|
          book = Book.where(isbn: row.fetch('isbn')).first_or_initialize
          book.update_attributes!(remaining_attributes(row))
        end
      end
    end

    private

    def books_csv
      CSV.parse(File.read(csv_file_path), headers: true, col_sep: ';')
    end

    def remaining_attributes(row)
      {
        title: row.fetch('title'),
        isbn: row.fetch('isbn'),
        description: row.fetch('description'),
        authors: row.fetch('authors')
      }
    end
  end
end