Output stackql.gif
Set Theme "Builtin Tango Light"

Set FontSize 15
Set Height 600
Set Width 1200
# Set TypingSpeed 100ms
# Set PlaybackSpeed 0.25
# Set Framerate 30

# set up auth
Hide
Type "AUTH=$(python3 /stackql/.auth/setauth.py) && clear"
Enter
Show

# launch shell
Type@5ms 'stackql --colorscheme=null --auth="${AUTH}" shell'
Enter
Sleep 1s

# show providers
Type "show providers;"
Enter
Sleep 1s

# describe resource
Type "describe google.compute.instances;"
Enter
Sleep 3s

# create a resource
Type "insert into google.compute.disks(project, zone, data__name)"
Enter 
Type "SELECT 'stackql-demo', 'australia-southeast1-a', name || '-' || strftime('%s', datetime('now')) as name" 
Enter
Type "from google.compute.disks where project = 'stackql-demo' and zone =  'australia-southeast1-a' limit 2;"
Enter
Sleep 5s

# run a select
Type "SELECT name, status FROM google.compute.instances WHERE project = 'stackql-demo' AND zone = 'australia-southeast1-a';"
Enter
Sleep 4s

# run another select
Type "SELECT status, COUNT(*) as num_instances FROM google.compute.instances"
Enter
Type "WHERE project = 'stackql-demo' AND zone = 'australia-southeast1-a'"
Enter
Type "GROUP BY status;"
Enter
Sleep 4s

# stop a vm
Type "EXEC google.compute.instances.stop"
Enter
Type "@instance = 'stackql-demo-004'," 
Enter
Type "@project = 'stackql-demo'," 
Enter
Type "@zone = 'australia-southeast1-a';"
Enter
Sleep 4s

# run another select
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