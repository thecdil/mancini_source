require 'nokogiri'
require 'csv'

desc "Use nokogiri to generate CSV of annotations from TEI xml"
task :tei_to_csv do
