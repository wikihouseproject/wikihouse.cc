License = Struct.new(:id, :name, :url) do
  class_attribute :all, :by_id

  self.all = [
    new("mpl-2.0", "Mozilla Public Licence (MPL) version 2.0", "https://www.mozilla.org/en-US/MPL/2.0/"),
    new("cc-by-sa-3.0", "Creative Commons Attribution Sharealike 3.0 Unported License", "https://creativecommons.org/licenses/by-sa/3.0/")
  ]

  self.by_id = all.map { |l| [l.id, l] }.to_h

  def self.find(id)
    by_id.fetch id
  end
end
