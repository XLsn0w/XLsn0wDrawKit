
Pod::Spec.new do |s|

  s.version         = "1.0.0"

  s.summary         = "XLsn0wDrawKit by UIBezierPath + CAShapeLayer + CAAnimation"
  s.author          = { "XLsn0w" => "xlsn0w@outlook.com" }

  s.name            = "XLsn0wDrawKit"
  s.homepage        = "https://github.com/XLsn0w/XLsn0wDrawKit"
  s.source          = { :git => "https://github.com/XLsn0w/XLsn0wDrawKit.git", :tag => s.version.to_s }

  s.source_files    = "DrawKit/**/*.{h,m}"

  s.frameworks      = "UIKit", "Foundation"

  s.requires_arc    = true
  s.license         = 'MIT'
  s.platform        = :ios, "8.0"

  s.dependency "XLsn0wKit_objc"

end

# ―――――――――――――――――――――――――――――――――――――  Pod Spec 注释  ――――――――――――――――――――――――――――――――――――――――――
# use `--allow-warnings` to ignore warnings
# ―――――――――――――――――――――――――――――――――――――  Pod Spec 注释  ――――――――――――――――――――――――――――――――――――――――――
