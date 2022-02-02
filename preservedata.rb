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

  def save_user(filename, user)
    path = "data/#{filename}.json"
    data = fetch_saved_data(filename)

    if user.instance_of?(Teacher)
      data.push({ instance: 'teacher', id: user.id, age: user.age, name: user.name,
                  specialization: user.specialization })
    else
      data.push({ instance: 'student', id: user.id, age: user.age, name: user.name,
                  permission: user.parent_permission, classroom: user.classroom })
    end

    File.write(path, JSON.generate(data, create_additions: true))
  end

  def does_file_exist?(filename)
    File.exist? "data/#{filename}.json"
  end
end
