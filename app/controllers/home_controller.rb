class HomeController < ApplicationController
  before_action :set_items, only: [:index]

  def index
  end

  def search
    @items ||= find_by(params['isbn'])
    render 'index'
  end

  private

  def set_items
    @items ||= Book.all + Magazine.all
  end

  def find_by(isbn)
    Book.where("isbn LIKE '%#{isbn}%'") + Magazine.where("isbn LIKE '%#{isbn}%'")
  end
end
