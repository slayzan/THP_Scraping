require_relative "../lib/depute"

describe "debuty fonction" do
        it "debuty should display an array whitout nil" do
                expect(debuty.is_a? Array).to eq true
                expect(debuty.all? { |elem| elem.class == Hash}).to be true
        end
        it "debuty has at least 2 debuty" do 
                expect((debuty[0]).value?("Damien")).to eq true
                expect((debuty[1]).value?("Caroline")).to eq true
        end
end