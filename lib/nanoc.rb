module Nanoc

  VERSION = '1.6'

  def self.ensure_in_site
    unless in_site?
      $stderr.puts 'ERROR: The current working directory does not seem to ' +
        'be a valid/complete nanoc site directory; aborting.' unless $quiet
      exit
    end
  end

  private

  def self.in_site?
    return false unless File.directory?('content')
    return false unless File.directory?('layouts')
    return false unless File.directory?('lib')
    return false unless File.directory?('tasks')
    return false unless File.directory?('templates')
    return false unless File.exist?('config.yaml')
    return false unless File.exist?('meta.yaml')
    return false unless File.exist?('Rakefile')

    true
  end

end

require File.dirname(__FILE__) + '/nanoc/enhancements.rb'

require File.dirname(__FILE__) + '/nanoc/creator.rb'
require File.dirname(__FILE__) + '/nanoc/compiler.rb'

$nanoc_creator  = Nanoc::Creator.new
$nanoc_compiler = Nanoc::Compiler.new

require File.dirname(__FILE__) + '/nanoc/core_ext.rb'
require File.dirname(__FILE__) + '/nanoc/filters.rb'
require File.dirname(__FILE__) + '/nanoc/page.rb'
require File.dirname(__FILE__) + '/nanoc/page_drop.rb'
require File.dirname(__FILE__) + '/nanoc/page_proxy.rb'
