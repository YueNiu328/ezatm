import sys, json
tenant = sys.argv[1]
environment = sys.argv[2]
atm_config = json.loads(sys.stdin.read())
if 'flatfileintegration' in atm_config['aws']:
	print('{} {}\nBucket Name: {}\nUUID: {}\nAccess Key: {}\nSecret Access Key: {}'.format(
		tenant,
		environment,
		atm_config['aws']['flatfileintegration']['BucketName'],
		atm_config['aws']['flatfileintegration']['OrganizationUuid'],
		atm_config['aws']['flatfileintegration']['TenantAccessKeyId'],
		atm_config['aws']['flatfileintegration']['TenantSecretAccessKey']
	))
else:
	print('{} does not have a {} flat file bucket!'.format(tenant, environment))