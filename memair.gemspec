Gem::Specification.new do |s|
  s.name        = 'memair'
  s.version     = '0.0.2'
  s.date        = '2018-09-21'
  s.summary     = 'An SDK for Memair'
  s.description = 'An SDK for Memair allowing easy querying of the GraphQL API'
  s.authors     = ['Greg Clarke']
  s.email       = 'greg@gho.st'
  s.files       = ['lib/memair.rb']
  s.homepage    = 'https://github.com/memair/memair-ruby-sdk'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.16.0'
end
