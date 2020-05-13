ENV["TRANSLATE_CREDENTIALS"] = File.expand_path("spec/credentials.json")
ENV["TRANSLATE_PROJECT"]     = "gemdev"
binding.pry

RSpec.describe ComoSeDice, :vcr do
  let(:como) { ComoSeDice }

  context 'ComoSeDice << "hola" #=> "hello"' do

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
        expect(como.to_spanish "ruby").to match /rubí/
      end

      it "ruby => ルビー" do
        expect(como.to_japanese "ruby").to match /ルビー/
      end

      it "ruby => Рубин" do
        expect(como.to_russian "ruby").to match /Рубин/
      end
    end
  end

  context "what should happen if ENV not set?" do
    it "raises an error" do
      stub_const('ENV', Hash.new)
      expect{como << "oops"}.to raise_error(ComoSeDice::Error)
    end
  end

end
