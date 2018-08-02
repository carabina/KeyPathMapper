Pod::Spec.new do |s|
  s.name             = "KeyPathMapper"
  s.version          = "1.0.0"
  s.summary          = "KeyPathMapper facilitates mapping between models"
  s.description      = <<-DESC
KeyPathMapper is a thin library based on swift #KeyPath feature which facilitates mapping between two different models.
                        DESC
  s.homepage         = "https://github.com/marshallxxx/KeyPathMapper"
  s.license          = 'MIT'
  s.author           = { 'Evghenii Nicolaev' => 'nicolaevevghenii@gmail.com' }
  s.social_media_url = 'https://twitter.com/ENicolaev'
  s.source           = { :git => "https://github.com/marshallxxx/KeyPathMapper", :tag => s.version.to_s }
  s.requires_arc          = true
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.source_files          = 'Sources/**/*.swift'
end