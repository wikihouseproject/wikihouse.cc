class Repo < ApplicationRecord

  def self.total_watchers
    self.all.map{|r| r.data['info']['watchers_count'] }.sum
  end

  def self.total_filecount
    self.all.map{|r| r.data['filecount'] }.sum
  end
  
  def url
    "https://github.com/#{owner}/#{name}"
  end

  def fork_url
    "#{url}/network"
  end

  def issues_url
    "#{url}/issues"
  end

  def archive_url
    "#{url}/archive/master.zip"
  end

  def license_text
    if name == 'Wren'
      '<a href="https://www.mozilla.org/en-US/MPL/2.0/" target="_blank">Mozilla Public Licence (MPL) version 2.0</a>'
    else
      '<a href="https://creativecommons.org/licenses/by-sa/3.0/" target="_blank">Creative Commons Attribution Sharealike 3.0 Unported License</a>'
    end
  end

  # def updated_at
  #   data[:files].sort_by{|f| f[:updated_at] }.first
  # end

end
