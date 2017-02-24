module Packer
  module Formulas
    class Soil < Recipe
      self.repo = 'https://github.com/kbranigan/Simple-OpenGL-Image-Library'
      self.version = '0.0.0'

      def run
        dir = clone(Soil.repo)
        Dir.chdir(dir)

        FileUtils.mkdir_p('/usr/local/packer/soil/0.0.0/include')
        FileUtils.mkdir_p('/usr/local/packer/soil/0.0.0/lib')

        fixconf
        `make -j#{nproc}`
        `make install`
      end

      def fixconf
        `sed -i -e "s#/usr/local#/usr/local/packer/soil/0.0.0#" Makefile`
      end
    end
  end
end
