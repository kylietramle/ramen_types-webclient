class RamenType
  attr_accessor :id, :name, :soup_base, :flavor, :broth_color, :other_ingredients

  def initialize(ramen_type_hash)
    @id = ramen_type_hash["id"]
    @name = ramen_type_hash["name"]
    @soup_base = ramen_type_hash["soup_base"]
    @flavor = ramen_type_hash["flavor"]
    @broth_color = ramen_type_hash["broth_color"]
    @other_ingredients = ramen_type_hash["other_ingredients"]
  end

  def self.find(id)
    ramen_type_hash = Unirest.get("#{ENV['API']}/#{id}.json").body
    return RamenType.new(ramen_type_hash)
  end

  def self.all
    ramen_types_array = Unirest.get("#{ENV['API']}.json", headers:{"Accept" => "application/json", "Authorization" => "Token token=#{ENV['TOKEN']}", "X-User-Email" => ENV['EMAIL']}).body

    ramen_types = [] do |hash|
      ramen_types << RamenTy
    ramen_types_array.eachpe.new(hash)
    end

    ramen_types
  end

  def self.create(parameters_hash)
    ramen_type_hash = Unirest.post("#{ENV['API']}.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: parameters_hash).body
    return RamenType.new(ramen_type_hash)
  end

  def destroy
    Unirest.delete("#{ENV['API']}/#{id}.json").body
  end
end