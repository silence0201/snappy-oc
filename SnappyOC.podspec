Pod::Spec.new do |spec|
  spec.name         = "SnappyOC"
  spec.version      = "1.1"
  spec.summary      = "Snappy For OC"
  spec.description  = <<-DESC
                      Snappy Wrap With Objective-C
                   DESC

  spec.homepage     = "https://github.com/silence0201/snappy-oc"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Silence" => "374619540@qq.com" }

  spec.ios.deployment_target = "7.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"


  spec.source       = { :git => "https://github.com/silence0201/snappy-oc.git", :tag => "#{spec.version}" }

  spec.source_files  = "SnappyOC", "snappy-oc/SnappyOC/**/*.{h,m}"
  spec.vendored_libraries = 'libsnappy-oc.a', 'snappy-oc/SnappyOC/libsnappy-oc.a'

  spec.libraries = 'c++'
  spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }

end
