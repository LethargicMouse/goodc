run *goodc-args:
  @mkdir -p .build
  @cat src/* > .build/combined.good
  @echo "> running goodc"
  @goodc run .build/combined.good {{goodc-args}}
  @qbe -o .build/out2.s .build/out.ssa
  @cc -o .build/out2 .build/out2.s -g
  @echo "> running out"
  @./.build/out2
