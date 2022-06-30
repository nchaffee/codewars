module Scrub
    extend self

    def filename
        str = gets.chomp
        puts str.downcase.tr(' ','_').tr(':!','')
    end
end

Scrub.filename()
