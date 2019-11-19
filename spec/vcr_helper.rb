require "vcr"

VCR.configure do |c|
  vcr_mode = :once	
  c.cassette_library_dir = 'vcr/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.debug_logger = $stderr if ENV['VCR_DEBUG']
end

# RSpec.configure do |config|
#   config.around(:each, [:vcr_bot]) do |example|
#     if VCR.turned_on?
#       cassette = Pathname.new(example.metadata[:file_path]).cleanpath.sub_ext('').to_s
#       VCR.use_cassette(cassette, :record => :new_episodes, :match_requests_on => [:method, :path_query_matcher]) do
#         example.run
#       end
#     else
#       example.run
#     end
#   end
# end
