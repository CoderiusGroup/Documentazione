#import "/src/RTB/Documenti/Interni/definizioni.typ": terms

#let keys = terms.keys().sorted(key: k => -k.len())
#let pattern = "(?i)\b(" + keys.join("|") + ")\b"
#show regex(pattern): it => {
  let term-id = "term-" + lower(it.text.replace(" ", "-"))
  let url = "https://coderiusgroup.github.io/Documentazione/glossario.html" + term-id
  it + link(url)[#underline(sub[G])]
}

