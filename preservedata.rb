require 'json'

module PreserveData
    def fetch_saved_data(filename)
        path = "data/#{filename}.json"
        data = []

        if does_file_exist?(filename)
            data = File.read(path)
            data = JSON.parse(data)
        else
            Dir.mkdir("data") unless Dir.exists?("data")
            File.open(path,'w') do |file|
              file.puts JSON.generate([])
            end
        end

        data
    end

    def does_file_exist?(filename)
        File.exists? "data/#{filename}.json"
    end
end