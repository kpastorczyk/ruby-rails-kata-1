module ItemQueries
  def self.find_by(isbn, author)
    current = self
    current = current.where("isbn LIKE '%#{isbn}%'") unless isbn.empty?
    current = current.where("author LIKE '%#{author}%'") unless author.empty?
    current
  end
end