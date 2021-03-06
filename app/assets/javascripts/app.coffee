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
    @controllerFor('initiative').set('model', App.Initiative)

  events:
    addToInitiative: (character) ->
      character.set("inCombat", true)
      character.save()

    removeFromInitiative: (character) ->
      character.set("inCombat", false)
      character.save()

App.CharactersRoute = Ember.Route.extend
  model: ->
    App.Character.find()

  setupController: (controller, models) ->
    @controller.set("content", models)
    App.Initiative.set("content", models)

App.CharactersController = Ember.ArrayController.extend

  createCharacter: ->
    name = @get('newName')
    character = App.Character.createRecord
      name: name,
    @set('newName', '')
    character.save()

  sortProperties: ['name']

App.CharacterController = Ember.ObjectController.extend
  isEditing: false

  editCharacter: ->
    @set('isEditing', true)

  submit: ->
    @set('isEditing', false)
    @get('model').save()

App.InitiativeController = Ember.ArrayController.extend
  sortProperties: ['initScore', 'initMod']
  sortAscending: false

App.Initiative = Ember.ArrayProxy.createWithMixins
  content: []
  arrangedContent: ( ->
    (@get('content') || []).filterProperty("inCombat", true)
  ).property("content.@each.inCombat")

App.Character = DS.Model.extend
  name:         DS.attr('string')
  initScore:    DS.attr('number')
  name:         DS.attr('string')
  hp:           DS.attr('number')
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
  level:        DS.attr('number')
  inCombat:     DS.attr('boolean')

