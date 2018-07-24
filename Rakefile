require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb'] - FileList['test/acceptance/**/*_test.rb']
end

desc 'Run acceptance tests'
Rake::TestTask.new :acceptance do |t|
  t.libs << "test"
  t.test_files = FileList['test/acceptance/**/*_test.rb']
end

task :default => [:test, :acceptance]
