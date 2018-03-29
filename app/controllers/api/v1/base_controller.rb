class Api::V1::BaseController < ActionController::Base

  rescue_from StandardError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end


  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, message: exception.message, backtrace: exception.backtrace }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end

  def graphql_query
    "{organizations { pipes(ids:335557) { name id phases { name id  description done cards { edges {node { id title createdAt due_date fields { name field {id}} }}}}} }}"
  end

  def get_data_from_pipefy
    @url = 'https://app.pipefy.com/queries'
    response = HTTParty.post(@url,
      :headers => {
        'X-User-Email' => 'pipefydevrecruitingfakeuser@mailinator.com',
        'Authorization' => ' Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyIjp7ImlkIjo2NjE0MCwiZW1haWwiOiJwaXBlZnlkZXZyZWNydWl0aW5nZmFrZXVzZXJAbWFpbGluYXRvci5jb20iLCJhcHBsaWNhdGlvbiI6NDUzOH19.uUX4KIR4m_K-8NwLYhtVpsNnLEoLARebIQiyQDxEm3RZLHCffLrcH-V8RmuJLu8nqE8AQ-SvqUvgz3fe0UyZ4w',
        'Accept' => 'application/json'
      },
      :body => {query: graphql_query})
     @data = response.parsed_response

  end


end
