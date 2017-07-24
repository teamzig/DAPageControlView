Pod::Spec.new do |s|
  s.name             = "DAPageControlView"
  s.version          = "1.0.7"
  s.summary          = "A scrollable page control for those rare cases when UIPageControl won't fit screen width."
  s.homepage     = "https://github.com/brookso/DAPageControlView"
  s.license          = 'MIT'
  s.author       = { "Daria Kopaliani" => "daria.kopaliani@gmail.com" }
  s.source           = { :git => "https://github.com/teamzig/DAPageControlView.git", :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'
end
