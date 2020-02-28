class BloodOath
    attr_reader :date, :follower, :cult

    @@all = []

    def initialize(date, follower, cult)
        @date = date
        @follower = follower
        @cult = cult
        @@all << self
    end

    def self.all
        @@all
    end

    # returns a String that is the initiation date of this 
    # blood oath in the format YYYY-MM-DD.
    def initiation_date
        date.to_s
    end
 
end