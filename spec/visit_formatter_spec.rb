# frozen_string_literal: true

require 'visit_formatter'

RSpec.describe VisitFormatter do
  describe '#format' do
    subject { described_class.new(line_formatter).format(visits) }

    let(:line_formatter) { ->((url, visits)) { "#{url}-#{visits}" } }

    context 'with visits in random order' do
      let(:visits) do
        {
          '/path/1' => 5,
          '/path/2' => 2,
          '/path/3' => 100,
          '/path/4' => 0
        }
      end

      let(:expected_result) do
        <<~FORMATTED_VISITS
          /path/3-100
          /path/1-5
          /path/2-2
          /path/4-0
        FORMATTED_VISITS
      end

      it { is_expected.to eq(expected_result.rstrip) }
    end
  end
end
