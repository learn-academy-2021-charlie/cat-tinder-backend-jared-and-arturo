cats = [
    {
      name: 'Cheddar',
      age: 1,
      enjoys: 'Sneaking outside'
    },
    {
      name: 'Luna',
      age: 2,
      enjoys: 'Getting in the way of everything.'
    },
    {
      name: 'Colby',
      age: 1,
      enjoys: 'Keyboards.'
    },
    {
      name: 'Mischeif',
      age: 2,
      enjoys: 'lurking in darkness.'
    }
  ]
  
  cats.each do |attributes|
    Cat.create attributes
    puts "creating cat #{attributes}"
  end
  
