class ClassVar
  CONST_VAR = 321
  @@static_var = []

  def self.add(val)
    @@static_var << val
  end

  def self.disp
    p @@static_var
  end
end