window.App = Ember.Application.create()

App.Store = DS.Store.extend
  adapter: 'DS.FixtureAdapter'

App.Router.map ->
  @resource 'characters', ->
    @resource 'character', path: ':character_id'

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('characters')

App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('initiative').set('model', App.Character.find())

App.CharactersRoute = Ember.Route.extend
  model: ->
    App.Character.find()

App.CharactersController = Ember.ArrayController.extend
  createCharacter: ->
    name = @get('newName')
    character = App.Character.createRecord
      name: name,
    @set('newName', '')
    character.save()

App.InitiativeController = Ember.ArrayController.extend
  sortProperties: ['init_score', 'init_mod']
  sortAscending: false


App.Character = DS.Model.extend
  name:         DS.attr('string')
  init_score:   DS.attr('number')
  name:         DS.attr('string')
  hp:           DS.attr('string')
  init_mod:     DS.attr('number')
  strength:     DS.attr('string')
  agility:      DS.attr('string')
  stamina:      DS.attr('string')
  personality:  DS.attr('string')
  intelligence: DS.attr('string')
  luck:         DS.attr('string')
  reflex:       DS.attr('string')
  fortitude:    DS.attr('string')
  will:         DS.attr('string')
  alignment:    DS.attr('string')
  occupation:   DS.attr('string')
  player_class: DS.attr('string')
  player:       DS.attr('string')
  speed:        DS.attr('number')
  details:      DS.attr('string')
  ac:           DS.attr('number')

App.Character.FIXTURES = [
  { id: 1, name: "Tim",  init_score: 5,  init_mod: 1, hp: '4',  ac: '12' },
  { id: 2, name: "Bob",  init_score: 5 , init_mod: 2, hp: '10', ac: '14'  },
  { id: 3, name: "Dave", init_score: 12, init_mod: 3, hp: '21', ac: '16' }]

