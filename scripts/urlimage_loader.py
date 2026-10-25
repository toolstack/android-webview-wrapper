import sys
from urlimage import get_image_for_url

print(get_image_for_url("https://" + sys.argv[1]))
