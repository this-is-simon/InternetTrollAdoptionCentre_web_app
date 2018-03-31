require_relative('../db/sql_runner')

class Troll

  attr_reader :id, :name, :breed, :adoptable, :admission_date, :owner_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @breed = options['breed']
    @adoptable = options['adoptable']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id']
  end

  def save

    sql = "INSERT INTO trolls
    (
    name, breed, adoptable, admission_date, owner_id
    )
    VALUES
    (
    $1, $2, $3, $4, $5
    )
    RETURNING id"

    values = [@name, @breed, @adoptable, @admission_date, @owner_id]
    result = SqlRunner.run( sql, values )
    @id = result.first['id']

  end

end
