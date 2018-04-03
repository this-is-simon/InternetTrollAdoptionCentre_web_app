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

  ##can't get this to work
  def troll
    sql = "SELECT * FROM trolls INNER JOIN owners ON trolls.owner_id = owners.id"
    troll_hash = SqlRunner.run(sql)
    result = troll_hash.map {|troll| Troll.new (troll)}
    return result
  end
  ###

  # def troll()
  #   sql = "SELECT trolls.*
  #   FROM trolls
  #   INNER JOIN owners
  #   ON trolls.owner_id = owners.id
  #   WHERE location_id = $1"
  #   values = [@id]
  #   user_data = SqlRunner.run(sql, values)
  #   return User.map_items(user_data)
  # end

###
# def users()
#     sql = "SELECT users.*
#     FROM users
#     INNER JOIN visits
#     ON visits.user_id = users.id
#     WHERE location_id = $1"
#     values = [@id]
#     user_data = SqlRunner.run(sql, values)
#     return User.map_items(user_data)
#   end


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
