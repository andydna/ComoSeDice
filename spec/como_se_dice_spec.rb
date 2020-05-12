ENV["TRANSLATE_CREDENTIALS"] = File.expand_path("spec/credentials.json")
ENV["TRANSLATE_PROJECT"]     = "gemdev"

RSpec.describe ComoSeDice, :vcr do
  let(:como) { ComoSeDice }

  context "to english" do
    it "rubí   => ruby" do
      expect(como << "rubí").to match /Ruby/i
    end

    it "ルビー => ruby" do
      expect(como << "ルビー").to match /Ruby/i
    end

    it "Рубин  => ruby" do
      expect(como << "Рубин").to match /Ruby/i
    end
  end

  context "from english" do
    it "ruby => rubí" do
      expect(como.to_spanish "ruby").to match /rubí/i
    end

    it "ruby => ルビー" do
      expect(como.to_japanese "ruby").to match /ルビー/i
    end

    it "ruby => Рубин" do
      expect(como.to_russian "ruby").to match /Рубин/i
    end
  end

end
