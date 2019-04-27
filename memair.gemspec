Gem::Specification.new do |s|
  s.name        = 'memair'
  s.version     = '0.1.0'
  s.date        = '2019-04-27'
  s.summary     = 'An SDK for Memair'
  s.description = 'An SDK for Memair allowing easy querying of the GraphQL API'
  s.authors     = ['Greg Clarke']
  s.email       = 'greg@memair.com'
  s.files       = ['lib/memair.rb', 'memair.gemspec']
  s.homepage    = 'https://github.com/memair/memair-ruby-sdk'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.16'
end
