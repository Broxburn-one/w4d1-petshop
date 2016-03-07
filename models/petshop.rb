require('pg')

class Petshop

  attr_reader :name, :id, :address, :category
  @@db_credentials = { dbname: 'petchain', host: 'localhost' }  # class var

  def initialize(options)
    @name = options["name"]
    @address = options["address"]
    @id = options["id"] or nil
    @category = options["category"]
  end

def pets()
    sql = "SELECT * FROM pets WHERE petshop_id=#{@id} ORDER BY name"
    pets = Petshop.run_sql(sql)
    result = pets.map { |pet| Pet.new(pet) } 
  end

  def save()
    sql = "INSERT INTO petshops ( 
      name, 
      address,
      category) 
      VALUES (
      '#{ @name }',
      '#{ @address }'
      '#{ @category }'
      )"
    return Petshop.run_sql( sql )
  end

def self.all()
    sql = "SELECT * FROM petshops ORDER BY name"
    petshops = Petshop.run_sql( sql )
    result = petshops.map { |petshop| Petshop.new(petshop) } 
end

def self.find(id)
   sql = "SELECT * FROM petshops WHERE id = #{id.to_i}"
   result = Petshop.run_sql( sql )
   team = Petshop.new( result[0] )
  end

  def update()
    sql = "UPDATE petshops SET name='#{ @name }', address='#{ @address }', category='#{@category}' WHERE id = #{@id}"
    return Petshop.run_sql( sql )
  end


 private 

  def self.run_sql( sql )
    begin
      db = PG.connect( @@db_credentials )
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end




end