# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@ecovet.com'
  layout 'mailer'
end
