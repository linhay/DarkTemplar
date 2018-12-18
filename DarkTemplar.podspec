Pod::Spec.new do |s|
  s.name    = 'DarkTemplar'
  s.version = '0.0.2'
  s.license = 'MIT'
  s.summary = '一代又一代的勇者们 都选择了黑暗圣堂之路.'
  
  s.homepage  = 'https://github.com/linhay/DarkTemplar'
  s.author    = { 'linhey' => 'is.linhay@outlook.com' }
  s.source    = { :git => 'https://github.com/linhay/DarkTemplar.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '8.0'
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  
  s.source_files = ['Sources/*.{swift,h,m}']
  
  s.requires_arc = true
end
