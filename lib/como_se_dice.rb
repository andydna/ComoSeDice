require 'google/cloud/translate'

module ComoSeDice
  class Error < StandardError; end

  def ComoSeDice.<<(text)
    raise(Error, "ENV?") unless env?
    Translation.new.to_english(text)
  end

  def ComoSeDice.env?
    ENV["TRANSLATE_CREDENTIALS"] and ENV["TRANSLATE_PROJECT"]
  end

  def ComoSeDice.method_missing(mthd, *args, &block)
    Translation.new.send(mthd, *args, &block)
  end

  class Translation
    {to_english: 'en', to_spanish: 'es', to_japanese: 'ja', to_russian: 'ru'}.each do |mthd, bcp47|
      define_method(mthd) do |text|
        @text = text
        @language = bcp47
        translations.first.translated_text
      end
    end

    private

    def translations
      response.translations
    end

    def response
      client.translate_text([@text], @language, location_path)
    end

    def client
      @client ||= ::Google::Cloud.translate
    end

    def location_path
      @location_path ||= client.class.location_path(project, location)
    end

    def project
      ENV["TRANSLATE_PROJECT"]
    end

    def location
      'us-central1'
    end
  end
end
