require_relative '../models/label'
class LabelManager
  attr_accessor :labels

  def initialize
    @labels = []
  end

  def add_label
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    label
  end

  def all_labels
    if @labels.empty?
      puts 'No labels in the catalog'
    else
      @labels.each do |label|
        print "#{label.title} "
      end
      puts ''
    end
    @labels
  end
end
