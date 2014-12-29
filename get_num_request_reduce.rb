#!/usr/bin/env ruby

#regex = Regexp.compile('([0-9]+)?-([0-9])?+-[(0-9]+)?-([0-9]+)?-([0-9]+)?\t1')
begin
	last_key, sum = nil, 0
	STDIN.each_line do |line|
		key,val= line.split("\t")
		if last_key && last_key!=key
			puts "#{last_key}\t#{sum}"
			last_key,sum = key,val.to_i
		else
			last_key, sum = key, sum+val.to_i
		end
	
#
#		line.chomp
#		match = regex.match(line)
#
#		 if (match)
#			# $stderr.print line
#			month = match[0].to_i
#			day = match[1].to_i
#			hour =  match[2].to_i
#			minute = match[3].to_i
#			second = match[4].to_i
#
#		end
	end #each_line
	puts "#{last_key}\t#{sum}" if last_key
rescue EOFError
        # f.close
end











