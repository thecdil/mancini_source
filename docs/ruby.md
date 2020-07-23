- if you get an error "Operation not permitted" on mac, follow these instructions to change permissions: https://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/

warning: deprecated Object#=~ is called on Proc; it always returns nil

nodes.wrap("<div class='container'></div>")

        # define paragraph method
        def paragraph(doc, element)
            element.each do |node|
                x = doc.css('closer')
                if node.parent == x
                    new_node = doc.create_element 'p'
                    new_node.inner_html = node.inner_html
                    node.replace new_node
                    new_node['class'] = 'text-right'
                else
                    new_node = doc.create_element 'p'
                    new_node.inner_html = node.inner_html
                    node.replace new_node
                end
            end
        end
        
date_opener = doc.css('opener date')
        node_removal(date_opener) unless date_opener['type']
        # date content to text
        doc.css('opener date').each do |node|
            unless node['type']
                node_content = node.inner_html
                node.before node_content
                node.remove
            end
        end



         # frontmatter
        def frontmatter(letter, number, auth, pers, date, loc)
            loc.before "\n---\nletter: " + letter + "\nnumber: " + number + "\nauthor: " + auth + "\naddressee: " + pers + "\ndate: " + date + "\n---\n"
        end

        key = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("key")
        n = doc.css('teiHeader fileDesc sourceDesc bibl title').attr("n")
        author = doc.css('teiHeader fileDesc sourceDesc bibl author').text
        persname = doc.css('teiHeader fileDesc sourceDesc bibl persName').text
        date = doc.css('teiHeader fileDesc sourceDesc bibl date').attr("when")
        location = doc.css('teiHeader')

        frontmatter(key, n, author, persname, date, location)



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

        # add rest of content
        newdoc << doc

        # close file
        newdoc.close






        builder = Nokogiri::HTML::Builder.new do |layout|
            layout.div(:class => "container py-4") {
                layout.div(:class => "tab-content my-3", :id => "myTabContent"){
                    layout.div do
                        layout.text("Value")
                      end
                }
            }
        end

        
        this = Nokogiri(builder.to_html)

        puts this.to_html(:save_with => Nokogiri::XML::Node::SaveOptions::DEFAULT_HTML)