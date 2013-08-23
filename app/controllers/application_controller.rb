class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :json, :xml, :html, :js

  protected

  def respond_with_errors(status, errors)
    respond_to do |format|
      format.json { render :json => {:status => Rack::Utils.status_code(status),
                                     :error => errors.full_messages.uniq.flatten.shift.strip},
                           :status => status }
      format.xml { render :xml => {:status => Rack::Utils.status_code(status),
                                   :error => errors.full_messages.uniq.flatten.shift.strip},
                          :status => status }
    end
  end

  def respond_with_nothing(status)
    render status: status,
           nothing: true
  end

end
