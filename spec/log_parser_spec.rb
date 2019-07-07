require './log_parser'

RSpec.describe LogParser, "initiation" do
	context "initialize without arguments" do
		it "should raise an ArgumentError" do
			expect{LogParser.new}.to raise_error(ArgumentError)
		end
	end	



	context "Invalid File" do
		it "should raise an InvalidFileException" do
			expect{LogParser.new("test.html")}.to raise_error(LogParser::InvalidFileException)
		end
	end

	context "initialize with wrong file type" do
		it "should raise an InvalidFileException" do
			# $stderr.puts "method #{Dir.pwd + '/spec/fixtures/files/weberver.txt'}"
			file = "#{Dir.pwd}/spec/fixtures/files/webserver.txt"
			expect{LogParser.new(file)}.to raise_error("Only .log files can be parsed at the moment")
		end
	end

	context "initialize with arguments" do
		it "should raise an ArgumentError" do
			expect{LogParser.new(Dir.pwd + '/spec/fixtures/files/webserver.log')}.not_to raise_error
		end
	end

end