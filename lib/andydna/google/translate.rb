require 'google/cloud/translate'

module AndyDNA
module Google

class Translate
  def self.<<(text)
    new.to_english(text)
  end

  def to_english(text)
    @text = text
    @language = 'en'
    translations.first.translated_text
  end

  def to_spanish(text)
    @text = text
    @language = 'es'
    translations.first.translated_text
  end

  def to_japanese(text)
    @text = text
    @language = 'ja'
    translations.first.translated_text
  end

  def to_russian(text)
    @text = text
    @language = 'ru'
    translations.first.translated_text
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
end

GoogleTranslate = AndyDNA::Google::Translate
