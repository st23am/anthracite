window.App = Ember.Application.create()

App.Store = DS.Store.extend
  revision: 12
  adapter: 'DS.FixtureAdapter'

App.Router.map ->
  @resource 'characters', ->
    @resource 'character', path: ':character_id'

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo('characters')

App.ApplicationRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('initiative', App.Character.find())

App.CharactersRoute = Ember.Route.extend
  model: ->
    App.Character.find()

App.Character = DS.Model.extend
  name: DS.attr('name')

App.Character.FIXTURES = [
  { id: 1, name: "Tim",  init: 5 },
  { id: 2, name: "Bob",  init: 2 },
  { id: 3, name: "Dave", init: 12 }]

