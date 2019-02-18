Pod::Spec.new do |s|
s.name = 'ZinkNavigation'
s.version = '1.0.1'
s.license = 'MIT'
s.summary = 'UINavigation Helper'
s.homepage = 'https://github.com/zinkLin'
s.authors = { 'Zink' => '418175138@qq.com' }
s.source = { :git => "https://github.com/zinkLin/ZinkNavigation", :tag => "1.0.1"}
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = "ZinkNavigation/*"
end