# -*- coding: utf-8 -*-

class Py3status:
  #  def __init__(self):
  #              self.full_text='Click me'
    format='set'
    def settings(self):
        return{
                'full_text': self.format,
                'cached_until': self.py3.CACHE_FOREVER
                }
                
#    def click_info(self):
#        return{
#                'full_text': self.full_text,
#                'cached_until': self.py3.CACHE_FOREVER
#                }
    def on_click(self,event):
        button = event['button']
        format_string = 'Pressed'
        data = {'button': button}
        self.full_text = self.py3.safe_format(format_string,data)
