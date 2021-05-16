# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'launchy'

desc 'delete all files/directories in the temp dir'
task :clear_temp do
  Dir.glob('temp/*').each do |f|
    rm_rf(f, verbose: false)
  end
end

# ***********
# RSpec Tasks
# ***********

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

# *************
# RuboCop Tasks
# *************

require 'rubocop/rake_task'

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
end

# task default: %i[spec rubocop]

# **********
# RDoc Tasks
# **********

require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
  files = %w[README.md LICENSE.txt CHANGELOG.md lib/**/*.rb bin/**/*.rb]
  rdoc.rdoc_files.add(files)
  rdoc.main = 'README' # page to start on
  rdoc.title = 'sync_enum Docs'
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
end

desc 'display RDoc in browser'
task :rdoc_in_browser do
  # Display the rdoc documentation in the system's default browser.
  Launchy.open('doc/rdoc/index.html')
end

desc 'Regenerate RDoc and display in browser'
task rerdoc_in_browser: [:rerdoc] do
  # Display the rdoc documentation in the system's default browser.
  Launchy.open('doc/rdoc/index.html')
end
