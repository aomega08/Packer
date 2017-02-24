require 'packer/pack'
require 'packer/packer_file'
require 'packer/recipe'

require 'packer/formulas'

module Packer
  def self.run
    command = ARGV[0]

    case command
    when 'install', nil
      packerfile = load_packerfile
      packerfile.install
    when 'uninstall'
      pack_name = ARGV[1]
      version = ARGV[2]

      pack = Pack.new(pack_name, version)
      pack.uninstall
    when 'includes'
      packerfile = load_packerfile
      puts packerfile.includes
    when 'libraries'
      packerfile = load_packerfile
      puts packerfile.libraries
    else
      puts "Unknown command \"#{command}\""
    end
  end

  def self.load_packerfile
    packer_file = PackerFile.new('Packerfile')
    packer_file.parse
    packer_file
  end
end
