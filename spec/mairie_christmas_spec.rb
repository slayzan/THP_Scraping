require_relative "../lib/mairie_christmas"

describe "mairie_christmas fonction" do
        it "Mairie should display an array whitout nil" do
                expect(mairie_christmas.is_a? Array).to eq true
                expect(mairie_christmas.all? { |elem| elem.class == Hash}).to be true
        end
        it "Mairie has a least few city" do 
                expect((mairie_christmas[0]).key?("ABLEIGES")).to eq true
                expect((mairie_christmas[1]).key?("AINCOURT")).to eq true
        end
end