class T
  def initialize(x, y)
    @x = x
    @y = y
  end
end

# instanciate class
t = T.new('a', 'b')

# instance_eval. No parameter
t.instance_eval { puts "Hello #{@x} #{@y}" }

# instance_exec with parameter
t.instance_exec("Hello") { |param| puts "#{param}, #{@x} #{@y}" }