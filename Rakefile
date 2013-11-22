require 'bundler/setup'
require 'thread'
require 'launchy'

# Usage: rake s
task :s do
	sh 'middleman server'
end

# Usage: rake o
task :o do
	Launchy.open 'http://localhost:4567/'
end

# Usage: rake p
task :p do
	message = "Blog updated at #{Time.now.strftime('%Y-%m-%d')}"
	sh "cd build/"
	sh "git add ."
	sh "git commit -m \"#{message}\""
	sh "cd ../"
	sh "middleman deploy"
end
