class HomeController < ApplicationController
  before_action :set_items

  def index
  end

  private

  def set_items
    @items ||= Book.select(:isbn, :title, :authors).all + Magazine.select(:isbn, :title, :authors).all
  end
end
