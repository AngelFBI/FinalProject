# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lists = [
  {
    name: 'List 1',
    color: 'success',
    priority: 'Low'
  },
  {
    name: 'List 2',
    color: 'danger',
    priority: 'Medium'
  },
  {
    name: 'List 3',
    color: 'info',
    priority: 'High'
  }
]

List.create(lists)

tasks = [
  {
    title: 'Task 1',
    details: 'A very well decriptive first task',
    started_at: Time.zone.now - 3.days,
    finished_at: Time.zone.now,
    justification: 'Was a complicated task',
    list_id: List.first.id
  },
  {
    title: 'Task 2',
    details: '<ol><li>first this</li><li>Then this</li></ol>',
    started_at: Time.zone.now - 3.days,
    finished_at: Time.zone.now,
    list_id: List.first.id
  },
  {
    title: 'Task 3',
    details: '<ul><li>do this</li><li>do also this</li></ul>',
    started_at: Time.zone.now - 3.days,
    list_id: List.second.id
  },
  {
    title: 'Task 4',
    details: 'You can do it, I believe in you',
    list_id: List.last.id
  }
]

Task.create(tasks)
