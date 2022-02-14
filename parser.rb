#!/usr/bin/env ruby
require_relative 'lib/log_parser'

console = PrettyConsoleOutput::Console.new

parser = LogParser.new(ARGV[0])
parser.launch