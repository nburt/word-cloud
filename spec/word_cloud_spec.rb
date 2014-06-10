require './lib/word_cloud'

describe WordCloud do

  it 'should be able to transform a hash into a usable hash' do

    data = {
      "Nate Burt" => [
        "teamwork optimization risk",
        "TEAMWORK OPTIMIZATION",
        "Branding"
      ]
    }

    word_cloud = WordCloud.new(data)

    expect(word_cloud.organize).to eq({
                                        "teamwork" => {count: 2, people: ["Nate Burt"]},
                                        "optimization" => {count: 2, people: ["Nate Burt"]},
                                        "risk" => {count: 1, people: ["Nate Burt"]},
                                        "branding" => {count: 1, people: ["Nate Burt"]},
                                      })

  end

  it 'should be able to handle multiple people' do
    data = {
      "Ila Huels" => [
        "OPTIMIZE WEB-ENABLED SUPPLY-CHAINS",
        "brand sexy channels",
        "ENVISIONEER ROBUST E-COMMERCE",
        "TRANSFORM WIRELESS ARCHITECTURES",
        "BENCHMARK CROSS-PLATFORM PARTNERSHIPS"
      ],
      "Cristopher Feest" => [
        "BENCHMARK CROSS-PLATFORM PARTNERSHIPS",
        "brand sexy channels",
        "BENCHMARK 24/7 PARADIGMS"
      ]
    }

    word_cloud = WordCloud.new(data)

    expect(word_cloud.organize).to eq(
                                     {
                                       "optimize" => {:count => 1, :people => ["Ila Huels"]},
                                       "web-enabled" => {:count => 1, :people => ["Ila Huels"]},
                                       "supply-chains" => {:count => 1, :people => ["Ila Huels"]},
                                       "brand" => {:count => 2, :people => ["Ila Huels", "Cristopher Feest"]},
                                       "sexy" => {:count => 2, :people => ["Ila Huels", "Cristopher Feest"]},
                                       "channels" => {:count => 2, :people => ["Ila Huels", "Cristopher Feest"]},
                                       "envisioneer" => {:count => 1, :people => ["Ila Huels"]},
                                       "robust" => {:count => 1, :people => ["Ila Huels"]},
                                       "e-commerce" => {:count => 1, :people => ["Ila Huels"]},
                                       "transform" => {:count => 1, :people => ["Ila Huels"]},
                                       "wireless" => {:count => 1, :people => ["Ila Huels"]},
                                       "architectures" => {:count => 1, :people => ["Ila Huels"]},
                                       "benchmark" => {:count => 3, :people => ["Ila Huels", "Cristopher Feest"]},
                                       "cross-platform" => {:count => 2, :people => ["Ila Huels", "Cristopher Feest"]},
                                       "partnerships" => {:count => 2, :people => ["Ila Huels", "Cristopher Feest"]},
                                       "24/7" => {:count => 1, :people => ["Cristopher Feest"]},
                                       "paradigms" => {:count => 1, :people => ["Cristopher Feest"]}
                                     }
                                   )
  end

end