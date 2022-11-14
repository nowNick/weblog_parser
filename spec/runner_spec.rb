require 'runner'

RSpec.describe Runner do
    describe "#run" do
        subject { Runner.new.run(filepath) }
        context "when file exists" do
            context "when no visits" do
                let(:filepath) { fixture_path("empty.log") }

                it "does not counts visits" do
                    expect { subject }.to output("Parsing #{filepath}\nNo visits\n").to_stdout
                end
            end

            context "when visits" do
                let(:filepath) { fixture_path("test.log") }
                let(:expected_output) do
                    <<~EXPECTED_OUTPUT
                    Parsing #{filepath}
                    Unique visits:
                    /path/1 2 unique views
                    /path/2 2 unique views
                    /path/3 1 unique view

                    Pageviews:
                    /path/1 3 visits
                    /path/2 2 visits
                    /path/3 1 visit
                    EXPECTED_OUTPUT
                end


                it "displays unique visits and pageviews" do
                    expect { subject }.to output(expected_output).to_stdout
                end
            end
        end

        context "when file does not exist" do
            let(:filepath) { "fixtures/non-existing-file.log" }

            it "displays that file does not exist" do
                expect { subject }.to output("Parsing #{filepath}\nFile does not exist\n").to_stdout
            end
        end
    end
end
