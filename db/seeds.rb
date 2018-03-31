require_relative('../models/troll')
require_relative('../models/owner')

troll1 = Troll.new(
  'name' => 'John Arthur',
  'breed' => 'Neo Nazi',
  'adoptable' => true,
  'admission_date' => '2018-03-15',
  'owner_id' => 1
)

troll1.save
