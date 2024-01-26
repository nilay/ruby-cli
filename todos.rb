#!/usr/bin/env/ruby
require 'net/http'
require 'open-uri'
require 'json'
require 'console_table'   # tabular print in console
require 'colorize'        # colored print in console
require 'yajl'            # load json in chunk

TODOS_API_BASE_URL = 'https://jsonplaceholder.typicode.com'
TODOS_TO_FETCH = 20

def threaded_fetch
  threads = []
  (1..(TODOS_TO_FETCH * 2)).select(&:even?).each do |todo_index|
    threads << Thread.new { yield JSON.parse(Net::HTTP.get(URI("#{TODOS_API_BASE_URL}/todos/#{todo_index}"))) }
  end
  threads.each(&:join)
end

# we are not using this method
def stream_fetch
  io = URI.open("#{TODOS_API_BASE_URL}/todos")
  Yajl::Parser.parse(io) do |todos|
    todos.select{ |todo| todo['id'] % 2 == 0 && todo['id'] <= 40 }.each{ |todo| yield todo }
  end
end

# we are not using this method too
def http_fetch
  uri = URI(TODOS_API_BASE_URL)
  Net::HTTP.start(uri.hostname) do |http|
    (1..(TODOS_TO_FETCH * 2)).select(&:even?).each do |todo_index|
      yield JSON.parse(http.get("/todos/#{todo_index}").body)
    end
  end
end

def main
  table_config = [
    { key: :title, title: 'Title', size: '*' },
    { key: :completed, title: 'Completed', size: 12, justify: :left }
  ]
  ConsoleTable.define(table_config) do |table|
    http_fetch { |todo| table << { title: todo['title'], completed: todo['completed'] ? ' Yes'.green : ' No'.red} }
  end
end

# ensures that the main method is only called when the script is executed directly
main if __FILE__ == $PROGRAM_NAME



