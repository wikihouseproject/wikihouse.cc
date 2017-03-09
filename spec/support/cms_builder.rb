class CMSBuilder
  def build
    create_home_page
    create_partners_page
    create_pilots_page
    create_team_page
    create_community_page
  end

  def create_home_page
    page = create_node(HomePage)
    create_node(Slider, image_id: create_image.id, parent: page)
    create_node(PressArticle, image_id: create_image.id, link: "http://example.com/", parent: page)
    page
  end

  def create_partners_page
    page = create_node(PartnersPage)
    create_node(Partner, image_id: create_image.id, parent: page)
    page
  end

  def create_pilots_page
    page = create_node(PilotsPage, title: "Propose a pilot")
    create_node(Slider, image_id: create_image.id, parent: page)
    page
  end

  def create_team_page
    page = create_node(TeamPage, title: "About WikiHouse Foundation")
    create_node(TeamMember, photo_id: create_image.id, role: "Boss", parent: page)
    page
  end

  def create_community_page
    page = create_node(
      CommunityPage,
      blog_post: {
        title:    "New year, new website",
        url:      "https://medium.com/@WikiHouse/new-year-new-website-bcb1dd233bbe",
        image_id: create_image.id
      }
    )
    create_node(Challenge, parent: page, description: "...")
    page
  end

  private

  def create_node(type, title: type.name.sub(/Page$/, ""), **attributes)
    type.create!(
      title:  title,
      slug:   title.downcase.gsub(/\W/, "-"),
      status: type.statuses[:published],
      **attributes
    )
  end

  def create_image
    PushType::Asset.create!(
      file: "image.jpg",
    )
  end
end
