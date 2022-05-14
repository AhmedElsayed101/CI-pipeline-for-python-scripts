# Change this input but keep the same structure with the question's guidelines.
input_list_as_string = '["1818005553531", "31415926535"]'

'''
Serial number?
Consider a serial number which is a sequence of 11 digits where the first digit is 8.

 

Write a function that accepts a list of strings. Each string is of variable length. You are allowed to delete characters from the input string.

The function should return a list of integers of the same size as the input with 1 at index i if the string at the same index in the input can be converted to a serial number and 0 otherwise.

 

Input Format

A list of strings

 

Output Format

A list of integers of the same size as the input

 

Sample Input

["1818005553531", "31415926535"]

 

Sample Output
[1, 0]

 

Explanation 0
The first string can be converted to a serial number. E.g., by deleting the first and the third digits: "1818005553531" will be "88005553531".
'''





input_as_list = input_list_as_string.strip('][').split(', ')

output = []
for index, serial_code in enumerate(input_as_list):

    code = serial_code.strip('"')
    indeces_of_eight = []
    for char_index, char in enumerate(code):
        if char == '8':
            indeces_of_eight.append(char_index)

    for i, index_of_8 in enumerate(indeces_of_eight):
        if len(code) - index_of_8 >= 11:
            output.append(1)
            break  
        if i == len(indeces_of_eight) -1:
            output.append(0)

    if len(indeces_of_eight) == 0:
        output.append(0)

print(output)
