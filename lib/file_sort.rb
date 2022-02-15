require 'pretty_console_output'

class FileSort

	attr_accessor :file, :console

	def initialize(file)
		@file = file
		@console = PrettyConsoleOutput::Console.new
	end

	def sort_data
		## total visits
		total_occurences = {}

		## uniq visit
		uniq_occurences = {}

		## uniq list
		uniq_occurence_list = {}

		## read file line by line
		File.foreach(file).with_index do |line, line_num|
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



		output(total_occurences, "total")
		output(uniq_occurences, "unique")
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