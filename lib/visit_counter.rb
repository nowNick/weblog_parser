# frozen_string_literal: true

class VisitCounter
  def visits_by_ip(log_file)
    counter = Hash.new { |hash, key| hash[key] = [] }
    log_file.each_line do |line|
      url, ip = line.split
      next if url.nil? || ip.nil?

      counter[url] << ip
    end
    counter
  end
end
