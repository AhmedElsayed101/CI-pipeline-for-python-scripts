# Change this input but keep the same structure with the question's guidelines.
input_lines = '''
3
1 1 0
1 1 1
1 0 0
'''


'''
The mandatory one:

Three best friends Petya, Vasya, and Tonya decided to form a team and take part in programming contests.
Participants are usually offered several problems during programming contests.
Long before the start the friends decided that they will implement a problem if at least two of them are sure about the solution.
Otherwise, the friends won't write the problem's solution.



This contest offers n problems to the participants.
For each problem we know which friend is sure about the solution. Help the friends find the number of problems for which they will write a solution.

 

Input Format

 

The first input line contains a single integer n representing the number of problems of the contest, followed by n lines.
Each line contains three numbers separated by spaces and taking a value of 0 or 1.
If the first number is 1, then Petya is sure about the problem's solution, otherwise, she is not.
The second number shows Vasya's view on the solution, the third number shows Tonya's view.

 

Output Format

 

Print a single integer — the number of problems the friends will implement on the contest.

 

Sample Input
3
1 1 0
1 1 1
1 0 0

 

Sample Output
2

 

Explanation
Petya and Vasya are sure that they know how to solve the first problem and all three of them know how to solve the second problem.
That means that they will write solutions for these problems.
Only Petya is sure about the solution for the third problem, but that isn't enough, so the friends won't take it.'''




# Convert multiline string to list of lines
list_of_input_lines = input_lines.splitlines()

questions_number = list_of_input_lines[1]
answers = list_of_input_lines[2:]

answers_as_number_list = []
for answer in answers:
    answers_as_number_list.append(list(map (int, answer.split())))

output = 0
for index,  answer in enumerate(answers_as_number_list):
    guess_numbers = 0
    for one_person_answer in answer:
        if one_person_answer == 1:
            guess_numbers +=1
        if guess_numbers >= 2:
            output +=1
            break
    
print(output)