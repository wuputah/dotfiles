require 'rubygems'
require 'wirble'

Wirble.init
Wirble::Colorize.colors.merge!({
  :symbol => :cyan,
  :symbol_prefix => :cyan,
  :number => :cyan,
  :class => :white,
  :keyword => :cyan,
  :string => :green,
  :open_string => :green,
  :close_string => :green,
  :comma => :nothing,
  :range => :nothing,
  :open_hash => :nothing,
  :close_hash => :nothing,
  :refers => :nothing,
  :open_array => :nothing,
  :close_array => :nothing,
  :open_object => :nothing,
  :close_object => :nothing,
  :object_class => :white,
  :object_addr_prefix => :nothing,
  :object_addr => :nothing,
  :object_line_prefix => :nothing
})
Wirble.colorize
