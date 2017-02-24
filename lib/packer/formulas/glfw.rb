module Packer
  module Formulas
    class Glfw < Recipe
      self.repo = 'https://github.com/glfw/glfw'
      self.version = '3.2.1'
      self.branch = version

      def run
        dir = clone(Glfw.repo, Glfw.branch)
        Dir.chdir(dir)

        `cmake -DCMAKE_INSTALL_PREFIX=/usr/local/packer/glfw/#{Glfw.version} .`
        `make -j#{nproc}`
        `make install`
      end
    end
  end
end
