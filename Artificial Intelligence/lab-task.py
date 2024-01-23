class Student:

    def __init__(self,rollnumber,name,marks) -> None:
        self.rollnumber = rollnumber
        self.name = name
        self.marks = marks

student_database = []

def add_student(rollnumber,name,marks):
    data = Student(rollnumber,name,marks)
    student_database.append(data)    

def display_student_details(rollnumber):
    for student in student_database:
        if student.rollnumber ==  rollnumber:
            print(f'Student Name: {student.name}')
            print(f'Student Roll Number: {student.rollnumber}')
            print(f'Student Marks: {student.marks}')

def display_all_students():
    for student in student_database:
        print(f'Student Name: {student.name}')
        print(f'Student Roll Number: {student.rollnumber}')
        print(f'Student Marks: {student.marks}')
    
def calculate_average_marks(rollnumber):
    for student in student_database:
        if student.rollnumber == rollnumber:
            sum += student.marks.values()
            Average = sum / len(student.marks)

def find_topper_and_display():
    max_marks = 0
    for student in student_database:
        if max_marks < student.marks.values():
            max_marks = student.marks.values()
    
    print(f'Topper student marks: {max_marks}')

student_marks = {}
while(True):
    print("Choose the option from the menu: ")
    print("1) Add a new student")
    print("2) Display details of a specific student")
    print("3) Display details of all the students")
    print("4) Calculate and Display the average marks of that student")
    print("5) Find and Display details of the student with the highest average marks")
    print("6) Exit the program")
    print("--------------------------------------------------------")
    choice = int(input("Enter your choice: "))

    if choice == 1:
        rollnumber = int(input("Enter your rollno: "))
        name = input("Enter your name: ")
        subject_name = input("Enter your subject name: ")
        subject_value = input("Enter subject no: ")
        student_marks[subject_name] = subject_value
        add_student(rollnumber,name,student_marks)
    elif choice == 2:
        rollnumber = int(input("Enter your rollno: "))
        display_student_details(rollnumber)
    elif choice == 3:
        display_all_students()
    elif choice == 4:
        rollnumber = int(input("Enter your rollno: "))
        calculate_average_marks(rollnumber)
    elif choice == 5:
        find_topper_and_display()
    elif choice == 6:
        break
