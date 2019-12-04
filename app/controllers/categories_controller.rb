class CategoriesController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update]
end
