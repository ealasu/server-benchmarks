#!/usr/bin/env python3

import os
from time import time
import resource

BLOB_SIZE = 100 # in MB
MAX_BLOBS = 100


def run_test():
  # write a 100MB file
  with open('blob', 'wb') as f:
    chunk = os.urandom(1024)
    for _ in range(BLOB_SIZE * 1024):
      f.write(chunk)

  blobs = []
  start_time = time()
  for i in range(MAX_BLOBS):
    elapsed = time() - start_time
    rss = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
    print('blobs: {}, elapsed seconds: {}, maxrss: {}'.format(
      len(blobs), len(blobs) * BLOB_SIZE, elapsed, rss))
    with open('blob', 'rb') as f:
      blobs.append(f.read())

if __name__ == '__main__':
  run_test()

