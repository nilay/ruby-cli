class Model
  attr_accessor :applied_makeups
  def initialize
    @applied_makeups = []
  end

  # Our 'makeup' method can now accept makeup_kinds of any type as long as
  # it can respond to 'apply'. Without strict type restrictions
  def makeup(makeup_kinds)
    makeup_kinds.each { |kind| kind.apply(self) }
  end

  def ramp_walk
    puts "Model ramp walking wearing #{applied_makeups.join(', ')}"
  end
end

class Foundation
  def apply(model)
    model.applied_makeups << 'Foundation'
  end
end

class Eyeshadow
  def apply(model)
    model.applied_makeups << 'Eyeshadow'
  end
end

class Mascara
  def apply(model)
    model.applied_makeups << 'Mascara'
  end
end

# All of our classes share the same 'apply' method signature, but they
# all have different implementations.
mandy =  Model.new
mandy.makeup([Foundation.new, Eyeshadow.new, Mascara.new])
mandy.ramp_walk     # Output:  Model ramp walking wearing Foundation, Eyeshadow, Mascara

