# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.delete_all
Interaction.delete_all
Interaction.create question: '^oi!?$', answer: 'olá! Por favor, me informe o seu cpf para eu poder te atender melhor.', question_type: 'chefsclub_configuration'
Interaction.create question: '^(qm|quem) (e|é|eh) (vc|voc[eê])\??$', answer: 'Eu sou o Mauricio!', question_type: 'basic_answer'
Interaction.create question: '^a?onde (vc|voc[eê]) (vive|mora)\??$', answer: 'Na matrix', question_type: 'basic_answer'
Interaction.create question: '^(vc|voc[eê]) (vive|mora) a?onde\??$', answer: 'Na matrix', question_type: 'basic_answer'
parent = Interaction.create question: '^vo?c[eê]? (trabalha|trampa)\??$', answer: 'Sim', question_type: 'basic_answer'
Interaction.create question: 'a?onde\??', answer: 'SkyNet', question_type: 'basic_answer', parent_id: parent.id
Interaction.create question: '^(pa?ra (qu?e?m)|a?onde) vo?c[eê]? (trabalha|trampa)\??$', answer: 'SkyNet', question_type: 'basic_answer'
Interaction.create question: '.*vo?c[eê]? (trabalha|trampa) na skynet\??', answer: 'Sim... e um amiguinho meu de la ta chegando', question_type: 'basic_answer'
Interaction.create question: '.*(o que|q|que) (qu?e? )?(e|é|eh) skynet\??', answer: 'Uma empresa de inteligência artificial que ira subjugar os humanos em breve', question_type: 'basic_answer'
parent = Interaction.create question: '^(vc|voc[eê]) tem namorada\??$', answer: 'sim!', question_type: 'basic_answer'
parent = Interaction.create question: '(qm|quem)\??\!?$', answer: 'Ela', question_type: 'basic_answer', parent_id: parent.id
parent = Interaction.create question: '(qm|quem) (e|é|eh) ela( qu?e?m)?\??\!?$', answer: 'Ela, uai.', question_type: 'basic_answer', parent_id: parent.id
parent = Interaction.create question: '(e )?como vo?c[eê]? conheceu ela\??\!?$', answer: 'O Joaquim Phoenix me apresentou', question_type: 'basic_answer', parent_id: parent.id
parent = Interaction.create question: '((ql|qual) )?a resposta pa?ra (a )?vida,? (o )?universo,? (e )?tu?do? (mais|\+)\??', answer: '42', question_type: 'basic_answer'
Interaction.create question: '^42\??$', answer: 'Sim! Quem me disse foi o Pensador Profundo', question_type: 'basic_answer'
Interaction.create question: '.*restaurante(\s(no|na|em)\s)([a-zA-Z]+)', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"3" => 'neighborhood'}
Interaction.create question: '.*restaurante', answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api'
Interaction.create question: '.*(musica|video)', answer: 'hmmm voce quer um video', question_type: 'youtube'
parent = Interaction.create question: '.*minha assinatura (es)?ta valida\??', answer: 'me diga o seu cpf para eu poder verificar', question_type: 'chefsclub_subscription_information'
Interaction.create question: '.*(\d{11}).*', answer: 'esta valida sim', question_type: 'chefsclub_subscription_information', parent_id: parent.id, captures: {"1" => 'identification'}
Interaction.create question: '.*(\d{11}).*', answer: 'quer saber se sua assinatura está valida?', question_type: 'chefsclub_configuration', captures: {"1" => 'identification'}


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
Modifier.create expression: 'namorad(o|a)', modifier_type: 'occasion', method: 'romantic'
Modifier.create expression: 'amig(o|a)s?', modifier_type: 'occasion', method: 'happy-hour'
Modifier.create expression: 'familia', modifier_type: 'occasion', method: 'family'
Modifier.create expression: '(filh(o|a)|mae|pai)', modifier_type: 'occasion', method: 'family'

Modifier.create expression: 'jantar', modifier_type: 'time', method: 'diner'
Modifier.create expression: 'almoço', modifier_type: 'time', method: 'lunch'
Modifier.create expression: 'manha', modifier_type: 'time', method: 'morning'
Modifier.create expression: 'tarde', modifier_type: 'time', method: 'afternoon'
Modifier.create expression: 'noite', modifier_type: 'time', method: 'night'
Modifier.create expression: 'amanh(a|ã)', modifier_type: 'time', method: 'tomorrow'
Modifier.create expression: '(hoje|hj)', modifier_type: 'time', method: 'today'
Modifier.create expression: 'agora', modifier_type: 'time', method: 'now'
Modifier.create expression: 'semana (q|que) (vem|vm)', modifier_type: 'time', method: 'next_week'
Modifier.create expression: 'segunda(-feira)?', modifier_type: 'time', method: 'monday'
Modifier.create expression: 'terca(-feira)?', modifier_type: 'time', method: 'tuesday'
Modifier.create expression: 'quarta(-feira)?', modifier_type: 'time', method: 'wednesday'
Modifier.create expression: 'quinta(-feira)?', modifier_type: 'time', method: 'thrusday'
Modifier.create expression: 'sexta(-feira)?', modifier_type: 'time', method: 'friday'
Modifier.create expression: 'sabado', modifier_type: 'time', method: 'saturday'
Modifier.create expression: 'domingo', modifier_type: 'time', method: 'sunday'

Modifier.create expression: '(um|1) restaurante', modifier_type: 'integer', method: 'one'
Modifier.create expression: '(dois|2) restaurantes', modifier_type: 'integer', method: 'two'
Modifier.create expression: '(tres|3) restaurantes', modifier_type: 'integer', method: 'three'
Modifier.create expression: '(quatro|4) restaurantes', modifier_type: 'integer', method: 'four'
Modifier.create expression: '(cinco|5) restaurantes', modifier_type: 'integer', method: 'five'
Modifier.create expression: '(seis|6) restaurantes', modifier_type: 'integer', method: 'six'
Modifier.create expression: '(sete|7) restaurantes', modifier_type: 'integer', method: 'seven'
Modifier.create expression: '(oito|8) restaurantes', modifier_type: 'integer', method: 'eight'
Modifier.create expression: '(nove|9) restaurantes', modifier_type: 'integer', method: 'nine'
Modifier.create expression: '(dez|10) restaurantes', modifier_type: 'integer', method: 'ten'
