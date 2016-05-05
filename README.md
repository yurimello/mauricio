# Mauricio

Overview
========

This is a prototype project that interact with user without any interface.

It uses regex to get interaction and answer properly.

Interactions can have parent interecation, to be able to use context in conversation.

It communicates with Chefsclub API to get restaurants lists and answer user when he asks where he can get chefsclub restaurant

It communicates with Youtube API when users asks for a video or music

Its possible and very easy to implements any other api to mauricio get informations for user asks.


Try those intereactions with mauricio
-----------------------

- oi
- quem é você?
- onde vc mora?
- vc trabalha?
- quero ouvir uma musica
- jantar com a namorada
- quero um restaurante em jpa 
- quero comer burritos na barra 


Whats missing
-----------------------

* API for chats like slack, hipchat etc
* Implements core engine like gem
* Implements channel for each user instance
* Unit specs


Run on Mac OSX
-------------------------------

- `brew install redis`
- `git clone https://github.com/yurimello/mauricio.git`
- `cd mauricio`
- `bundle install`
- `rake db:create && rake db:migrate && rake db:seed`
- `redis-server`
- `rails s`
