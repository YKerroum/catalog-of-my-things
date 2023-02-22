require 'json'

class Storage
  def self.save(name, object)
    File.write("../../json/#{name}.json", JSON.generate(object))
  end

  def self.load(name)
    return [] unless File.exist?("../../json/#{name}.json")

    JSON.parse(File.read("../../json/#{name}.json"), create_additions: true)
  end
end
