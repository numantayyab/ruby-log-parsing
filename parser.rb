
require_relative 'log_parser'
require 'pretty_console_output'

console = PrettyConsoleOutput::Console.new


## if more than one files are passed in arguments, 
if ARGV.length > 1
	console.error "Only first argument will be considered as file name.\n"
end

file = ARGV[0].strip


# we should only allow log files to be parsed. 
begin
	parser = LogParser.new(file)
	parser.parse_file 
rescue StandardError => e
	console.error "There is an issue in parsing file:\n #{e.message}"
rescue Exception => e
	## incase we have invalid encoding of the file
	console.error "Something went wrong while parsing this file\n #{e.message}"
end