require "rake"

describe "rake task: parse:links" do
  before do
    load "lib/tasks/fill_db.rake"

    Link.delete_all
  end

  it "parses links, creates records and saves data to CSV" do
    Rake::Task["parse:links"].invoke

    expect(Link.count).to be > 0

    csv_data = CSV.read("myfile.csv")

    expect(csv_data.size).to be > 1 # Expect header row + data rows
    expect(csv_data.first).to eq(["ID", "Name", "Image Src", "Text Content"])
  end
end
