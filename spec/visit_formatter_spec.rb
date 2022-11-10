require 'visit_formatter'

RSpec.describe VisitFormatter do
    describe "#format" do
        subject { VisitFormatter.new.format(visits) }

        context "with no visits" do
            let(:visits) { {} }

            it "shows no count" do
                expect(subject).to eq("No visits")
            end
        end

        context "with visits in random order" do
            let(:visits) do
                {
                    "/path/1" => 5,
                    "/path/2" => 2,
                    "/path/3" => 100,
                    "/path/4" => 0
                }
            end

            let(:expected_result) do
                <<~FORMATTED_VISITS
                /path/3 100 unique visits
                /path/1 5 unique visits
                /path/2 2 unique visits
                /path/4 0 unique visits
                FORMATTED_VISITS
            end

            it "formats visits output" do
                expect(subject).to eq(expected_result.rstrip)
            end
        end
    end
end
