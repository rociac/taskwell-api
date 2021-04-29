10.times do
  Project.create(
    name: Faker::ProgrammingLanguage.name,
    project_type: 'Software',
    description: Faker::Lorem.sentence(word_count: 10),
    live_link: 'example.com',
    image_url: 'https://images.unsplash.com/photo-1619251598810-b086ea2c030a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    user_id: '1'
  )
end
