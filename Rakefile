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
            "---\nletter: " + letter + "\nnumber: " + number + "\nauthor: " + auth + "\naddressee: " + pers + "\ndate: " + date + "\n---\n"
        end

        key = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("key")
        n = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("n")
        author = doc.css('teiHeader fileDesc sourceDesc bibl author').text
        persname = doc.css('teiHeader fileDesc sourceDesc bibl persName').text
        date = doc.css('teiHeader fileDesc sourceDesc bibl date').attr("when")

        # add frontmatter first
        newdoc << frontmatter(key, n, author, persname, date)

        doc.css('TEI teiHeader').remove
        doc.css('note').remove

        # add rest of content

        newdoc << doc

        # close file
        newdoc.close
    end
end
