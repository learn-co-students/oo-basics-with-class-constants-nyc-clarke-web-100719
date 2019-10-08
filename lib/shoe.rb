class Shoe

BRANDS = []

  def initialize(shoe_brand)
    @brands = shoe_brand
    if BRANDS.include?(shoe_brand) == false
    BRANDS << shoe_brand
    end
  end

end