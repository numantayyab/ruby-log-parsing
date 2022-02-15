require_relative 'file_sort'

class LogParser

  	## Some custom exceptions for file validations  
  	# File extension errors

  	class InvalidFileException < StandardError; end
  	class FileNotFoundException < StandardError; end
  	

  	attr_accessor :file
    
  	## All validations for file will be done at object creation
  	def initialize(file)
  		@file = file
  		validate_file
	end

  	def launch
        ## set file to default file if no arg provided
        FileSort.new(file).sort_data		
	end  

	private

	def validate_file
		
		raise FileNotFoundException.new("No file found to parse") if file.length.zero?
		raise FileNotFoundException.new("File #{file} was not found") unless File.exists?(file)
		raise InvalidFileException.new("Only .log files can be parsed") if !File.basename(file).match(/\A[\S]+\.(log)\z/)
		
	end

end
