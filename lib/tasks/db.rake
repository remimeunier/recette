require 'json'
require 'chronic_duration'

namespace :db do

  namespace :seed do

    desc "Create recipes from json file"
    task :create_recipes => :environment do
      # Make the path to the file

      filepath = Rails.root.join('lib', 'tasks', 'recipes.json')
      # Get our file ready

      file = File.open(filepath)
      total_lines = file.readlines.size # Get total lines number


      puts "Extracting recipes from #{filepath} with a total of #{total_lines} recipes"

      file.seek(0) # Restart from the first line (readlines will put the cursor at the end of the file, so we need to put it back at the start)

      file.each_with_index do |line, index|
        # Display progress
        current_line_nb = index + 1
        progress = current_line_nb * 100 / total_lines
        puts "Reading line #{current_line_nb} out of #{total_lines} (#{progress}%)"

        # Create one recipe each line
        json = JSON.parse(line)
        # Get or create the author
        author = Author.find_or_create_by(name: json['author'])
        # Get or create all related tags
        tags = []
        json['tags'].each  do |tag|
          tags << Tag.find_or_create_by(name: tag)
        end
        Recipe.create(name: json['name'], ingredients: json['ingredients'].join(', '),
                      rate: json['rate'], image: json['image'],
                      total_time: ChronicDuration.parse(json['total_time'].gsub('j', 'd')),
                      prep_time: ChronicDuration.parse(json['prep_time'].gsub('h', 'd')),
                      cook_time: ChronicDuration.parse(json['cook_time'].gsub('h', 'd')),
                      author_tip: json['author_tip'], author: author, tags: tags)
      end
    end
  end
end
