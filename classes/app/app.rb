class App
  def initialize
    @genres = []
    @authors = []
    @labels = []
    @items = []
  end

  def display_menu
    puts '1. Add genre'
    puts '2. Add author'
    puts '3. Add label'
    puts '4. Add item'
    puts '5. Display all genres'
    puts '6. Display all authors'
    puts '7. Display all labels'
    puts '8. Display all items'
    puts '9. Exit'
  end

  def action_controller
    choices = {
      1 => method(:add_genre),
      2 => method(:add_author),
      3 => method(:add_label),
      4 => method(:add_item),
      5 => method(:display_genres),
      6 => method(:display_authors),
      7 => method(:display_labels),
      8 => method(:display_items),
      9 => method(:exit)
    }
    loop do
      display_menu
      print 'Enter your choice: '
      choice = gets.chomp.to_i
      action = choices[choice] || raise("Invalid option: #{choice}")
      action.call
    end
  end
end
