Ruby Developer Test
The test should take you no more than 3 hours to complete.
Secondly, the test is for us to see how you code and the methodologies you use, what we will be
looking for in this test are the following:
● Functionality
● Efficiency – We like clean, simple code.
● Readability
● Tests (we have 91% test coverage in our code and we aim to get to 99%).
● Also, we would like to understand your ability to use TDD and OO, so please ensure
these are part of your complete test. This is your chance to show us what you can do,
so use it to show us how you design and code!
● Feel free to submit your solution as a link to your version control repository
The test is as follows:
1. ruby_app
Write a ruby script that:
a. Receives a log as argument (webserver.log is provided)
e.g.: ./parser.rb webserver.log
b. Returns the following:
> list of webpages with most page views ordered from most pages views to less page views
e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most
unique page views also ordered
e.g.:
/about/2 8 unique views
/index 5 unique views etc...
Feel free to make changes or design something if you think it meets the criteria above, but would
produce better outcomes and of course.


##notes
- Please run `bundle install` after cloning
- run `./parser.rb webserver.log` to run example
- `rspec` to run tests