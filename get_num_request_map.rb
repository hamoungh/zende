#!/usr/bin/ruby

require 'pp'

#f = File.new("/mnt/vol1000/output/wc_day21.out")
f=STDIN
i = 0
# 7383 - - [16/May/1998:02:29:29 +0000] "GET /english/news/22ind055.htm HTTP/1.0" 200 38300
regex = Regexp.compile('[0-9]+ - - \[([0-9]+)?/(.+)?/.+:([0-9]+)?:([0-9]+)?:([0-9]+)? \+0000\] "GET (.+htm.*)? HTTP/1.0" .+ .+')

begin
	period = 60; 
	counts = [];
	c_ = 0;
	t_first = 0;
	y=0;
	time = 0;
	t0=0;   
	intarr = [];
	month_names = ["Jan" , "Feb" , "Mar" , "Apr" ,
             "May" , "Jun" , "Jul" , "Aug" ,
             "Sep" , "Oct" , "Nov" , "Dec"]

	while (line = f.readline)
			i= i+1
			line.chomp
			#$stdout.print line if  
			match = regex.match(line)

			 if (match)
				# $stderr.print line
				id = match[0].to_i
				day = match[1].to_i
				month = month_names.index(match[2])
				hour =  match[3].to_i
				minute = match[4].to_i
				second = match[5].to_i

				puts "#{month}-#{day}-#{hour}-#{minute}\t1"
			end #if 
	end #while

rescue EOFError
	# f.close
end

# pp counts 

