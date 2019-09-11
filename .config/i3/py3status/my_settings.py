#!/usr/bin/env python3
import subprocess
import os
class Py3status:
    format = 'Settings'

    def __init__(self):
        self.full_text = self.format

    def click_info(self):
        return {
            'full_text': self.format,
            'cached_until': self.py3.CACHE_FOREVER
        }

    def on_click(self, event):
        with open(os.devnull, 'wb') as devnull:
            subprocess.check_call('xfce4-settings-manager', 
                                   stdout=devnull, 
                                   stderr=subprocess.STDOUT)
