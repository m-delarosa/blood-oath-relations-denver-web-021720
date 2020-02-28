class Cult
    attr_reader(:location, :founding_year, :name, :slogan)

    @@all = []
    
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        BloodOath.new("2020-02-28", follower, self )
    end

    # returns a Fixnum that is the number of followers in this cult
    def cult_population
        members = BloodOath.all.select {|oath| oath.cult == self }
        members.count
    end

    # takes a String argument that is a name and returns a Cult instance whose name matches that argument
    def self.find_by_name(name)
        oath = BloodOath.all.find { |oath| oath.follower.name == name } 
        oath.cult
    end

    # takes a String argument that is a location and returns an Array of cults that are in that location
    def self.find_by_location(location)
        Cult.all.select { |cult| cult.location == location } 
    end

    # takes a Fixnum argument that is a year and returns all of the cults founded in that year
    def self.find_by_founding_year(year)
        Cult.all.select { |cult| cult.founding_year == year }
    end

    # returns a Float that is the average age of this cult's followers
    def followers
        oaths = BloodOath.all.select { |oath| oath.cult == self }
        oaths.map { |oath| oath.follower }
    end

    def average_age
        sum = followers.reduce(0) { |sum, follower| sum + follower.age }.to_f
        sum / followers.length.round(2)
    end

    def my_followers_mottos
        followers.each { |follower| p follower.life_motto}
    end

    # returns the Cult instance who has the least number of followers
    def self.least_popular
        all.min_by { |cult| cult.followers.size }
    end

    #returns a String that is the location with the most cults
    def self.cult_locations
        locations = {}

        self.all.each do |cult|
            if !locations[cult.location]
                locations[cult.location] = 1
            else
                locations[cult.location] += 1
            end
        end
        locations
    end
    
    def self.most_common_location
        cult_locations.max_by { |location, num_cults| num_cults }.first
    end

    
end