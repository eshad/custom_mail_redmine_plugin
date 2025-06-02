class IssueMailer < ActionMailer::Base
  default from: 'Redmine Admin <smokewareltd@gmail.com>'

  def issue_email(issue, to, subject, body)
    @issue = issue
    @body = body

    Rails.logger.info("Sending HTML email to #{to}")
    Rails.logger.info("Email body length: #{@body.to_s.length}")

    mail(to: to, subject: subject) do |format|
      format.html { render inline: @body.html_safe }
    end
  end
end