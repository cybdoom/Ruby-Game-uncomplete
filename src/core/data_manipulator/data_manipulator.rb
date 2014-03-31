module Core
  module DataManipulator
    DATA_DIR = File.exapnd_path("..", "data")

    def synthesize_from path
      full_path = File.join(DATA_DIR, path)
      deep_object_load path
    end

    def materialize_to path
    end

    private

    def deep_object_load path
      File.open('r', path) do |file_stream|
        xml_document = Nokogiri::XML(file_stream)
        xml_document.xpath("/Object/Data/*").each do |child|
          type = child.attribute("type")

          unless child.attribute("path").nil?
            subpath = child.attribute("path").value
            full_path = File.join(path, subpath)
            self.instance_variable_set "@#{ child.name }", eval(type).new.deep_object_load(path)
            return
          end

          if ['FalseClass', 'TrueClass'].include? type
            self.instance_variable_set "@#{ child.name }", type == 'TrueClass'
            return
          end

          if type == 'Fixnum'
            self.instance_variable_set "@#{ child.name }", child.child.to_i
            return
          end

          if type == 'Hash'
            hash = {}
            child.children.each { |node|

          end
        end
      end
    end
  end
end
