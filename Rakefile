# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

if ENV['CIRCLE_ARTIFACTS']
  require 'coveralls/rake/task'
  Coveralls::RakeTask.new
end

Rails.application.load_tasks
