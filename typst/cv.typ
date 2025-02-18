#let configuration = yaml("configuration.yml")
#let settings = yaml("settings.yml")

#let heading_font = "Poppins"

#set page(margin: 20mm)

#show heading.where(level: 1): it => [
  #set text(size: 14pt, font: heading_font, weight: "semibold")
  #it
  #v(0.2em)
]

#set par(leading: eval(settings.paragraph.leading))

#set text(size: eval(settings.font.size.body), font: "Source Serif 4")

#let sidebarSection = {
  [

    /* Headshot */
    #par[
      #figure(image("images/minnaheim.jpg"), placement: top)
    ]

    #par(justify: true)[

      #par[
        #set text(size: eval(settings.font.size.sidebar))
        Originally from Vienna, lived in Finland, Ukraine, France, and Singapore, and
        currently living in Zürich.

        In my free time, I am part of the organizing committee of the Zurich R User
        Group. I also like to code, cycle, swim and read.

        *Email:* #link("mailto:minnaemiliahagen.heim@uzh.ch") \
        *Phone:* #link("tel:+41767604201") \
        *LinkedIn:* #link("https://www.linkedin.com/in/minna-heim-a885aa229/")[minnaheim] \
        *GitHub:* #link("https://github.com/minnaheim")[minnaheim] \
      ]
    ]
  ]
}

#let mainSection = {
  [

    #upper[
      #set text(font: heading_font)
      #[
        #set text(size: 20pt, weight: "medium")
        *Minna Emilia Hagen Heim*
      ]
      #[
        #set text(size: 10pt)
        // #link("mailto:contact@benarmstro.ng")[contact\@benarmstro.ng] #h(1fr)
        // #link("https://benarmstro.ng")[benarmstro.ng]
      ]
    ]
    = Education

    #{
      for place in configuration.education [
        - #[
            #set text(size: 11pt)
            #[
              #link(place.university.link)[*#place.university.name*]
            ] \
            #place.degree #place.major \
            #place.from — #place.to \
          ]
          #v(1em)
      ]
    }

    = Experience

    #{
      for job in configuration.jobs [
        - #[
            #set text(size: 11pt)
            *#job.position*,
            #link(job.company.link)[#job.company.name] \
            #job.from #if job.to != "_" [— #job.to] \
            #[
              #par[
                #set text(size: eval(settings.font.size.body))
                #job.description
              ]
            ]
            // #{
            //   set text(
            //     size: eval(settings.font.size.tags),
            //   )
            //   let tag_line = job.tags.join(" • ")
            //   tag_line
            // }
          ]
        #v(1em)
      ]
    }
    = Teaching Experiences

    #{
      for teaching in configuration.teaching [
        - #[
            #set text(size: 11pt)
            *#teaching.position*,
            #teaching.university.course
            #teaching.university.name \
            #teaching.from #if teaching.to != "_" [— #teaching.to] \
            #[
              #par[
                #set text(size: eval(settings.font.size.body))
                #teaching.description
              ]
            ]
          ]
          #v(1em)
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
  ]
}

#{
  grid(
    columns: (1.618fr, 1fr),
    column-gutter: 1em,
    mainSection, sidebarSection,
  )
}
