class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Koala::Facebook::ClientError do |e|
    render_error(500)
  end

  def render_error(status)
    render file: "#{Rails.root}/public/#{status}.html", status: status
  end
end
