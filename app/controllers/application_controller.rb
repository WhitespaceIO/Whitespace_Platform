class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :json, :xml, :js, :html

  protected

  def respond_with_errors(status, errors)
    respond_to do |format|
      format.json { render :json => {:status => Rack::Utils.status_code(status),
                                     :error => errors.full_messages.uniq.flatten.shift.strip},
                           :status => status }
      format.xml { render :xml => {:status => Rack::Utils.status_code(status),
                                   :error => errors.full_messages.uniq.flatten.shift.strip},
                          :status => status }
      format.js { render :layout => false }
    end
  end

  def respond_with_error(status, error)
    error = error.respond_to?(:message) ? error.message : error.to_s
    respond_to do |format|
      format.json { render :json => {:status => Rack::Utils.status_code(status),
                                     :error => error},
                           :status => status }
      format.xml { render :xml => {:status => Rack::Utils.status_code(status),
                                   :error => error},
                          :status => status }
      format.js { render :layout => false }
    end
  end

  def respond_with_nothing(status)
    render status: status,
           nothing: true
  end

  require 'net/http'
  def url_exists?(url)
    uri = url.is_a?(String) ? URI.parse(url) : url
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Head.new(uri.request_uri)
    resp = http.request(req)
    if resp.kind_of?(Net::HTTPRedirection)
      url_exists?(resp['location'])
    else
      resp.code.to_i == 200
    end
  rescue
    false
  end

end
