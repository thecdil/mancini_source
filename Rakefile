require 'nokogiri'
require 'csv'

desc "Use nokogiri to generate HTML pages from TEI xml"
task :letters, [:arg1] do |t, args|
    args.with_defaults(
        :arg1 => "*"
      )

    # iterate over all XML files in input dir
    Dir.glob("xml/#{args.arg1}.xml").each do |xmlname|
        names = xmlname.split("/")
        filename = names[1]
        lettername = filename.split(".").first

        # Get output name
        output_name = lettername + ".html"

        # read the xml with Nokogiri
        doc = Nokogiri::XML(File.read(xmlname))

        # open new file
        newdoc = File.new("_letters/" + output_name, 'w')

        # frontmatter
        def frontmatter(letter, number, auth, rec, date, locations, location_origin, description, citation, people, languages, title, images, manifest)
                "---\nletter_id: " + letter + "\nnumber: " + number + "\ncreator: " + auth + "\nrecipient: " + rec + "\nletter_date: " + date + "\nlocations: " + locations + "\nlocation_origin: " + location_origin + "\ndescription: " + description + "\ncitation: " + citation + "\npeople: " + people + "\nlanguage: " + languages + "\ntitle: " + title + "\nimages: " + images + "\nmanifest: " + manifest + "\n---\n\n"
        end

        # get frontmatter variables
        key = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("key")
        doc.css('teiHeader fileDesc sourceDesc bibl title').attr("n").nil? ? n = "" : n = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("n")
        creator = doc.css('teiHeader fileDesc sourceDesc bibl author').text.strip
        recipient = doc.css('teiHeader fileDesc sourceDesc bibl persName').text.strip
        date = doc.css('teiHeader fileDesc sourceDesc bibl date').attr("when")
        title = creator + " to " + recipient + ", " + date
        firstimage = doc.at_css('text body div[1]').attr("facs")
        images = doc.css('teiHeader fileDesc sourceDesc msDesc msContents').attr("facs")
        # thumbnail = '/img/derivatives/iiif/images/' + key + '_' + firstimage + '/full/250,/0/default.jpg'
        # full = '/img/derivatives/iiif/images/' + key + '_' + firstimage + '/full/1140,/0/default.jpg'
        manifest = '/img/derivatives/iiif/' + key + '/manifest.json'
        location_origin = doc.css('teiHeader fileDesc sourceDesc msDesc history origin origPlace placeName').attr("key")
        doc.css('teiHeader fileDesc notesStmt note').nil? ? description = "" : description = '"' + doc.css('teiHeader fileDesc notesStmt note').text.strip + '"'
        doc.css('teiHeader fileDesc publicationStmt availability p[2]').nil? ? citation = "" : citation = '"' + doc.css('teiHeader fileDesc publicationStmt availability p[2]').text.strip + '"'

        # get unique locations keys
        # get all location keys
        letter_locations = doc.css('text body div[3] placeName')
        # put keys in a string
        locations_st = letter_locations.map {|element| element["key"]}.join(';')
        # turn string into an array, grab unique keys
        locations_ar = locations_st.split(';').uniq
        # turn the array back into a string, with ; as separator
        locations_uniq = locations_ar.join('; ')

        # get unique person keys
        # get all person keys
        letter_people = doc.css('text body div[3] persName')
        # put keys in a string
        people_st = letter_people.map {|element| element["key"]}.join(';')
        # turn string into an array, grab unique keys
        people_ar = people_st.split(';').uniq
        # turn the array back into a string, with ; as separator
        people_uniq = people_ar.join('; ')

        # get unique language keys
        letter_languages = doc.css('text body div head')
        languages_st = letter_languages.map {|element| element["xml:lang"]}.join(';')
        languages_ar = languages_st.split(';').uniq
        languages_ar.map! do |node|
            if node == 'en'
                node = 'English'
            elsif node == 'it'
                node = 'Italian'
            elsif node == 'fr'
                node = 'French'
            else node == 'sp'
                node = 'Spanish'
            end
        end
        languages_uniq = languages_ar.join('; ')

        # add frontmatter to newdoc first
        newdoc << frontmatter(key, n, creator, recipient, date, locations_uniq, location_origin, description, citation, people_uniq, languages_uniq, title, images, manifest)

        # define node removal method, to remove xml elements but keep their inner text
        def node_removal(node_removed)
            node_removed.each do |node|
                node_content = node.inner_html
                node.before node_content
                node.remove
            end
        end

        # define paragraph method
        def paragraph(doc, element)
            element.each do |node|
                new_node = doc.create_element 'p'
                new_node.inner_html = node.inner_html
                node.replace new_node
            end
        end

        # dateline element to paragraph
        dateline = doc.css('dateline')
        paragraph(doc, dateline)

        # date element to text
        date_opener = doc.css('opener date')
        node_removal(date_opener) unless date_opener.attr('type')

        # remove opener element
        node_removal(doc.css('opener'))

        # salute and signed elements to paragraph
        salute = doc.css('salute')
        signed = doc.css('signed')
        paragraph(doc, salute)
        paragraph(doc, signed)

        # add popover link to people the first time they appear
        people_ar.each do |node|
            if doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[@key=\"#{node}\"]")[0]
                doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[@key=\"#{node}\"]")[0].nil? ? node = "" : node = doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[@key=\"#{node}\"]")[0]
                # delete original annotation id, so it doesn't conflict with new id
                node.delete('id')
                node.name = 'a'
                key = node['key']
                node['class'] = 'pop-annotation'
                node['tabindex'] = '0'
                node['id'] = key
                node.delete('key')
                node.delete('type')
                node.delete('n')
                node.delete('style')
            end
        end

        # add popover link to places the first time they appear
        locations_ar.each do |node|
            if doc.xpath("//xmlns:div/xmlns:p/xmlns:placeName[@key=\"#{node}\"]")[0]
                doc.xpath("//xmlns:div/xmlns:p/xmlns:placeName[@key=\"#{node}\"]")[0].nil? ? node = "" : node = doc.xpath("//xmlns:div/xmlns:p/xmlns:placeName[@key=\"#{node}\"]")[0]
                node.delete('id')
                node.name = 'a'
                key = node['key']
                node['class'] = 'pop-annotation'
                node['tabindex'] = '0'
                node['id'] = key
                node.delete('key')
                node.delete('type')
                node.delete('n')
                node.delete('style')
            end
        end

        # add popover link to remaining annotations
        doc.xpath('//xmlns:div/xmlns:p/xmlns:ref[@type="annotate"]').each do |node|
            node.name = 'a'
            key = node['xml:id']
            node['class'] = 'pop-annotation'
            node['tabindex'] = '0'
            # delete original annotation id, so it doesn't conflict with new id
            node.delete('id')
            node['id'] = key
            node.delete('type')
            node.delete('n')
            node.delete('style')
        end

        # remove remaining persName and placeName xml elements, leave their text
        node_removal(doc.css('persName'))
        node_removal(doc.css('placeName'))

        # text emphasis
        doc.css('hi').each do |node|
            rend = node['rend']
            node.name = rend
            node.delete('rend')
        end

        # remove unused nodes, teiHeader and note
        doc.css('TEI teiHeader').remove
        doc.css('note').remove
        
        # remove xml namespace
        doc.remove_namespaces!

        # change div type to tabpanel div
        doc.css('TEI text body div').each do |node|
            type = node.attr('id').to_s
            if type.include? "trans"
                node['class'] = 'tab-pane fade show active'
                node['id'] = 'trans'
                node['role'] = 'tabpanel'
                node['aria-labelledby'] = 'trans-tab'
                node.delete('type')
                node.delete('n')
                # delete facs (temporary?)
                node.delete('facs')
            elsif type.include? "edit"
                node['class'] = 'tab-pane fade'
                node['id'] = 'edit'
                node['role'] = 'tabpanel'
                node['aria-labelledby'] = 'edit-tab'
                node.delete('type')
                node.delete('n')
                # delete facs (temporary?)
                node.delete('facs')
            else type.include? "raw"
                node['class'] = 'tab-pane fade'
                node['id'] = 'raw'
                node['role'] = 'tabpanel'
                node['aria-labelledby'] = 'raw-tab'
                node.delete('type')
                node.delete('n')
                # delete facs (temporary?)
                node.delete('facs')
            end
        end

        # change head to heading
        doc.css('head').each do |node|
            new_node = doc.create_element 'h3'
            type = node['type'].to_s.capitalize
            language = node['lang'].to_s
            case language
            when "en"
                full_lang = "English"
            when "it"
                full_lang = "Italian"
            when  "fr"
                full_lang = "French"
            when "sp"
                full_lang = "Spanish"
            end
            new_node.inner_html = type + " (" + full_lang + ")"
            node.replace new_node
            new_node['class'] = 'mb-3'
        end

        # remove pb (temporary?)
        doc.css('pb').remove

        doc.css('closer p').each do |node|
            if node['class']
                node['class'] = 'text-right'
            end
        end
        
        # remove closer element
        closer = doc.css('closer')
        node_removal(closer)

        # add remaining content, remove extra blank lines
        # find a way to pretty print?

        doc.css('TEI text div').each do |x|
            newdoc << x.to_s.gsub(/^\s*\n/, "") + "\n"
        end

        # close file
        newdoc.close
    end
end

desc "Create annotations csv"
task :annotations do

    # fieldnames
    # id,text
    field_names = "id,text".split(",")

    # open file
    CSV.open("_data/annotations.csv", "w") do |csv|
        # write the header fields 
        csv << field_names
        # iterate over all XML files in input dir
        Dir.glob(File.join(["xml", "*.xml"])).each do |xmlname|
            # read the xml with Nokogiri
            begin

                doc = Nokogiri::XML(File.read(xmlname))

            rescue
                
                # handle parsing error
                puts "Error parsing file #{xmlname}"

            else
                # parse fields in the xml
                begin
                    # remove xml namespace
                    doc.remove_namespaces!

                    # create id and text field values
                    doc.css('ref').each do |node|
                        id = node['id']
                        text = node['style']
                        # make into array, following csv order from field_names above
                        field_values = [id,text]
                        # write values into csv row
                        csv << field_values
                    end
                end
            end
        end
    end
end

# Deploy site
desc "Build site with production env"
task :deploy do
  ENV["JEKYLL_ENV"] = "production"
  sh "bundle exec jekyll build"
end