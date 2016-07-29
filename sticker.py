#!/bin/env python3.5
'''
 Given stickers labeled "linkedin", identify the number of stickers required to build
a specific string from its individual characters.
 
eg: input: link, output: 1
    input: lined in  output: 1
    input: kindled output: 2
    input: kite    output: 0
'''

import sys
                
sticker = 'linkedin'
string = input()
                 
sticker_count = dict.fromkeys(set(sticker),0)
        
for i in sticker:
    sticker_count[i] = sticker_count[i] + 1

string_count = dict.fromkeys(set(string),0)

for i in string:
        string_count[i] = string_count[i] + 1
        mod_dict = sticker_count.copy()
        count = 1
for i in string_count.keys():
    max = count
    if i not in sticker_count.keys(): 
        print("Found a character not in sticker string")
        sys.exit(1)
    while mod_dict[i] < string_count[i]:
        count = count + 1
        mod_dict = {i:mod_dict[i]+sticker_count[i] for i in sticker_count.keys()}
    if count > max:
        max = count

print("Stickers required is %d" %max)

