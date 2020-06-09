require 'nokogiri'

###############################################################################
# Helper Functions
###############################################################################

$ensure_dir_exists = ->(dir) { if !Dir.exists?(dir) then Dir.mkdir(dir) end }

###############################################################################
# TASK: letters xml to markdown
###############################################################################

desc "Use nokogiri to generate markdown from TEI letters"
task :generate_md do 
  
  # Set up
  input_dir = 'xml'
  output_dir = 'out'
  stylesheet = 'letters.xsl'
  $ensure_dir_exists.call output_dir

  # Count
  num_items = 0
  # Read the stylesheet
  template = Nokogiri::XSLT(File.read(stylesheet))
  # iterate over all XML files, recursively through input dir
  Dir.glob(File.join([input_dir, "**/*.xml"])).each do |filename|
    input_filename = "#{filename}"
    # create output filename in output dir with .md extension
    output_filename = File.join([output_dir, "#{File.basename filename,".xml"}.md"])
    # read the xml with Nokogiri
    document = Nokogiri::XML(File.read(input_filename))
    # apply the stylesheet
    transformed_document = template.transform(document)
    # write out the file
    File.write(output_filename, transformed_document)
    num_items += 1
  end
  puts "Generated #{num_items} md from xml into: #{output_dir}"
end


