require 'rspec'
require_relative '../person.rb'

# frozen_string_literal: true

describe "Preson" do
  let (:person) { Person.new('Nilay', 30) }
  it "has name attributes" do
    expect(person.name).to eq('Nilay')
  end

  it "has age attribute" do
    expect(person.age).to eq(30)
  end
end
