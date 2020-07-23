require 'nokogiri'

desc "Use nokogiri to generate HTML pages from TEI xml"
task :letters, [:arg1] do |t, args|
    args.with_defaults(
        :arg1 => "*/*"
      )

    # iterate over all XML files in input dir
    Dir.glob("xml/#{args.arg1}.xml").each do |xmlname|
        names = xmlname.split("/")
        filename = names[2]
        lettername = filename.split(".").first

        # Get output name
        output_name = lettername + ".html"

        # read the xml with Nokogiri
        doc = Nokogiri::XML(File.read(xmlname))

        # open new file
        newdoc = File.new("_letters/" + output_name, 'w')

        # frontmatter
        def frontmatter(letter, number, auth, pers, date)
            if number != nil
                "---\nletter: " + letter + "\nnumber: " + number + "\nauthor: " + auth + "\naddressee: " + pers + "\nletterdate: " + date + "\nlayout: letter" + "\n---\n\n"
            else
                "---\nletter: " + letter + "\nauthor: " + auth + "\naddressee: " + pers + "\nletterdate: " + date + "\nlayout: letter" + "\n---\n\n"
            end
        end

        key = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("key")
        n = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("n")
        author = doc.css('teiHeader fileDesc sourceDesc bibl author').text
        persname = doc.css('teiHeader fileDesc sourceDesc bibl persName').text
        date = doc.css('teiHeader fileDesc sourceDesc bibl date').attr("when")

        # add frontmatter to newdoc first
        newdoc << frontmatter(key, n, author, persname, date)

        # hyperlink persNames
        doc.css('persName').each do |node|
            node.name = 'a'
            key = node['key']
            node['href'] = '/people#' + key
            node.delete('key')
        end

        # hyperlink placeNames
        doc.css('placeName').each do |node|
            node.name = 'a'
            key = node['key']
            node['href'] = '/places#' + key
            node.delete('key')
        end

        # do annotations
        doc.css('p').children.each do |node|
            if node['type']
            node.name = 'a'
            id = node['xml:id']
            node['href'] = '#' + id
            node['data-toggle'] = 'tooltip'
            node['title'] =  'x'
            original_node = node.content
            node.before original_node + ' '
            node.content = '[' + node['n'] + ']'
            node.delete('n')
            node.delete('key')
            node.delete('type')
            end
        end

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
            new_node = doc.create_element 'h4'
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

        # define paragraph method
        def paragraph(doc, element)
            element.each do |node|
                new_node = doc.create_element 'p'
                new_node.inner_html = node.inner_html
                node.replace new_node
            end
        end

        # define node removal method
        def node_removal(node_removed)
            node_removed.each do |node|
                node_content = node.inner_html
                node.before node_content
                node.remove
            end
        end

        # dateline element to paragraph
        dateline = doc.css('dateline')
        paragraph(doc, dateline)

        # date element to text
        date_opener = doc.css('opener date')
        node_removal(date_opener) unless date_opener.attr('type')

        # remove opener element
        opener = doc.css('opener')
        node_removal(opener)

        # salute and signed elements to paragraph
        salute = doc.css('salute')
        signed = doc.css('signed')
        paragraph(doc, salute)
        paragraph(doc, signed)

        doc.css('closer p').each do |node|
            node['class'] = 'text-right'
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
