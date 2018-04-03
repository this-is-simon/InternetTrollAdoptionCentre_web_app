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

owner5 = Owner.new(
  'name' => 'Claire'
)

owner5.save

troll1 = Troll.new(
  'name' => 'Richard Spencer',
  'breed' => 'Neo Nazi',
  'adoptable' => 'Yes',
  'admission_date' => '2018-03-15',
  'owner_id' => owner4.id
)

troll1.save

troll2 = Troll.new(
  'name' => 'Jordan Peterson',
  'breed' => 'Alt-Right Misogynist',
  'adoptable' => 'Yes',
  'admission_date' => '2018-01-14',
  'owner_id' => owner4.id
)

troll2.save

troll3 = Troll.new(
  'name' => 'Trevor Noah',
  'breed' => 'Angry Snowflake',
  'adoptable' => 'Yes',
  'admission_date' => '2017-10-21'
)

troll3.save

troll4 = Troll.new(
  'name' => 'Milo Yiannopoulos',
  'breed' => 'Free Speech Scumbag',
  'adoptable' => 'Yes',
  'admission_date' => '2017-03-10'
)

troll4.save

troll5 = Troll.new(
  'name' => 'Donald Trump',
  'breed' => 'Very Stable Genius',
  'adoptable' => 'Yes',
  'admission_date' => '2018-03-30'
)

troll5.save

troll6 = Troll.new(
  'name' => 'Alex Jones',
  'breed' => 'Flat Earther',
  'adoptable' => 'No',
  'admission_date' => '2016-07-18'
)

troll6.save

troll7 = Troll.new(
  'name' => 'Katie Hopkins',
  'breed' => 'Career Troll',
  'adoptable' => 'Yes',
  'admission_date' => '2016-07-18'
)

troll7.save
