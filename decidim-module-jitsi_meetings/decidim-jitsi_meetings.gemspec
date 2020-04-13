# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/jitsi_meetings/version"

Gem::Specification.new do |s|
  s.version = Decidim::JitsiMeetings.version
  s.authors = ["bsd-mfamilia"]
  s.email = ["mvp.manuelfamilia@gmail.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-jitsi_meetings"
  s.required_ruby_version = ">= 2.5"

  s.name = "decidim-jitsi_meetings"
  s.summary = "A decidim jitsi_meetings module"
  s.description = "Jitsi Meetings integration.."

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::JitsiMeetings.version
end
