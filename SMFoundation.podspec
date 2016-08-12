Pod::Spec.new do |s|
  s.name         = 'SMFoundation'
  s.version      = '0.2.4'
  s.summary      = "Study_Sun's convenince function toolkit."
  s.homepage     = 'https://github.com/s6530085/SMFoundation'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = {'Study_Sun' => 'sunmin@sunmin.me' }
  s.platform     = :ios, '7.0' 
  s.source       = { :git => 'https://github.com/s6530085/SMFoundation.git', :tag => s.version }
  s.source_files  = 'SMFoundation/**/*'
  s.requires_arc = true;
end
