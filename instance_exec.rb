class Rocket
  @@ctr = 1
  def self.crew(ship_name, &block)
    puts "#{ship_name} members are:"
    new.instance_exec(&block)
  end

  def member(name)
    puts "#{@@ctr}. #{name}"
    @@ctr = @@ctr + 1
  end
end

Rocket.crew "Titanic" do
  member "Jack"
  member "Jill"
end