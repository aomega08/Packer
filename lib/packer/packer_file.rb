module Packer
  class PackerFile
    def initialize(file)
      @content = File.read(file)
      @packs = []
    end

    def parse
      eval(@content)
    end

    def pack(pack_name, version = nil)
      @packs << Pack.new(pack_name, version)
    end

    def install
      @packs.each do |pack|
        if pack.installed?
          puts "Using #{pack.name} (#{pack.version})"
        else
          puts "Installing #{pack.name} (#{pack.version})"
          pack.install
        end
      end
    end

    def includes
      @packs.map do |pack|
        "-I #{pack.include_dir}"
      end.join(' ')
    end

    def libraries
      @packs.map do |pack|
        "-L #{pack.lib_dir}"
      end.join(' ')
    end
  end
end
