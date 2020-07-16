require_relative "../lib/dark_trader"

describe "Crypto fonction" do
    it "Crypto should display an array without nil." do
        expect(crypto.is_a? Array).to eq true
        expect(crypto.all? { |elem| elem.class == Hash}).to be true
        expect((crypto)).not_to eq nil
    end
    it "Crypto must have string keys Bitcoin and Ethereum." do 
        
        expect((crypto[0]).key?("Bitcoin")).to eq true
        expect((crypto[1]).key?("Ethereum")).to eq true
    end
    it "Crypto must have 200 elements." do
        expect(crypto.count).to eq(200)
    end
end