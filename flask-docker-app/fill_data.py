import faker
from random import randint, random
import random
import sqlite3


NUMBER_STUDENTS = 40
NUMBER_GROUPS = 3
NUMBER_PROFESSORS = 5
NUMBER_SUBJECTS = 5
NUMBER_GRADES = 20

def generate_fake_data(number_students, number_groups, number_professors, number_subjects, number_grades):
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

    for _ in range(number_grades):
        grade = round(random.uniform(60, 100), 2)
        fake_grades.append((grade, fake_data.date_this_decade()))

    return fake_students, fake_groups, fake_professors, fake_subjects, fake_grades

def prepare_data(groups, professors, students, subjects, grades):
    for_groups = []
    for group in groups:
        for_groups.append((group, ))

    for_professors = []
    for professor in professors:
        for_professors.append((professor, ))

    for_students = []
    for student in students:
        for_students.append((student, randint(1, NUMBER_GROUPS)))

    for_subjects = []
    for subject in subjects:
        for_subjects.append((subject, randint(1, NUMBER_PROFESSORS)))

    for_grades = []
    for grade in grades:
        for_grades.append((grade, randint(1, NUMBER_STUDENTS), randint(1, NUMBER_SUBJECTS)))

    return  for_students, for_groups, for_professors, for_subjects, for_grades

def insert_data_to_db(groups, professors, students, subjects, grades):
    with sqlite3.connect('db.db') as con:
        cur = con.cursor()
        sql_to_groups = """INSERT INTO groups(group_name)
                               VALUES (?)"""
        cur.executemany(sql_to_groups, groups)
        sql_to_professors = """INSERT INTO professors(professors_name)
                               VALUES (?)"""
        cur.executemany(sql_to_professors, professors)
        sql_to_students = """INSERT INTO students(student, groups_id )
                               VALUES (?,?)"""
        cur.executemany(sql_to_students, students)
        sql_to_subjects = """INSERT INTO subjects(subject, professors_id )
                               VALUES (?,?)"""
        cur.executemany(sql_to_subjects, subjects)
        sql_to_grades = """INSERT INTO grades(grades, student_id, subject_id)
                               VALUES (?,?,?)"""
        cur.executemany(sql_to_grades, grades)
        
        con.commit()

if __name__ == "__main__":
    students, groups, professors, subjects, grades = prepare_data(*generate_fake_data(NUMBER_STUDENTS, NUMBER_GROUPS, NUMBER_PROFESSORS, NUMBER_SUBJECTS, NUMBER_GRADES))
    insert_data_to_db(students, groups, professors, subjects, grades)       
# students, groups, professors, subjects, grades = prepare_data(*generate_fake_data(NUMBER_STUDENTS, NUMBER_GROUPS, NUMBER_PROFESSORS, NUMBER_SUBJECTS, NUMBER_GRADES))
# print(students)
# print(groups)
# print(subjects)
# print(professors)
# print(grades)
      