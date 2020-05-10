ENV["TRANSLATE_CREDENTIALS"] = File.expand_path("spec/credentials.json")
ENV["TRANSLATE_PROJECT"]     = "gemdev"

RSpec.describe AndyDNA::Google::Translate do

  context "to english" do
    it "ルビー => ruby" do
      expect(GoogleTranslate << "ルビー").to match /Ruby/i
    end

    it "Рубин  => ruby" do
      expect(GoogleTranslate << "Рубин").to match /Ruby/i
    end

    it "rubí   => ruby" do
      expect(GoogleTranslate << "rubí").to match /Ruby/i
    end
  end

  context "from english" do
    it "ruby => rubí" do
      expect(GoogleTranslate.new.to_spanish "ruby").to match /rubí/i
    end

    it "ruby => ルビー" do
      expect(GoogleTranslate.new.to_japanese "ruby").to match /ルビー/i
    end

    it "ruby => Рубин" do
      expect(GoogleTranslate.new.to_russian "ruby").to match /Рубин/i
    end
  end

end
