class VisitCounter
    def count_visits(log_file)
        visits = visits_by_ip(log_file)
        count_uniqes(visits)
    end

    private

    def visits_by_ip(log_file)
        counter = Hash.new { |hash, key| hash[key] = []}
        log_file.each_line do |line|
            url, ip = line.split
            next if url.nil? || ip.nil?

            counter[url] << ip
        end
        counter
    end

    def count_uniqes(hash)
       hash.map { |url, list_with_duplicates| [url, list_with_duplicates.uniq.count] }.to_h
    end
end
