require('pg')

class Pet
  attr_reader :name, :petshop_id, :id
  @@db_credentials = { dbname: 'petchain', host: 'localhost' }

  def initialize(options) 
    @name = options["name"]
    @petshop_id = options["petshop_id"]
    @id = options["id"] or nil
  end

  def petshop()
    sql = "SELECT * FROM teams WHERE id = #{@petshop_id}"
    result = Pet.run_sql( sql )
    Petshop.new( result[0] )
  end

  def save()
    sql = "INSERT INTO pets ( 
      name,
      petshop_id,
      pet_type,
      picture) 
      VALUES (
      '#{ @name }',
      '#{ @petshop_id }',
      '#{ @pet_type },
      '#{ @pictures }
      )"
    Pet.run_sql( sql )
  end

  def self.find(id)
   sql = "SELECT * FROM pets WHERE id = #{id.to_i}"
   result = Pet.run_sql( sql )
   return Pet.new( result[0] )
  end

  def update()
    sql = "UPDATE pets SET name='#{ @name }', petshop_id = #{ @petshop_id }, pet_type = #{@pet_type}, pictures = #{@pictures} WHERE id = #{@id}"
    return Pet.run_sql( sql )
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