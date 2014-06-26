require './lib/word_cloud'

describe WordCloud do

  it 'can organize words' do
    input = {
      "Ila Huels" => [
        "OPTIMIZE WEB-ENABLED SUPPLY-CHAINS",
        "OPTIMizE ENVISIONEER ROBUST E-COMMERCE",
      ]
    }

    word_cloud = WordCloud.new(input)
    expect(word_cloud.parse).to eq(
                                  {
                                    "optimize" => {
                                      :count => 2,
                                      :people => ["Ila Huels"]
                                    },
                                    "web-enabled" => {
                                      :count => 1,
                                      :people => ["Ila Huels"]
                                    },
                                    "supply-chains" => {
                                      :count => 1,
                                      :people => ["Ila Huels"]
                                    },
                                    "envisioneer" => {
                                      :count => 1,
                                      :people => ["Ila Huels"]
                                    },
                                    "robust" => {
                                      :count => 1,
                                      :people => ["Ila Huels"]
                                    },
                                    "e-commerce" => {
                                      :count => 1,
                                      :people => ["Ila Huels"]
                                    }
                                  }
                                )

  end

  it 'can organize words from more than two speakers' do
    input = {
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

    word_cloud = WordCloud.new(input)
    expect(word_cloud.parse).to eq(
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