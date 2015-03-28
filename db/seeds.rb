# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TimeCombo.where(time: "morning").first_or_create
TimeCombo.where(time: "noon").first_or_create
TimeCombo.where(time: "night").first_or_create
TimeCombo.where(time: "morning noon").first_or_create
TimeCombo.where(time: "morning night").first_or_create
TimeCombo.where(time: "noon night").first_or_create
TimeCombo.where(time: "morning noon night").first_or_create

