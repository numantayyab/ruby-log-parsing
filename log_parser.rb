class LogParser
 
	require 'pretty_console_output'

  	## Some custom exceptions for file validations  
  	# File extension errors
  	class InvalidFileException < StandardError; end

  	attr_accessor :file, :console
    
  	## All validations for file will be done at object creation
  	def initialize(file)

  		if file.length.zero?
			raise InvalidFileException.new("No file found to parse")
		# elsif file.split(',').length > 1 #commented as filename may contain <,> in it.
		# 	raise InvalidFileException.new("Please list one file at a time. Files containing space in name should be quoted.")
		elsif !File.exists?(file)
			raise InvalidFileException.new("File #{file} was not found")
		elsif !file.match(/\A[\S]+\.(log)\z/)
			raise InvalidFileException.new("Only .log files can be parsed at the moment")
		end

		self.file = file
		self.console = PrettyConsoleOutput::Console.new
	  end

	  def parse_file
	        ## set file to default file if no arg provided		

			## total visits
			total_occurences = {}
			total_occurences_sorted = {} 

			## uniq visit
			uniq_occurences = {}
			uniq_occurences_sorted = {}

			## uniq list
			uniq_occurence_list = {}

			highest_uniq = 0
			highest_total = 0

			## read file line by line
			File.foreach(self.file).with_index do |line, line_num|
				next if line.strip == "" ## dont parse blank lines
				page, addr = line.split(" ") ## split parsed line into page visited and address

				#we use hash to increment number of occurences
				total_occurences[page] = ((total_occurences[page].to_i) +1)
				
				#hash for uniq occurences of page visits
				uniq_occurence_list[page] = uniq_occurence_list[page] || []
				
				##increment uniq visits
				unless uniq_occurence_list[page].include?(addr)
					uniq_occurence_list[page] = uniq_occurence_list[page].push(addr)
					uniq_occurences[page] = ((uniq_occurences[page].to_i) +1)
				end
			end

			self.output(total_occurences, "total")
			self.output(uniq_occurences, "unique")
	  end

  

	def output(hash={}, type = "total")
	  	if hash != {}
	  		console.tag "Following are the #{type} visits for each page\n"
	  		sort(hash, "desc").each do |key, value|
	  			console.data "#{key} has #{value} views"
	  		end
	  		console.tag "\n\n"
	  	end
	 end

	 private

	def sort(hash, dir = "asc")
		hash.sort_by{|a,v| dir == "asc" ? v : -v}
	end

end
