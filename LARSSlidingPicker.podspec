Pod::Spec.new do |s|
	s.name = 'LARSSlidingPicker'
	s.version = '1.0.0'
	s.summary = 'This UIPicker subclass provides the ability to be called and mimic the look and feel of the standard keyboard, sliding onto the screen from the bottom'
	s.homepage = 'https://github.com/larsacus/LARSSlidingPicker'
	s.author = {
		'Lars Anderson' => 'iAm@theonlylars.com'
	}
	s.license = {:type => 'MIT'}
	s.platform = :ios, '5.0'
	s.source = {
		:git => 'git@github.com:larsacus/LARSSlidingPicker.git',
		:tag => s.version.to_s
	}
	s.requires_arc = true
	s.source_files = '*.{h,m}'
end