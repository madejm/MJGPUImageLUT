Pod::Spec.new do |s|
	s.name			= 'MJGPUImageLUT'
	s.version		= "1.0"
	s.summary		= "GPUImage CocoaLUT filter"
	s.authors		= "Mateusz Madej"
	s.license		= ""
	s.homepage		= "https://github.com/madejm"
	s.source		= { :git => '' }

	s.platform		= :ios, '10.3'
	s.requires_arc	= true

	s.source_files	= 'MJGPUImageLUT/*.{swift}'

	s.dependency 'GPUImage'
	s.dependency 'MJImageLUT'
end