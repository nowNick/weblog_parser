require 'visit_counter'

RSpec.describe VisitCounter, "#visits" do
    context "with no file" do
        it "shows no count" do
            counter = VisitCounter.new
            expect(counter.visits).to be_nil            
        end
    end
end
