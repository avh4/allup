require 'aruba/cucumber'

allup_dir = File.expand_path('../../../', __FILE__)

raise 'allup build failed' unless system('GOPATH=`pwd` go build -o allup main')

Before do
  set_env 'PATH', "#{allup_dir}:#{ENV['PATH']}"
end