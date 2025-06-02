Rails.application.routes.draw do
  get 'send_email/:id', to: 'issue_emailer#send_email', as: 'send_email'
  post 'send_email/:id', to: 'issue_emailer#send_email'
end