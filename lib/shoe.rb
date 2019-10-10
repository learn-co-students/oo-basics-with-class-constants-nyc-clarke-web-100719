class Shoe
  attr_accessor :color, :size, :material, :condition 
  attr_reader :brand

  BRANDS = ["Uggs", "Rainbow", "Nike", "Yeezy"]

  def initialize(brand)
    @brand = brand
    ## only push brand into array if its not there yet.

    # we're trying to see if we already have that brand in BRANDS.

    # BRANDS.each do |brand_string|
    #   if brand == brand_string
    #     return
    #   end
    # end

    found_brand = BRANDS.find do |brand_string|
      brand_string == brand
    end

    if found_brand == nil
      BRANDS << brand
    end
  end

  def cobble
    self.condition = "new"
    puts "Your shoe is as good as new!"
  end



  # def brands=(brands)
  #   @brands = brands
  #   BRANDS << brands
  # end
end