require "bundler/setup"
require 'test/unit'
require 'rubygems'
# gem 'rack-test'
#require "bundler/setup"
require 'rack/test'
require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'

ENV['RACK_ENV'] = 'test'

class EstormTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Nesta::App
  end

  def test_first_pageworks
    get '/'
    #puts last_response.methods
    assert last_response.ok?
    assert last_response.body.include? 'Estorm Technologies Pte. Ltd.'
  end

  def test_key_pages
     pagelist=["contact","support","about","clients","products","products/crm", "/"]
     pagelist.each { |page| 
          get page
          assert last_response.ok?, "#{page} not found"
          #assert_equal last_response.body.includes? 'Ficonab Pte. Ltd.'
            }
   end
   def test_products_pages
      pagelist=["crm","dms","scratch","tms","sms"]
      pagelist.each { |page| 
           get "products/#{page}"
           assert last_response.ok?, "products/#{page} not found"
           #assert_equal last_response.body.includes? 'Ficonab Pte. Ltd.'
             }
    end
   
  #def test_it_says_hello_to_a_person
  #  get '/', :name => 'Simon'
  #  assert last_response.body.include?('Simon')
  # end
end