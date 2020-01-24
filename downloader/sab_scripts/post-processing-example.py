import os

print 'SABnzbd version: ', os.environ['SAB_VERSION']
print 'Job location: ', os.environ['SAB_COMPLETE_DIR']
print 'Fail msg: ', os.environ['SAB_FAIL_MSG']

# Your code

# Success code
sys.exit(0)