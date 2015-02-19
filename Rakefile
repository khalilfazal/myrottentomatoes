# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Myrottenpotatoes::Application.load_tasks

task start: :environment do
    system 'rake db:reset'
    system 'rails server -p 3001'
end
