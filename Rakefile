require 'rake/testtask'

task :run do
  ruby 'lib/main.rb'
end

Rake::TestTask.new do |t|
  t.libs << 'tests'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
