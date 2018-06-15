RailsAdmin.config do |config|
  config.authenticate_with do
    a =  warden.authenticate! scope: :user
    redirect_to main_app.new_user_session_path if a.role == "user"
  end
  config.current_user_method(&:current_user)
  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
