# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tasks = [
  {
    title: 'Task 1',
    details: 'A very well decriptive first task',
    started_at: Time.now - 3.day,
    finished_at: Time.now,
    justification: 'Was a complicated task'
  },
  {
    title: 'Task 2',
    details: '<ol><li>first this</li><li>Then this</li></ol>',
    started_at: Time.now - 3.day,
    finished_at: Time.now
  },
  {
    title: 'Task 3',
    details: '<ul><li>do this</li><li>do also this</li></ul>',
    started_at: Time.now - 3.day
  },
  {
    title: 'Task 4',
    details: 'You can do it, I believe in you'
  },
]

Task.create(tasks)
