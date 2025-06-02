class IssueEmailerController < ApplicationController
  before_action :find_issue

  def send_email
    if request.post?
      to = params[:to]
      subject = "Issue ##{@issue.id} - #{@issue.subject}"
      body = params[:body]
  
      Rails.logger.info("Email Body from form: #{body.inspect}")
      # render plain: "Debug: #{body.inspect}" and return
      begin
        IssueMailer.issue_email(@issue, to, subject, body).deliver_now
        flash[:notice] = "Email sent"
      rescue => e
        flash[:error] = "Failed to send email: #{e.message}"
      end
  
      redirect_to issue_path(@issue)
    end
  end

  private

  def find_issue
    @issue = Issue.find(params[:id])
  end
end