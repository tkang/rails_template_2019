Rails.application.config.to_prepare do
  GraphiQL::Rails::EditorsController.send :prepend, GraphiQLRailsEditorsControllerDecorator
end
