class Follower
    attr_reader :name, :age, :life_motto
    
    @@all = []

    def initialize( name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
    end

    def self.all
        @@all
    end

    # returns an Array of this follower's cults
    def cults
        oaths = BloodOath.all.select { |oath| oath.follower == self }
        oaths.map { |oath| oath.cult}
    end

    #takes in an argument of a Cult instance and adds this 
    # follower to the cult's list of followers
    def join_cult(cult)
        BloodOath.new("2020-02-28", self, cult)
    end

    # takes a Fixnum argument that is an age and returns an 
    # Array of followers who are the given age or older
    def self.of_a_certain_age(age)
        all.select { |follower| follower.age >= age }
    end

    def my_cults_slogans
        cults.map { |cult| p cult.slogan }
    end

    #returns the Follower instance who has joined the most cults
    def self.most_active
        BloodOath
    end

end