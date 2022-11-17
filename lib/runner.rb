# frozen_string_literal: true

require_relative './visit_counter'
require_relative './visit_formatter'

class Runner
  def run(filepath)
    puts "Parsing #{filepath}"
    file = File.open(filepath)

    views_by_ip = VisitCounter.new.visits_by_ip(file)

    if views_by_ip.empty?
      puts 'No visits'
    else
      puts_counts(views_by_ip)
    end
  rescue Errno::ENOENT
    puts 'File does not exist'
  end

  private

  def puts_counts(views_by_ip)
    visits = views_by_ip.transform_values(&:count)
    unique_visits = views_by_ip.transform_values { |list_with_duplicates| list_with_duplicates.uniq.count }

    puts_unique_visits(unique_visits)
    puts
    puts_pageviews(visits)
  end

  def puts_unique_visits(unique_visits)
    puts 'Unique visits:'
    puts VisitFormatter.new(lambda { |(url, visits)|
                              "#{url} #{visits} unique view#{visits > 1 ? 's' : ''}"
                            }).format(unique_visits)
  end

  def puts_pageviews(pageviews)
    puts 'Pageviews:'
    puts VisitFormatter.new(lambda { |(url, visits)|
                              "#{url} #{visits} visit#{visits > 1 ? 's' : ''}"
                            }).format(pageviews)
  end
end
