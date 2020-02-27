require 'csv'

module Seeds
  class ImportAuthors
    attr_reader :csv_file_path
    DEFAULT_CSV_PATH = Rails.root.join('data', 'authors.csv')

    def initialize(csv_file_path = DEFAULT_CSV_PATH)
      @csv_file_path = csv_file_path
    end

    def call
      ActiveRecord::Base.transaction do
        authors_csv.each do |row|
          author = Author.where(email: row.fetch('email')).first_or_initialize
          author.update_attributes!(remaining_attributes(row))
        end
      end
    end

    private

    def authors_csv
      CSV.parse(File.read(csv_file_path), headers: true, col_sep: ';')
    end

    def remaining_attributes(row)
      {
        firstname: row.fetch('firstname'),
        lastname: row.fetch('lastname'),
      }
    end
  end
end