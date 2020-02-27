require("pry")

class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name= name
    @planets= planets
  end

  def planet_names()
    #the map enumerable method returns an array the same size as original
    return @planets.map{|planet| planet.name}
  end

  def get_planet_by_name(planet_name)
    return @planets.find{|planet| planet.name==planet_name}
  end

  def get_largest_planet()
    return @planets.max{|a,b| a.diameter<=>b.diameter}
  end

  def get_smallest_planet()
    return @planets.min{|a,b| a.diameter<=>b.diameter}
  end

  def get_planets_with_no_moons()
    return @planets.select{|planet| planet.number_of_moons==0}
  end

  def get_planets_with_more_moons(moons)
    planets_with_number_of_moons= @planets.select{|planet| planet.number_of_moons>moons}
    return planets_with_number_of_moons.map{|planet| planet.name}
  end

  def get_number_of_planets_closer_than(distance)
    planets_distance= @planets.select{|planet| planet.distance_from_sun<=distance}
    return planets_distance.count
  end

  def get_total_number_of_moons()
    return @planets.inject(0){|moon_total, planet| moon_total+= planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun()
    planets_distance= @planets.min(@planets.count){|a,b| a.distance_from_sun<=>b.distance_from_sun}
    return planets_distance.map{|planet| planet.name}
  end

  def get_planet_names_sorted_by_size_decreasing()
    planets_diameters= @planets.max(@planets.count){|a,b| a.diameter<=>b.diameter}
    return planets_diameters.map{|planet| planet.name}
  end


end
