module BabelTrain
  class I18n

    include ::I18n::Backend::Base

    def initialize
      @translations = {}
      super
    end

    def available_locales
      @translations.keys
    end

    def reload!
      base = Rails.root.join('config/locales')
      base_str = "#{base.to_s}/"
      Dir[base.join('**/*.yml')].each do |file_path|
        yaml_hash = YAML.load(File.read(file_path))
        path_parts = file_path.gsub(base_str, '').split('/')
        file_parts = path_parts.pop.split('.')
        file_parts.pop # Don't need the YML part, thank you
        language = file_parts.pop.to_sym
        value_base = (path_parts + file_parts).join('.')
        @translations[language] ||= {}
        @translations[language].merge! process_hash(yaml_hash, value_base)
      end
    end

    protected

    def lookup(locale, key, scope = [], options = {})
      raise scope.inspect if scope && scope.size > 0 # Temporary testing stuff
      raise options.inspect if options && options.size > 0 # Temporary testing stuff
      @translations[locale.to_sym][key]
    end

    def process_hash(hash, base)
      base_empty = base.nil? || base == ''
      ret = {}
      hash.each do |key, value|
        full_key = base_empty ? key : "#{base}.#{key}"
        value.is_a?(Hash) ? ret.merge!(process_hash(value, full_key)) : ret[full_key] = value
      end
      ret
    end

  end
end