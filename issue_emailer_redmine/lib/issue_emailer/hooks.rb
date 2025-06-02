module IssueEmailer
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_show_details_bottom, partial: 'issue_emailer/send_button'
  end
end