class Runner
    def run(filepath)
        puts "Parsing #{filepath}"
        file = File.open(filepath)
        visits = VisitCounter.new.count_visits(file)
        puts VisitFormatter.new.format(visits)

    rescue Errno::ENOENT
        puts "File does not exist"
    end
end
