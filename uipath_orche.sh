TOKEN=`curl -k --location --request POST "https://rpa.lgcns.com/api/Account/authenticate" \
  --header "Content-Type: application/json" \
  --data "{
	'tenancyName': 'LGChem',
	'usernameOrEmailAddress': 'admin',
	'password': 'lgchem2019!'
}" | jq .result  | tr -d "\"" `

# echo $TOKEN
# start_job ()
# {
# curl -k --request POST 'https://rpa.lgcns.com/odata/Jobs/UiPath.Server.Configuration.OData.StartJobs' \
# 	--header "Authorization: Bearer ${TOKEN}" \
# 	--header "Content-Type: application/json" \
# 	--data "{'startInfo': {
# 		'ReleaseKey': '5b310e23-64a6-4bbb-b9ea-e5d960892d12',
# 		'Strategy' : 'Specific',
# 		'RobotIds': [ 10237 ],
# 		'Source': 'Manual' ,
# 		'InputArguments' : '{\"Targ1\": \"aaa\"}'
# 						}
# 		}"
# }


curl -k --request GET 'https://rpa.lgcns.com/odata/Releases' \
	--header "Authorization: Bearer ${TOKEN}" \
	--header "Content-Type: application/json" 

# 3a2d97df-4cdc-4f1b-9516-8c6fa209273a -> Dump Thomson

# curl -k --request GET 'https://rpa.lgcns.com/odata/Robots(10237)' \
# 	--header "Authorization: Bearer ${TOKEN}" \
# 	--header "Content-Type: application/json" \


# {
#   "startInfo": {
#     "ReleaseKey": "9e16e6a6-f99a-4d2d-b454-93ae02a69ebc",
#     "RobotIds": [
#       36, 130
#     ],
#     "NoOfRobots": 0,
#     "Strategy": "Specific"
#   }
# }

#         {
#             "Key": "3a2d97df-4cdc-4f1b-9516-8c6fa209273a",
#             "ProcessKey": "Dump_Thomson",
#             "ProcessVersion": "1.0.190920.2",
#             "IsLatestVersion": false,
#             "IsProcessDeleted": false,
#             "Description": "Pre_Thomson And Platts",
#             "Name": "Dump_Thomson_colin.robot",
#             "EnvironmentId": 185,
#             "EnvironmentName": "colin.robot",
#             "InputArguments": null,
#             "Id": 669,
#             "Arguments": {
#                 "Input": "[{\"name\":\"in_Config\",\"type\":\"System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[System.Object, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089\",\"required\":false,\"hasDefault\":false}]",
#                 "Output": null
#             }
#         },


#         {
#             "LicenseKey": null,
#             "MachineName": "D1906LN0006",
#             "MachineId": 10228,
#             "Name": "colin.robot",
#             "Username": "LGChem\\colin.robot",
#             "Description": "colin PC",
#             "Version": "19.4.3.0",
#             "Type": "Unattended",
#             "HostingType": "Standard",
#             "Password": null,
#             "CredentialType": null,
#             "RobotEnvironments": "colin.robot,P1909LN0030",
#             "Id": 10237,
#             "ExecutionSettings": null
#         },