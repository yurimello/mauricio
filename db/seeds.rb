# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Interaction.delete_all
Interaction.create question: 'oi!?', answer: 'oi! tudo em riba?'
Interaction.create question: 'tudo sim,? ?e com (voce|vc|você)\??', answer: 'numa nice ;)'
Interaction.create question: '.*restaurante(.*)(n[ao]*)(.*)', answer: 'hmmm voce quer um restaurante', question_type: 'restaurant_api', captures: {"1" => 'cuisine', "3" => 'neighborhood'}