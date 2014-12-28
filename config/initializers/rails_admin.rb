RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  # Erik: I put in this code to create a log-in page for rails_admin.
  config.authenticate_with do
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' &&
      password == 'rx0001'
    end
  end
  
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

  #config.model Competition do
  #end
  #Added config.model to get rails_admin to stop saying Could not find table 'sm_sloans'
  #What it does is list the error in terminal
  #View full instructions here : https://github.com/sferik/rails_admin/issues/289
  #config.model Competition do
  #end



    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
