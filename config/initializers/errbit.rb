Airbrake.configure do |c|
  c.project_id = 1
  c.project_key = ENV['AIRBRAKE_KEY'] || "empty"
  c.host = ENV['AIRBRAKE_HOST']
  c.root_directory = Rails.root
  c.logger = Rails.logger
  c.environment = Rails.env
  c.ignore_environments = %w(test)
  c.blacklist_keys = [/password/i, /authorization/i]
end
