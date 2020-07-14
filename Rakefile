require 'nokogiri'

desc "Use nokogiri to generate HTML pages from TEI xml"
task :letters do 

    # iterate over all XML files in input dir
    Dir.glob("testfolder/*.xml").each do |xmlname|
        names = xmlname.split("/")
        filename = names[1]
        lettername = filename.split(".").first

        # Get output name
        output_name = lettername + ".html"

        # read the xml with Nokogiri

        doc = Nokogiri::XML(File.read(xmlname))

        # do annotations first
        doc.css('p').children.each do |node|
            if node['type']
            node.name = 'a'
            id = node['xml:id']
            node['href'] = '#' + id
            node['data-toggle'] = 'tooltip'
            node['title'] =  'x'
            span_node = node.content
            node.before span_node + ' '
            node.content = '[' + node['n'] + ']'
            node.delete('n')
            node.delete('key')
            node.delete('type')
            end
        end

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

         # text emphasis
 
        doc.css('hi').each do |node|
            rend = node['rend']
            node.name = rend
            node.delete('rend')
        end

        # open new file
        newdoc = File.new(output_name, 'w')

        # add content
        # frontmatter
        def frontmatter(letter, number, auth, pers, date)
            "---\nletter: " + letter + "\nnumber: " + number + "\nauthor: " + auth + "\naddressee: " + pers + "\ndate: " + date + "\nlayout: default" + "\ngallery: true" + "\n---\n\n"
        end

        key = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("key")
        n = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("n")
        author = doc.css('teiHeader fileDesc sourceDesc bibl author').text
        persname = doc.css('teiHeader fileDesc sourceDesc bibl persName').text
        date = doc.css('teiHeader fileDesc sourceDesc bibl date').attr("when")

        # add frontmatter first
        newdoc << frontmatter(key, n, author, persname, date)

        # remove unused nodes
        doc.css('TEI teiHeader').remove
        doc.css('note').remove
        # add container
        doc.css('TEI text').each do |node|
            new_node = doc.create_element 'div'
            new_node.inner_html = node.inner_html
            node.replace new_node
            new_node['class'] = 'container py-4'
        end
        # add tab section div
        doc.css('div body').each do |node|
            new_node = doc.create_element 'div'
            new_node.inner_html = node.inner_html
            node.replace new_node
            new_node['class'] = 'tab-content my-3'
            new_node['id'] = 'myTabContent'
            # add letter-top include
            letter_include = '{% include letter_top.html %}'
            new_node.before letter_include + "\n"
        end
        # add tab div
        doc.css('div').each do |node|
            if node['type']
            node['class'] = 'tab-pane fade show active'
            node['id'] = 'trans'
            node['role'] = 'tabpanel'
            node['aria-labelledby'] = 'trans-tab'
            node.delete('type')
            node.delete('n')
            # delete facs (temporary?)
            node.delete('facs')
            end
        end
        # add heading
        doc.css('head').each do |node|
            new_node = doc.create_element 'h4'
            new_node.inner_html = node['type']
            node.replace new_node
            new_node['class'] = 'mb-3'
        end
        # remove pb (temporary?)
        doc.css('pb').remove
        # dateline element to paragraph, define paragraph method
        def paragraph(doc, element)
            element.each do |node|
                new_node = doc.create_element 'p'
                new_node.inner_html = node.inner_html
                node.replace new_node
            end
        end
        dateline = doc.css('dateline')
        paragraph(doc, dateline)
        # date content to text
        doc.css('opener date').each do |node|
            unless node['type']
                node_content = node.inner_html
                node.before node_content
                node.remove
            end
        end
        # remove opener element, define node removal method
        def node_removal(node_removed)
                node_removed.each do |node|
                node_content = node.inner_html
                node.before node_content
                node.remove
            end
        end
        opener = doc.css('opener')
        node_removal(opener)
        # salute and signed elements to paragraph
        salute = doc.css('salute')
        signed = doc.css('signed')
        paragraph(doc, salute)
        paragraph(doc, signed)
        # remove closer element
        closer = doc.css('closer')
        node_removal(closer)

        # add remaining content, remove extra blank lines
        # find a way to pretty print?

        newdoc << doc.at('TEI div').to_s.gsub(/^\s*\n/, "")

        # close file
        newdoc.close
    end
end
