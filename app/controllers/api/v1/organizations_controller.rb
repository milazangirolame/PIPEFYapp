class Api::V1::OrganizationsController < Api::V1::BaseController
  def index
    @organization = Organization.first
  end
end
