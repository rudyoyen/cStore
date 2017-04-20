class String
    def is_integer?
       !!(self =~ /\A[-+]?[0-9]+\z/)
    end
end