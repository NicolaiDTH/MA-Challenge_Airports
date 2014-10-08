class FullAirportError < RuntimeError

 def intitialize(message = "The Airport is currently full!")
  super
 end

end


class StormyWeatherError < RuntimeError

 def intialize(messahe = "The Weather isn't good!")
  super
 end

end