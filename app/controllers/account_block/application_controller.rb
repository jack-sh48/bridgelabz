module AccountBlock
  class ApplicationController < BuilderBase::ApplicationController
    # protect_from_forgery with: :exception

    def format_activerecord_errors(errors)
      [{ error: errors.full_messages.first }]
    end
    
  end
end
