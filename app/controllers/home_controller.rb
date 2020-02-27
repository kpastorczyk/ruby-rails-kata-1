class HomeController < ApplicationController
  before_action :set_items, only: [:index]

  def index
  end

  def search
    @items ||= find_by(params['isbn'], params['author'])
    render 'index'
  end

  private

  def set_items
    @items ||= Book.all + Magazine.all
  end

  def find_by(isbn, author)
    %w(Book Magazine).map{|model| model.constantize.find_by(isbn, author) }
  end
end
