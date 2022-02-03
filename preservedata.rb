require 'json'

module PreserveData
  def create_file(path)
    Dir.mkdir('data') unless Dir.exist?('data')

    File.open(path, 'w') do |file|
      file.puts JSON.generate([])
    end
  end

  def fetch_data(path)
    JSON.parse(File.read(path), create_additions: true)
  end

  def save(path, data)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  def file_exist?(filename)
    File.exist? filename
  end

  def fetch_users
    path = 'data/users.json'

    if file_exist?(path)
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

  def fetch_books
    path = 'data/books.json'

    if file_exist?(path)
      fetch_data(path).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_rentals
    path = 'data/rentals.json'

    if file_exist?(path)
      fetch_data(path).map do |rental|
        date = rental['date']
        select_user = users.select { |user| user.id == rental['id'] }
        select_book = books.select { |book| book.title == rental['title'] }

        Rental.new(select_user[0], select_book[0], date)
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
    data = fetch_data(path)

    data.push({ title: book.title, author: book.author })
    save(path, data)
  end

  def save_rental(rental)
    path = 'data/rentals.json'
    data = fetch_data(path)

    data.push({ date: rental.date, id: rental.person.id, title: rental.book.title })
    save(path, data)
  end
end
