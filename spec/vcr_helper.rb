require "vcr"

VCR.configure do |c|
  vcr_mode = :once	
  c.cassette_library_dir = 'vcr/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.debug_logger = $stderr if ENV['VCR_DEBUG']
end
