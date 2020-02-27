class FindRecordsForRepositories
  def initialize
    @repositories = %w(Book Magazine)
  end

  def call(isbn, author)
    @repositories
      .map{ |model| model.constantize.get_by(isbn, author) }
      .sum
      .sort_by { |item| item.title }
  end
end