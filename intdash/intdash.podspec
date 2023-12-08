Pod::Spec.new do |s|
  s.name = 'intdash'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'
  s.version = '2.3.0'
  s.source = { :git => 'git@github.com:OpenAPITools/openapi-generator.git', :tag => 'vv2.3.0-next-946b424de' }
  s.authors = 'OpenAPI Generator'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OpenAPITools/openapi-generator'
  s.summary = 'intdash Swift SDK'
  s.source_files = 'intdash/Classes/**/*.swift'
  s.dependency 'AnyCodable-FlightSchool', '~> 0.6.1'
end
