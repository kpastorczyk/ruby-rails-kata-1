class HomeController < ApplicationController
  before_action :set_items, only: [:index]

  def index
  end

  def search
    @items ||= FindRecordsForRepositories.new.call(params['isbn'], params['author'])
    render 'index'
  end

  private

  def set_items
    @items ||= Book.all + Magazine.all
  end
end
