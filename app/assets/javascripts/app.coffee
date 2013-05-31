App = Ember.Application.create()

App.CharactersController = Ember.ArrayController
  model: ->
    Character.find()
