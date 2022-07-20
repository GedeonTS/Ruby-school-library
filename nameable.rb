class Nameable
    initialize(name){
        @name=name
    }
    def correct_name
        raise NotImplementedError,"#{self.class} has not implemented method '#{__method__}'"
        @name
    end
end