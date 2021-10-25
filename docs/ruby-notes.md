
        
        # do annotations
        doc.css('p').children.each do |node|
            if node['type']
            text = node['style']
            node.name = 'a'
            id = node['xml:id']
            node['href'] = '#' + id
            node['data-toggle'] = 'tooltip'
            node['title'] = text
            original_node = node.content
                if node['key']
                    key = node['key']
                    node.before '<a href="/mancini_source/people.html#' + key + '">' + node.content + '</a> '
                end
            node.content = '[' + node['n'] + ']'
            node.delete('n')
            node.delete('style')
            node.delete('key')
            node.delete('type')
            end
        end
        
        # hyperlink persNames
        doc.css('persName').each do |node|
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

        # removes the second occurrence of the node
        #people_ar.each do |node|
            #if doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[@key=\"#{node}\"]")[1]
                #doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[@key=\"#{node}\"]")[1].nil? ? testnode = "" : testnode = doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[@key=\"#{node}\"]")[1]
                #puts testnode
                #testnode.nil? ? anothernode = "" : anothernode = testnode.text.strip
                #puts anothernode
                #testnode.before anothernode
                #testnode['foo'] = 'delete'
                #testnode.remove
            #end
        #end

        # string/array stuff:
        # get all pb elements in div
        imageset = doc.css('text body div[1] pb')
        # => output as array: ["name key 1"; "name key 2"] => name key 1; name key 2
        otherimage = imageset.map {|element| element["facs"]}.join(';')
        
        # get all elements with attribute "style"
            # id_set = doc.xpath("//*[@style]")
        # put ids in string, each separated by ';':
            # all_ids = id_set.map {|element| element["style"]}.join('; ')

        # remove all facs divs
        # doc.xpath('//div[@facs=""]').remove

        #testnode = doc.xpath('//xmlns:div/xmlns:p/xmlns:persName[@key="ortensia-stella"]')[1]
        #anothernode = testnode.text.strip
        #puts anothernode
        #testnode.before anothernode
        #testnode.remove

        node_removed = doc.xpath('//xmlns:div/xmlns:p/xmlns:persName[@key="marcatelli"]')[1]
        anothernode_second = node_removed.text.strip
        puts anothernode_second
        node_removed.before anothernode_second
        node_removed.remove

        people_uniq.each do |node|
            doc.at_xpath("//persName[@key=\"#{node}\"]").each do |x|
                x.name = 'a'
            end
        end

        people_ar.each do |node|
            newel = doc.at_xpath("//persName[@key=\"#{node}\"]")
            newel.name = 'a'
        end

        doc.css('persName').attr("facs")

        people_ar.each do |node|
            doc.xpath("//persName[@key=\"#{node}\"]").each do |x|
                x.name = 'test'
            end
        end

        #dtest = doc.at_css('text body div[3] persName').attr('key')
        dtest = doc.at_xpath('//xmlns:div/xmlns:p/xmlns:persName[@key="ortensia-stella"]')
        # puts dtest

        doc.search('persName').each do |persname|
            category = persname.xpath('//following-sibling::xmlns:persName').text
            puts "#{persname.text}: category #{category}" 
        end

        
        //button[contains(.,'Arcade Reader')]/preceding-sibling::button[@name='settings']

        dups = 
        # doc.xpath("xmlns:persName[preceding::xmlns:persName[@key = current()/@key]]").text
        puts dups

        # dups = doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[preceding::xmlns:persName[@key = current()/@key]]")
        # node_removal(dups)

        #people_ar.each do |node|
            #all_perses = doc.xpath("//xmlns:div/xmlns:p/xmlns:persName[@key=\"#{node}\"]")[1]
            #[position()>0]
            #node_removal(all_perses)
        #end

        doc.at('persName').xpath('following-sibling::xmlns:persName[@key = "ortensia-stella"]').remove