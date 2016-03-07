require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/pet' )
require_relative( '../models/petshop' )

class TestPetchain < MiniTest::Test

  def setup
    # this part for  petshop
    options = {
      "name" => 'Main Street Petshop', 
      "address" => '1 Main St.',
      "category" => 'exotic'
    }
    @petshop = Petshop.new( options )
    # @team.save()

    # options {
    #   "name" => "Frank",
    #   "category" => "exotic"
    # }

  end

  def test_name
    assert_equal('Main Street Petshop', @petshop.name)
  end

  def test_address
    assert_equal('1 Main St.', @petshop.address)
  end

  def test_category
    assert_equal('exotic', @petshop.category)
  end

end