module Scrub
    extend self

    def filename
        str = gets.chomp
        puts str.downcase.delete(':').tr(' ','_')
    end
end

Scrub.filename()
