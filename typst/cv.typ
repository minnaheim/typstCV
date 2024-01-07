#let configuration = yaml("configuration.yml")
#let settings = yaml("settings.yml")

#set page(
  margin: 20mm,
)

#set par(
  leading: eval(settings.paragraph.leading),
)

#set text(
  size: eval(settings.font.size.body),
  font: "Charter",
)

#let sidebarSection = {[

  /* Headshot */
  #par[
    #figure(
      image("images/headshot.jpg"),
      placement: top,
    )
  ]

  #par(justify: true)[

    #par[
      #set text(
        size: eval(settings.font.size.sidebar),
      )
      Born and raised in Vienna, currently living in Zürich.

      In my free time I like to code, tinker with electronics, design and make furniture, and generally I enjoy all types of DIY/maker projects. I am also interested in (FPV) Drones, IoT Prototyping, CAD/CAM, 3D Printing, Cycling, Tennis and of course all things computer science.

      *Email:* #link("mailto:contact@benarmstro.ng") \
      *Phone:* #link("tel:+41784215042") \
      *LinkedIn:* #link("www.linkedin.com/in/benedictarmstrong")[benedictarmstrong] \
      *GitHub:* #link("https://github.com/benedict-armstrong")[benedict-armstrong] \
    ]
  ]
]}

#let mainSection = {[

  #upper[
    #set text(
      font: "Helvetica Neue"
    )
    #[
      #set text(
      size: 18pt,
    )
      *Benedict Armstrong*
    ]
    #[
      #set text(
      size: 10pt,
    )
      #link("mailto:contact@benarmstro.ng")[contact\@benarmstro.ng] #h(1fr)
      // #link("https://benarmstro.ng")[benarmstro.ng]
    ]
  ]
  

  = Education

  #{
    for place in configuration.education [
      - #[
        #[
        #set text(
          size: eval(settings.font.size.body),
        )
        #link(place.university.link)[*#place.university.name*]
        ] \
        #place.degree #place.major \
        #place.from — #place.to \
      ]
    ]
  }

  = Experience

  #{
    for job in configuration.jobs [
      - #[
        #set text(
          size: 11pt,
        )
        *#job.position*,
        #link(job.company.link)[#job.company.name] \
        #job.from #if job.to != "_" [— #job.to] \
        #par[  
          #set text(
            size: eval(settings.font.size.body),
          )
          #job.description
        ]
        // #{
        //   set text(
        //     size: eval(settings.font.size.tags),
        //   )
        //   let tag_line = job.tags.join(" • ")
        //   tag_line
        // }
      ]
    ]
  }

  = Languages and Technologies
  #{

    let languages = configuration.skills.languages.join(", ")
    let technologies = configuration.skills.technologies.join(", ")
    [
    - #languages
    - #technologies
    ]
  }
]}

#{
  grid(
    columns: (1.618fr, 1fr),
    column-gutter: 1em,
    mainSection,
    sidebarSection,
  )
}