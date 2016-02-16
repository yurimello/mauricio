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
Interaction.create question: '.*restaurante(\s(no|na|em)\s)(.+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"3" => 'neighborhood'}
Interaction.create question: '.*restaurante', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api'
Interaction.create question: '.*(musica|video)', answer: 'hmmm voce quer um video', question_type: 'youtube'


Chefsclub::NeighborhoodSlang.delete_all
Chefsclub::NeighborhoodSlang.create slang: "barra", translated: "Barra da Tijuca"
Chefsclub::NeighborhoodSlang.create slang: "recreio", translated: "Recreio dos Bandeirantes"
Chefsclub::NeighborhoodSlang.create slang: "jpa", translated: "Jacarepagua"
Chefsclub::NeighborhoodSlang.create slang: "jb", translated: "Jardim Botanico"

Chefsclub::CuisineSlang.delete_all
Chefsclub::CuisineSlang.create slang: "japones", translated: "japonesa"
Chefsclub::CuisineSlang.create slang: "japa", translated: "japonesa"
Chefsclub::CuisineSlang.create slang: "churrasco", translated: "churrascaria"
Chefsclub::CuisineSlang.create slang: "carne", translated: "churrascaria"
Chefsclub::CuisineSlang.create slang: "hamburguer", translated: "hamburgueria"
Chefsclub::CuisineSlang.create slang: "frances", translated: "francesa"
Chefsclub::CuisineSlang.create slang: "portuges", translated: "portuguesa"
Chefsclub::CuisineSlang.create slang: "mexicano", translated: "mexicana"
Chefsclub::CuisineSlang.create slang: "nachos", translated: "mexicana"
Chefsclub::CuisineSlang.create slang: "burritos", translated: "mexicana"
Chefsclub::CuisineSlang.create slang: "tacos", translated: "mexicana"
Chefsclub::CuisineSlang.create slang: "pizza", translated: "pizzaria"
Chefsclub::CuisineSlang.create slang: "peruano", translated: "peruana"
Chefsclub::CuisineSlang.create slang: "ceviche", translated: "peruana"


Chefsclub::CuisineSlang.generate_interaction_to_all

Modifier.delete_all
Modifier.create expression: '(namorad(o|a))', captures: {"1" => 'occasion'}, modifier_type: 'string', value: 'jantar-romantico'
Modifier.create expression: '(jantar com (a|o) namorad(a|o))', captures: {"1" => 'occasion'}, modifier_type: 'string', value: 'jantar-romantico'

Modifier.create expression: '(jantar)', captures: {"1" => 'discounttime'}, modifier_type: 'time', value: 'night'
Modifier.create expression: '(amanha)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'tomorrow'
Modifier.create expression: '(hoje|hj)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'today'
Modifier.create expression: '(agora)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'now'
Modifier.create expression: '(semana (q|que) (vem|vm))', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_week'
Modifier.create expression: '(segunda(-feira)?)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_monday'
Modifier.create expression: '(terca(-feira)?)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_tuesday'
Modifier.create expression: '(quarta(-feira)?)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_wednesday'
Modifier.create expression: '(quinta(-feira)?)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_thrusday'
Modifier.create expression: '(sexta(-feira)?)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_friday'
Modifier.create expression: '(sabado)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_saturday'
Modifier.create expression: '(domingo)', captures: {"1" => 'discountime'}, modifier_type: 'time', value: 'next_sunday'

Modifier.create expression: '(um|1) restaurante', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'one'
Modifier.create expression: '(dois|2) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'two'
Modifier.create expression: '(tres|3) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'three'
Modifier.create expression: '(quatro|4) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'four'
Modifier.create expression: '(cinco|5) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'five'
Modifier.create expression: '(seis|6) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'six'
Modifier.create expression: '(sete|7) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'seven'
Modifier.create expression: '(oito|8) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'eight'
Modifier.create expression: '(nove|9) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'nine'
Modifier.create expression: '(dez|10) restaurantes', captures: {"1" => 'size'}, modifier_type: 'integer', value: 'ten'
