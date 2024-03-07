from datetime import datetime
import faker
from random import randint, choice
import sqlite3

NUMBER_STUDENTS = 40
NUMBER_GROUPS = 3
NUMBER_PROFESSORS = 5
NUMBER_SUBJECTS = 5
NUMBER_GRADES = 20

def generate_fake_data(number_students, number_groups, number_professors, number_subjects):
    fake_students = []  
    fake_groups = []  
    fake_professors = []
    fake_subjects = []
    fake_grades = []

    fake_data = faker.Faker()

    for _ in range(number_students):
        fake_students.append(fake_data.name())

    for i in range(1, number_groups+1):
        fake_groups.append(f'Group {i}')

    for _ in range(number_professors):
        fake_professors.append(fake_data.name())

    for _ in range(number_subjects):
        fake_subjects.append(fake_data.job())

    # for _ in range(number_grades):
    #    [(random.randint(1, 50), random.randint(1, 8), round(random.uniform(60, 100), 2), fake.date_this_decade()) for _ in range(1000)]
    #    fake_grades.append(fake_data.number())

    return fake_students, fake_groups, fake_professors, fake_subjects

students, groups, professors, subjects = generate_fake_data(NUMBER_STUDENTS, NUMBER_GROUPS, NUMBER_PROFESSORS, NUMBER_SUBJECTS)
print(students)
print(groups)
print(subjects)
print(professors)
# print(grades)
      