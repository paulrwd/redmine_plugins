Redmine::Plugin.register :jump_issues_jumpbox do
  name 'Jump Issues Jumpbox plugin'
  author 'Pavel Mitkalev'
  description 'This is a plugin for jump to issues from jumpbox for Redmine'
  version '0.0.1'
  url 'http://r77.su'
  author_url 'http://r77.su'
end

require_relative 'lib/jump_to_issues_jumpbox'

#comm
