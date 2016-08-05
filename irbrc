# Invoke the prompt below with:
#   irb --prompt my-prompt
IRB.conf[:PROMPT][:MY_PROMPT] = { # name of prompt mode
  :AUTO_INDENT => true,           # enables auto-indent mode
  :PROMPT_I =>  'irb » ',         # simple prompt
  :PROMPT_S => '...',             # prompt for continuated strings
  :PROMPT_C => '››',              # prompt for continuated statement
  :RETURN => "→ %s\n"             # format to return value
}

#IRB.conf[:PROMPT_MODE] = :MY_PROMPT

