module Packer
  module Formulas
    class Glew < Recipe
      self.repo = 'https://github.com/nigels-com/glew.git'
      self.version = '2.0.0'
      self.branch = "glew-#{version}"

      def run
        dir = clone(Glew.repo, Glew.branch)
        Dir.chdir(dir)

        `make extensions`

        fixconf

        `make -j#{nproc}`
        `make install`
      end

      def fixconf
        `sed -i -e "s#/usr/local#/usr/local/packer/glew/#{Glew.version}#" config/Makefile.darwin`
      end
    end
  end
end
