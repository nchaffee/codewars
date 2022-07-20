module Scrub
    extend self

    def filename
        str = gets.chomp
        %w{rb sql js ts}.each do |ext|
            puts str.downcase.tr(' ','_').tr(':!#?\",','').concat('.' + ext)
        end
    end
end

Scrub.filename()
