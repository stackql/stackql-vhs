Output pystackql.gif
# Set Theme "Borland"
# Set Theme "Purple Rain"

Set FontSize 15
Set Height 600
Set Width 1200

Hide
Type@5ms 'mkdir /root/.local && clear'
Enter

Type@5ms 'cp /stackql/stackql /root/.local/ && clear'
Enter

Type@5ms 'chmod 755 /root/.local/stackql && clear'
Enter
Show

Type 'pip3 install -q pystackql'
Enter
Sleep 2s
Enter

Type 'python3'
Enter
Sleep 1s

Type 'import pandas as pd'
Enter
Sleep 1s
Enter

Type 'from pystackql import StackQL'
Enter
Sleep 1s
Enter

Type 'provider_auth = { "aws": { "credentialsenvvar": "AWS_SECRET_ACCESS_KEY", "keyIDenvvar": "AWS_ACCESS_KEY_ID", "type": "aws_signing_v4" }}'
Enter
Sleep 1s

Type 'regions = ["ap-southeast-2", "us-east-1"]'
Enter
Sleep 1s
Enter

Type 'stackql = StackQL(auth=provider_auth)'
Enter
Sleep 1s
Enter

Type 'query = """'
Enter
Type "SELECT '%s' as region, instanceType, COUNT(*) as num_instances"
Enter
Type "FROM aws.ec2.instances"
Enter
Type "WHERE region = '%s'"
Enter
Type "GROUP BY instanceType"
Enter
Type "UNION"
Enter
Type "SELECT  '%s' as region, instanceType, COUNT(*) as num_instances"
Enter
Type "FROM aws.ec2.instances"
Enter
Type "WHERE region = '%s'"
Enter
Type "GROUP BY instanceType"
Enter
Type '""" % (regions[0], regions[0], regions[1], regions[1])'
Enter
Sleep 1s
Enter

Type 'res = stackql.execute(query)'
Enter
Sleep 3s
Enter

Type 'df = pd.read_json(res)'
Enter
Sleep 1s
Enter

Type 'print(df)'
Enter
Sleep 10s