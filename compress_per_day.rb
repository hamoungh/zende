#!/usr/bin/ruby
require 'pp'

data_dir="/mnt/vol2/data/data"
out_dir="/mnt/vol1000/output"
lines = []
open("#{data_dir}/list.txt") { |f| lines = f.readlines }
files = lines.collect{|l| l.split[0].chomp}
# %x{gzip -dc #{data_dir}/wc_day58_2.gz | bin/recreate state/object_mappings.sort > #{out_dir}/wc_day58_2.out}

map={}
%x{ls #{data_dir}}.split.each{|file| 
	
	#file = "wc_day66_11.gz"
	match = Regexp.compile('wc_day([0-9]+)_([0-9]+).gz').match(file)
	if match 	
		# file=~/wc_day([0-9]+)_([0-9]+).gz/
		day=match[1].to_i; part=match[2].to_i;
		# puts "day #{day} part #{part}"
		if map[day]==nil 
			map[day]=[part]
		else
			# puts "#{map[day]} "
			map[day] << part
		end
	end
}

(1..92).each { |day|
	part_zips = map[day].inject(""){|inj,part| inj=inj+" #{data_dir}/wc_day#{day}_#{part}.gz"}
	puts part_zips
	%x{gzip -dc #{part_zips} | bin/recreate state/object_mappings.sort > #{out_dir}/wc_day#{day}.out}
}
