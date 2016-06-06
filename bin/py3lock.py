#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
# vim:ts=2:sw=2:expandtab

import os, sys
import xcffib as xcb
from xcffib.xproto import *
from PIL import Image

XCB_MAP_STATE_VIEWABLE = 2

def screenshot():
  os.system('import -window root /tmp/.i3lock.png')

def xcb_fetch_windows():
  """ Returns an array of rects of currently visible windows. """

  x = xcb.connect()
  root = x.get_setup().roots[0].root

  rects = []

  # iterate through top-level windows
  for child in x.core.QueryTree(root).reply().children:
    # make sure we only consider windows that are actually visible
    attributes = x.core.GetWindowAttributes(child).reply()
    if attributes.map_state != XCB_MAP_STATE_VIEWABLE:
      continue

    rects += [x.core.GetGeometry(child).reply()]

  return rects

def obscure_image(image):
  """ Obscures the given image. """
  size = image.size
  pixel_size = 12

  try:
    image = image.resize((size[0] / pixel_size, size[1] / pixel_size), Image.NEAREST)
    image = image.resize((size[0], size[1]), Image.NEAREST)
  except:
    pass

  return image

def obscure(rects,image_path='/tmp/.i3lock.png'):
  """ Takes an array of rects to obscure from the screenshot. """
  image = Image.open(image_path)

  for rect in rects:
    if rect.x < 0 or rect.y < 0:
      continue
    area = (
      rect.x, rect.y,
      rect.x + rect.width,
      rect.y + rect.height
    )

    cropped = image.crop(area)
    cropped = obscure_image(cropped)
    image.paste(cropped, area)

  image.save(image_path)

def lock_screen():
  os.system('i3lock -u -i /tmp/.i3lock.png')

if __name__ == '__main__':
  # 1: Take a screenshot.
  #screenshot()

  # 2: Get the visible windows.
  rects = xcb_fetch_windows()

  # 3: Process the screenshot.
  if len(sys.argv) > 1:
    obscure(rects,image_path=sys.argv[1])
  else:
    obscure(rects,)

  # 4: Lock the screen
  #lock_screen()
