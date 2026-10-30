doc := "main"
out := "build"

default: (build "industry") (build "academia")

build audience:
    latexmk -jobname={{doc}}-{{audience}} \
        -usepretex='\def\CurrentAudience{{"{"}}{{audience}}{{"}"}}' {{doc}}.tex

watch audience="industry":
    latexmk -pvc -view=none -jobname={{doc}}-{{audience}} \
        -usepretex='\def\CurrentAudience{{"{"}}{{audience}}{{"}"}}' {{doc}}.tex

open audience="industry":
    open {{out}}/{{doc}}-{{audience}}.pdf

clean:
    latexmk -C
    rm -rf {{out}}
