# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Interaction.delete_all
Interaction.create question: 'oi!?', answer: 'oi! tudo em riba?', question_type: 'basic_answer'
Interaction.create question: 'tudo sim,? ?e com (voce|vc|você)\??', answer: 'numa nice ;)', question_type: 'basic_answer'
Interaction.create question: 'conhece o (hugo|huguinho)\??', answer: 'um boila?', question_type: 'basic_answer'
Interaction.create question: '.*restaurante(\s+.+)(\s(no|na|em)\s)(.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisine', "4" => 'neighborhood'}
Interaction.create question: '.*restaurante(\s(no|na|em)\s)(.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"3" => 'neighborhood'}
Interaction.create question: '.*restaurante(\s+.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisine'}