require 'runner'

RSpec.describe Runner do
    describe "#run" do
        subject { Runner.new.run(filepath) }
        let(:filepath) { "some_file.txt" }

        context "when file exists" do
            let(:file_mock) { double("file_like") }

            before(:each) do
                allow(File).to receive(:open).and_return(file_mock)
                allow(file_mock).to receive(:each_line).and_return("")
            end

            it "counts visits" do
                expect { subject }.to output("Parsing #{filepath}\nNo visits\n").to_stdout
            end
        end

        context "when file does not exist" do
            before(:each) do
                allow(File).to receive(:open).and_raise(Errno::ENOENT)
            end

            it "counts visits" do
                expect { subject }.to output("Parsing #{filepath}\nFile does not exist\n").to_stdout
            end
        end
    end
end
