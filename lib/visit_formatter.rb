class VisitFormatter
    def format(visits)
        return "No visits" if visits.empty?

        visits.
            sort_by { |_key, value| -value }.
            map { |url, visits| "#{url} #{visits} unique visits"}.
            join("\n")
    end
end
