require 'rubygems'
require 'xml_magic'
require 'net/http'
require 'cgi'
require 'uri'
require 'digest/md5'
require 'yaml'

# base must load first
%w(base auth token photos photo photo_response comment note size uploader).each do |file|
  require File.join(File.dirname(__FILE__), 'flickr', file)
end

include CommonThread::XML

class Object
  # returning allows you to pass an object to a block that you can manipulate returning the manipulated object
  def returning(value)
    yield(value)
    value
  end
end