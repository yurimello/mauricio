# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Interaction.delete_all
Interaction.create question: 'oi!?', answer: 'oi! tudo em riba?', question_type: 'basic_answer'
Interaction.create question: 'tudo( sim,?)? ?e com (voce|vc|você)\??', answer: 'numa nice ;)', question_type: 'basic_answer'
Interaction.create question: '.*restaurante(\s+.+)(\s(no|na|em)\s)(.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisines', "4" => 'neighborhood'}
Interaction.create question: '.*restaurante(\s(no|na|em)\s)(.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"3" => 'neighborhood'}
Interaction.create question: '.*restaurante(\s+.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisines'}
Interaction.create question: '.*(japa)(\s(no|na|em)\s)(.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisines', "4" => 'neighborhood'}
Interaction.create question: '.*(japa)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisines'}
Interaction.create question: '.*(musica|video)', answer: 'hmmm voce quer um video', question_type: 'youtube'


Chefsclub::NeighborhoodSlang.delete_all
Chefsclub::NeighborhoodSlang.create slang: "barra", translated: "Barra da Tijuca"
Chefsclub::NeighborhoodSlang.create slang: "recreio", translated: "Recreio dos Bandeirantes"
Chefsclub::NeighborhoodSlang.create slang: "jpa", translated: "Jacarepagua"

Chefsclub::CuisineSlang.delete_all
Chefsclub::CuisineSlang.create slang: "japones", translated: "japonesa"
Chefsclub::CuisineSlang.create slang: "japa", translated: "japonesa"
Chefsclub::CuisineSlang.create slang: "churrasco", translated: "churrascaria"
Chefsclub::CuisineSlang.create slang: "carne", translated: "churrascaria"
Chefsclub::CuisineSlang.create slang: "hamburguer", translated: "hamburgueria"
Chefsclub::CuisineSlang.create slang: "frances", translated: "francesa"
Chefsclub::CuisineSlang.create slang: "portuges", translated: "portuguesa"
Chefsclub::CuisineSlang.create slang: "mexicano", translated: "mexicana"
