# frozen_string_literal: true

require 'visit_counter'

RSpec.describe VisitCounter do
  describe '#visits' do
    subject { described_class.new.visits_by_ip(file_content) }

    context 'with empty file' do
      let(:file_content) { '' }

      it { is_expected.to eq({}) }
    end

    context 'with file content' do
      let(:file_content) do
        <<~FILE_CONTENT
          /path/1 172.0.0.1
          /path/1 172.0.0.1
          /path/1 172.0.0.2

          /path/2 172.0.0.1
          error
          /path/2 172.0.0.2

          /path/3 172.0.0.5
        FILE_CONTENT
      end

      let(:expected_result) do
        {
          '/path/1' => ['172.0.0.1', '172.0.0.1', '172.0.0.2'],
          '/path/2' => ['172.0.0.1', '172.0.0.2'],
          '/path/3' => ['172.0.0.5']
        }
      end

      it { is_expected.to eq(expected_result) }
    end
  end
end
