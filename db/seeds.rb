# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create(name: 'English', country_code: 'uk')
Language.create(name: 'Spanish', country_code: 'es')
Language.create(name: 'Russian', country_code: 'ru')
Language.create(name: 'Chinese', country_code: 'cn')