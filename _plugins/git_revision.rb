# _plugins/git_revision.rb
module Jekyll
  class GitRevisionGenerator < Generator
    safe true
    priority :high

    def generate(site)
      # Get the latest git commit hash
      git_rev = `git rev-parse --short HEAD`.strip
      site.config['git_revision'] = git_rev
    end
  end
end
