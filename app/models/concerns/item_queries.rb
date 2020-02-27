module ItemQueries
  extend ActiveSupport::Concern

  def get_by(isbn, author)
    current = self
    current = current.where("isbn LIKE '%#{isbn}%'") unless isbn.empty?
    current = current.where("authors LIKE '%#{author}%'") unless author.empty?
    current
  end
end