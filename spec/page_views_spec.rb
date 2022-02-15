require_relative '../lib/log_parser'

describe LogParser do
  subject { described_class.new(log_file_path).launch }

  context 'with log file' do
    let(:log_file_path) { 'webserver.log' }

    it 'should return a list of page vists' do
      # expect { subject }.to output(expected_output).to_stdout
      expect { subject }.to output(include('/about/2 has 90 views', '/contact has 23 views')).to_stdout

    end
  end
end
