Output tapes/pystackql/pystackql.gif

Set WindowBar Colorful
Set FontSize 20
Set Height 675
Set Width 1200

Set Margin 20
Set MarginFill "#674EFF"
Set BorderRadius 10
Set TypingSpeed 0.1
Set CursorBlink false

Hide
Type "python" Enter
Sleep 3s
Show

Type "import pandas as pd" Enter
Sleep 2s

Type "from pystackql import StackQL" Enter
Sleep 3s

Type "stackql = StackQL(output='pandas')" Enter
Sleep 2s

Type "regions = ['ap-southeast-1', 'us-east-2']" Enter
Sleep 1s

Type `region_list = ', '.join([f"'{region}'" for region in regions])` Enter
Sleep 2s

Type 'query = f"""' Enter
Type "SELECT region, function_name, COUNT(*) as num_functions" Enter
Type "FROM aws.lambda.functions" Enter
Type "WHERE region IN ({region_list})" Enter
Type 'GROUP BY region, function_name"""' Enter
Sleep 2s

Type 'df = stackql.execute(query)' Enter
Sleep 3s

Type 'print(df)' Enter
Sleep 10s