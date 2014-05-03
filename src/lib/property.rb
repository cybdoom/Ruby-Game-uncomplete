def property name
  name = name.to_s
  meta_string = ''

  meta_string += %Q{
    def #{ name }
      @#{ name }
    end
  }

  meta_string += %Q{
    def #{ name }= value
      @#{ name } = value
    end
  }

  self.class_eval meta_string
end
