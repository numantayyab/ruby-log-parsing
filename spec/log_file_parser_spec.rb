require_relative '../lib/log_parser'
require 'tempfile'

describe LogParser do
  subject { described_class.new(log_file_path).launch }

  let(:log_file_path) do
    Tempfile.new(['webserver', '.log']).tap do |file|
      file.write(input)
      file.rewind
    end
  end

  context 'with non existing file' do
    let(:log_file_path) { '' }

    it 'should raise a missing file error' do
      expect { subject }.to raise_error("No file found to parse")
    end
  end

  context 'with correct file format' do
    let(:input) do
      <<~LOGFILE
        /index 8.9.3.1
        /home 1.2.3.4
        /index 5.6.7.8
        /contact 5.6.7.3
        /home 1.2.3.4
        /index 2.3.4.5
      LOGFILE
    end

    it 'should parse file and return hash map' do
      expect(subject).to eq(nil)
    end
  end
end
