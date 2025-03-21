import sys, json
tenant = sys.argv[1]
environment = sys.argv[2]
database = sys.argv[3] if len(sys.argv) > 3 else 'mysql'
atm_config = json.loads(sys.stdin.read())
print('{}\nHostname: {}\nUsername: {}\nDatabase: {}\nPassword: {}'.format(
	' '.join(sys.argv[1:]),
	atm_config["databases"][database]["hostname"],
	atm_config["databases"][database]["username"],
	atm_config["databases"][database]["name"],
	atm_config["databases"][database]["password"]
))