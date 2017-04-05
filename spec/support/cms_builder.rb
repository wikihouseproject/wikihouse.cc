class CMSBuilder
  def build
    create_home_page
    create_partners_page
    create_pilots_page
    create_team_page
    create_community_page
    create_library
  end

  def create_home_page
    page = create_node(HomePage)
    create_node(Slider, image_id: image.id, parent: page)
    create_node(PressArticle, image_id: image.id, link: "http://example.com/", parent: page)
  end

  def create_partners_page
    page = create_node(PartnersPage, pricing_table: "...")
    create_node(Partner, image_id: image.id, parent: page)
    create_node(Tile, parent: page, link_text: "Click me", link_url: "#")
  end

  def create_pilots_page
    page = create_node(PilotsPage, title: "Propose a pilot")
    create_node(Slider, image_id: image.id, parent: page)
  end

  def create_team_page
    page = create_node(TeamPage, title: "About WikiHouse Foundation")
    create_node(TeamMember, photo_id: image.id, role: "Boss", parent: page)
  end

  def create_community_page
    page = create_node(
      CommunityPage,
      blog_post: {
        title:    "New year, new website",
        url:      "https://medium.com/@WikiHouse/new-year-new-website-bcb1dd233bbe",
        image_id: image.id
      }
    )
    create_node(Challenge, parent: page, description: "...")
    create_node(Tile, parent: page, link_text: "Click me", link_url: "#")
  end

  def create_library
    page = create_node(Library)
    create_types_library(page)
    create_technologies_library(page)
  end

  def create_types_library(library)
    page = create_node(
      LibraryCategory,
      parent:      library,
      title:       "Types",
      description: "...",
      image_id:    image.id,
    )

    create_node(
      LibraryItem,
      parent:     page,
      title:      "Microhouse",
      image_id:   image.id,
      license_id: "mpl-2.0",
    )
  end

  def create_technologies_library(library)
    technologies = create_node(
      LibraryTechnologiesCategory,
      parent:      library,
      title:       "Technologies",
      description: "...",
      image_id:    image.id,
    )

    structure = create_node(
      LibraryTechnologiesSubcategory,
      parent:      technologies,
      title:       "Structure",
      image_id:    image.id,
      color:       "#000",
    )

    create_node(
      LibraryItem,
      parent:     structure,
      title:      "Wren",
      image_id:   image.id,
      license_id: "mpl-2.0",
    )
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

  def image
    @image ||= PushType::Asset.create!(
      file: "image.jpg",
    )
  end
end
