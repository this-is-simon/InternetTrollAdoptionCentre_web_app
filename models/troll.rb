require_relative('../db/sql_runner')

class Troll

  attr_reader :id
  attr_accessor :name, :breed, :adoptable, :admission_date, :owner_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @breed = options['breed']
    @adoptable = options['adoptable']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id'] if options['owner_id']
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

  def self.all

    #1. Request data from database
    sql = "SELECT * FROM trolls"

    #2. Run Postgres file on data to receive hashes
    troll_hashes = SqlRunner.run(sql)

    #3. Change hashes into objects through mapping
    troll_objects = troll_hashes.map {|troll| Troll.new (troll)  }

    #4. Return objects
    return troll_objects

  end

  def self.find(id)

    sql = "SELECT * FROM trolls WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    troll = Troll.new(result)
    return troll

  end

  def owner
    if @owner_id != nil
      owner = Owner.find(@owner_id)
      return owner
    end
  end

  def update

    sql = "UPDATE trolls SET
    (
    name, breed, adoptable, admission_date, owner_id
    ) =
    (
    $1, $2, $3, $4, $5
    )
    WHERE id = $6"

    values = [@name, @breed, @adoptable, @admission_date, @owner_id, @id]

    SqlRunner.run( sql, values )

  end

  def delete

    sql = "DELETE FROM trolls WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)

  end

  def self.delete_all

    sql = "DELETE FROM trolls"
    SqlRunner.run(sql)

  end

end
