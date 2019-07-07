# log_parser
A sample web server log parser
This is implemented using ruby 2.3.1
The parser takes a log file (.log extension only) and counts the total and unique occurences of each page visit. It displays them in descending order.
Following gem is used to pretty format output on console
  gem 'pretty_console_output' 
  
RSpec is used to describe intnded behaviour of the parser and few sample test cases are added as well.
