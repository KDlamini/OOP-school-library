require 'json'

module PreserveData
  def fetch_saved_data(filename)
    path = "data/#{filename}.json"
    data = []

    if does_file_exist?(filename)
      data = JSON.parse(File.read(path), create_additions: true)
    else
      Dir.mkdir('data') unless Dir.exist?('data')
      File.open(path, 'w') do |file|
        file.puts JSON.generate([])
      end
    end

    data
  end

  def save(data, path)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  def save_user(filename, user)
    path = "data/#{filename}.json"
    data = fetch_saved_data(filename)

    if user.instance_of?(Teacher)
      data.push({ instance: 'Teacher', id: user.id, age: user.age, name: user.name,
                  specialization: user.specialization })
    else
      data.push({ instance: 'Student', id: user.id, age: user.age, name: user.name,
                  permission: user.parent_permission, classroom: user.classroom })
    end

    save(data, path)
  end

  def save_book(filename, book)
    path = "data/#{filename}.json"
    data = fetch_saved_data(filename)

    data.push({ title: book.title, author: book.author })
    save(data, path)
  end

  def does_file_exist?(filename)
    File.exist? "data/#{filename}.json"
  end
end
