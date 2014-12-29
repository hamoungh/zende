#!/usr/bin/ruby

require 'rubygems'
require 'right_aws'

aws_access_key_id = "xxx"
aws_secret_access_key = "xxx"

#s3 = RightAws::S3.new(aws_access_key_id, aws_secret_access_key)
# my_buckets_names = s3.buckets.map{|b| b.name}
#pp my_buckets_names

# bucket2 = RightAws::S3::Bucket.create(s3, 'fifa98', true)

s3 = RightAws::S3Interface.new(aws_access_key_id, aws_secret_access_key)

outdir = '/mnt/vol1000/output/'
Dir.entries(outdir).each { |file|
	begin
		puts "sending #{file}"
		s3.put('fifa98', file,  File.open("#{outdir}/#{file}"))
	rescue => e
		puts e
	end
}
