require_relative('../db/sql_runner')

class Owner

  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save

    sql = "INSERT INTO owners
    (
    name
    )
    VALUES
    (
    $1
    )
    RETURNING id"

    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']

  end


end
