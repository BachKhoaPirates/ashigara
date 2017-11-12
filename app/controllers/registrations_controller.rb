class UsersController < ApplicationController
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
