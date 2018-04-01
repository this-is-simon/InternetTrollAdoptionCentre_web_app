require_relative('../models/troll')
require_relative('../models/owner')

Troll.delete_all
Owner.delete_all

owner1 = Owner.new(
  'name' => 'Simon'
)

owner1.save

owner2 = Owner.new(
  'name' => 'Michael'
)

owner2.save

owner3 = Owner.new(
  'name' => 'Rachael'
)

owner3.save

owner4 = Owner.new(
  'name' => 'Aileen'
)

owner4.save

troll1 = Troll.new(
  'name' => 'Richard Spencer',
  'breed' => 'Neo Nazi',
  'adoptable' => true,
  'admission_date' => '2018-03-15',
  'owner_id' => owner1.id
)

troll1.save

troll2 = Troll.new(
  'name' => 'Jordan Peterson',
  'breed' => 'Alt-Right Misogynist',
  'adoptable' => true,
  'admission_date' => '2018-01-14',
  'owner_id' => nil
)

troll2.save

troll3 = Troll.new(
  'name' => 'Trevor Noah',
  'breed' => 'Angry Snowflake',
  'adoptable' => true,
  'admission_date' => '2017-10-21',
  'owner_id' => nil
)

troll3.save

troll4 = Troll.new(
  'name' => 'Milo Yiannopoulos',
  'breed' => 'Free Speech Scumbag',
  'adoptable' => true,
  'admission_date' => '2017-03-10',
  'owner_id' => nil
)

troll4.save

troll5 = Troll.new(
  'name' => 'Donald Trump',
  'breed' => 'Very Stable Genius',
  'adoptable' => true,
  'admission_date' => '2018-03-30',
  'owner_id' => owner2.id
)

troll5.save

troll6 = Troll.new(
  'name' => 'Alex Jones',
  'breed' => 'Flat Earther',
  'adoptable' => false,
  'admission_date' => '2016-07-18',
  'owner_id' => nil,
)

troll6.save

p Troll.all
