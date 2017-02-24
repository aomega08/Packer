module Packer
  module Formulas
    class Glm < Recipe
      self.repo = 'https://github.com/g-truc/glm'
      self.version = '0.9.8'
      self.branch = version

      def run
        dir = clone(Glm.repo, Glm.branch)
        Dir.chdir(dir)

        `cmake -DCMAKE_INSTALL_PREFIX=/usr/local/packer/glm/#{Glm.version} .`
        `make -j#{nproc}`
        `make install`
      end
    end
  end
end
