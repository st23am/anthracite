#= require_tree "./templates"

window.App = Ember.Application.create()

App.Store = DS.Store.extend
  adapter: 'DS.RESTAdapter'

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

  addToInitiative: (character) ->
    character.set('inCombat', true)
    character.save()

  sortProperties: ['name']

App.InitiativeController = Ember.ArrayController.extend
  inCombatCharacters:  ->
    @model.filterProperty('inCombat', true)

  sortProperties: ['init_score', 'init_mod']
  sortAscending: false

App.Character = DS.Model.extend
  name:         DS.attr('string')
  initScore:    DS.attr('number')
  name:         DS.attr('string')
  hp:           DS.attr('string')
  initMod:      DS.attr('number')
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
  playerClass:  DS.attr('string')
  player:       DS.attr('string')
  speed:        DS.attr('number')
  details:      DS.attr('string')
  ac:           DS.attr('number')
  inCombat:     DS.attr('boolean')

