class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with :name => ENV['ADMIN_NAME'], :password => ENV['ADMIN_PASSWORD']

  def new
  end

  def index
    @categories = Category.order(id: :desc).all
  end

  def create
  end
end
