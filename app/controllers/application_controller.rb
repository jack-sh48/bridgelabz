class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  private 

  def current_user
      @account = AccountBlock::Account.find_by(id: @token.id)
  end
end
