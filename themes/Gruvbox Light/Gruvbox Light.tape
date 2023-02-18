Output "themes/Gruvbox Light/Gruvbox Light.gif"
Set Theme "Gruvbox Light"

Set FontSize 15
Set Height 600
Set Width 1200
# Set TypingSpeed 100ms
# Set PlaybackSpeed 0.25
# Set Framerate 30

# set up auth
Hide
Type "export OKTA_SECRET_KEY=00mByTpqzz_uFAKCA8pjhI8NtK05LXozQg98Fpu2Ls && clear"
Enter
Type "AUTH=$(python3 /stackql/.auth/setauth.py) && clear"
Enter
Show

# launch shell
Type@5ms 'stackql --colorscheme=null --auth="${AUTH}" shell'
Enter
Sleep 1s

# run a select
Type "SELECT status, COUNT(*) as num_instances FROM google.compute.instances"
Enter
Type "WHERE project = 'stackql-demo' AND zone = 'australia-southeast1-a'"
Enter
Type "GROUP BY status;"
Enter
Sleep 4s

# run another select
Type "SELECT id, label, signOnMode FROM okta.application.apps"
Enter
Type "WHERE subdomain = 'dev-72290228';"
Enter
Sleep 4s

# run a join
Type@20ms "select b.name, a.status, a.signOnMode"
Enter
Type@20ms "from google.storage.buckets b"
Enter
Type@20ms "inner join" 
Enter
Type@20ms "okta.application.apps a"
Enter
Type@20ms "on json_extract(b.labels, '$.app') = a.label"
Enter
Type@20ms "where b.project = 'stackql-demo' and a.subdomain = 'dev-72290228';"
Enter
Sleep 10s