class Repo < ApplicationRecord
  
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

end
