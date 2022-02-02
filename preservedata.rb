require 'json'

module PreserveData
  def fetch_saved_data(filename)
    path = "data/#{filename}.json"
    data = []

    if does_file_exist?(filename)
      data = JSON.parse(File.read(path))
    else
      Dir.mkdir('data') unless Dir.exist?('data')
      File.open(path, 'w') do |file|
        file.puts JSON.generate([])
      end
    end

    data
  end

  def does_file_exist?(filename)
    File.exist? "data/#{filename}.json"
  end
end
