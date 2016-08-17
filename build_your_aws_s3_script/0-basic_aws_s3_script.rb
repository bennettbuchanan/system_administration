#!/usr/bin/env ruby

require 'aws-sdk'
require 'yaml'
require 'optparse'
require 'ostruct'
require 'pp'

class AWS_parser
  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.encoding = "utf8"
    options.verbose = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: ./0-basic_aws_s3_script.rb [options]"

      opts.on("-v", "--verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.on("-bBUCKET_NAME", "--bucketname=BUCKET_NAME",
              "Name of the bucket to perform the action on") do |b|
        options.bucketname = b
      end

      opts.on("-fFILE_PATH", "--filename=FILE_PATH",
              "Path to the file to upload") do |f|
        options.filename = f
      end

      opts.on("-aACTION", "--action=ACTION",
              "Select action to perform [list, upload, delete, download]") do |a|
        options.action = a
      end

    end

    opt_parser.parse!(args)
    options
  end

end

options = AWS_parser.parse(ARGV)
config = YAML.load_file('config.yaml')

# s3 = AWS::S3.new
# obj = s3.buckets['buchananbucket'].objects['key']

case options.action
when "list"
  pp "Action: list"

when "upload"
  pp "Action: upload"

when "delete"
  pp "Action: delete"

when "download"
  pp "Action: download"

end
