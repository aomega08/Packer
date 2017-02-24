require 'fileutils'

module Packer
  class Pack
    attr_accessor :name, :version

    def initialize(name, version)
      @name = name
      @version = version
    end

    def install_location
      "/usr/local/packer/#{name}/#{version}"
    end

    def global_install_location
      "/usr/local/packer/#{name}"
    end

    def installed?
      Dir.exists?(install_location)
    end

    def any_installed?
      Dir.exists?(global_install_location)
    end

    def install
      if !version
        puts "Please specify the pack version for #{name}"
      else
        formula_class.new(version).run
      end
    end

    def uninstall
      if any_installed?
        if version
          if installed?
            FileUtils.rm_rf(install_location)
          else
            puts "Pack #{name} at version #{version} is not installed"
          end
        else
          FileUtils.rm_rf(global_install_location)
        end
      else
        puts "Pack #{name} has not been installed"
      end
    end

    def formula_class
      class_name = name.split('_').collect(&:capitalize).join
      Packer::Formulas.const_get(class_name)
    end

    def include_dir
      "/usr/local/packer/#{name}/#{version}/include"
    end

    def lib_dir
      "/usr/local/packer/#{name}/#{version}/lib"
    end
  end
end
