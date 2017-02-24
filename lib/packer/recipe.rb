require 'fileutils'
require 'os'

class Recipe
  class << self
    attr_accessor :version, :repo, :branch
  end

  def initialize(version)
    self.class.version = version
  end

  def clone(repo, branch = 'master')
    FileUtils.mkdir_p('/tmp/packer')
    Dir.chdir('/tmp/packer')

    dir = "repo-#{rand(10000000)}"

    `git clone #{repo} --depth 1 --branch #{branch} #{dir}`

    "/tmp/packer/#{dir}"
  end

  def nproc
    if OS.mac?
      `sysctl -n hw.ncpu`.to_i
    elsif OS.linux?
      `nproc`.to_i
    else
      1
    end
  end
end
