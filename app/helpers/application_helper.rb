module ApplicationHelper

  def pagination_links(collection, options = {})
    options[:renderer] = PaginationHelper::LinkRenderer
    options[:class] = 'pagination pagination-centered'
    options[:inner_window] ||= 2
    options[:outer_window] ||= 1
    will_paginate collection, options
  end

  #Below methods are to enable devise login form on none devise pages

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
