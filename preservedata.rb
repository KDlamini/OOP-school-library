require 'json'

module PreserveData
  def create_file(path)
    Dir.mkdir('data') unless Dir.exist?('data')

    File.open(path, 'w') do |file|
      file.puts JSON.generate([])
    end
  end

  def fetch_data(path)
    data = JSON.parse(File.read(path), create_additions: true)
  end

  def fetch_users
    path = 'data/users.json'

    if does_file_exist?('users')
      fetch_data(path).map do |users|
        if users['instance'] == 'Teacher'
          teacher = Teacher.new(id: users['id'], specialization: users['specialization'],
                                age: users['age'], name: users['name'])
          teacher
        else
          parent_permission = users['permission'] && true
          student = Student.new(id: users['id'], age: users['age'], name: users['name'],
                                parent_permission: parent_permission, classroom: users['classroom'])
          student
        end
      end
    else
      create_file(path)
      []
    end
  end

  def save_user(user)
    path = 'data/users.json'
    data = fetch_data(path)

    if user.instance_of?(Teacher)
      data.push({ instance: 'Teacher', id: user.id, age: user.age, name: user.name,
                  specialization: user.specialization })
    else
      data.push({ instance: 'Student', id: user.id, age: user.age, name: user.name,
                  permission: user.parent_permission, classroom: user.classroom })
    end

    save(path, data)
  end

  def save_book(book)
    path = 'data/books.json'
    fetch_data(path)

    data.push({ title: book.title, author: book.author })
    save(path, data)
  end

  def save_rental(rental)
    path = 'data/rental.json'
    fetch_data(path)

    data.push({ date: rental.date, person: rental.person.id, book: rental.book.title })
    save(path, data)
  end

  def save(path, data)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  def does_file_exist?(filename)
    File.exist? "data/#{filename}.json"
  end
end
