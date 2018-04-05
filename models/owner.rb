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

  def self.all

    sql = "SELECT * FROM owners"

    results = SqlRunner.run(sql)
    owner_objects = results.map {|owner| Owner.new(owner) }

    return owner_objects

  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    owner = Owner.new(result)
    return owner

  end

  def trolls
    sql = "SELECT trolls.* FROM trolls INNER JOIN owners ON trolls.owner_id = owners.id WHERE trolls.owner_id = $1"
    values = [@id]
    troll_hash = SqlRunner.run(sql, values)
    result = troll_hash.map {|troll| Troll.new (troll)}
    return result
  end

  def update

    sql = "UPDATE owners SET
    (name)
    =
    ($1)
    WHERE id=$2"

    values = [@name, @id]
    SqlRunner.run( sql, values )

  end


  def self.delete_all

    sql = "DELETE FROM owners"
    SqlRunner.run(sql)

  end

end
