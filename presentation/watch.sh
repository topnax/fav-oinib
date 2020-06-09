while inotifywait kral_presentation.tex; do echo changed; rubber --pdf kral_presentation.tex; done
