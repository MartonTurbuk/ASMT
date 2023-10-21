-- 1. Select all primary skills that contain more than one word (please note that both ‘-‘ and ‘ ’ could be used as a separator) – 0.2 points.
-- A: -
-- 2. Select all students who does not have second name (it is absent or consists from only one letter/letter with dot) – 0.2 points.
-- A: 
select * from "School"."Student" where last_name = '' or last_name is NULL or length(last_name) < 2;
-- 3. Select number of students passed exams for each subject and order result by number of student descending. – 0.2 points.
-- A: not working
SELECT EXAM.SCORE,
	EXAM.STUDENT_SUBJECTS_ID,
	STUDENT_SUBJECTS.ID,
	STUDENT_SUBJECTS.STUDENT_ID,
	STUDENT_SUBJECTS.SUBJECT_ID,
	SUBJECT.SUBJECT_ID,
	SUBJECT.NAME
FROM "School"."exam"
INNER JOIN "School"."student_subjects" ON STUDENT_SUBJECTS.ID = EXAM.STUDENT_SUBJECTS_ID
INNER JOIN "School"."subject" ON SUBJECT.SUBJECT_ID = STUDENT_SUBJECTS.SUBJECT_ID
WHERE SCORE > 60
GROUP BY EXAM.SCORE,
	EXAM.STUDENT_SUBJECTS_ID,
	STUDENT_SUBJECTS.ID,
	SUBJECT.SUBJECT_ID
	
SELECT SUBJECT.NAME,
	EXAM.SCORE
FROM "School"."subject"
INNER JOIN "School"."student_subjects" ON STUDENT_SUBJECTS.SUBJECT_ID = SUBJECT.SUBJECT_ID
INNER JOIN "School"."exam" ON STUDENT_SUBJECTS_ID = STUDENT_SUBJECTS_ID
WHERE SCORE > 60



select e.name, count(*) as "students" from "School2"."subject" e
left join "School2"."student_subjects" ss on ss.subject_id = e.subject_id
left join "School2"."exam" ex on ss.id = ex.student_subjects_id
left join "School2"."student" s on s.student_id = ss.student_id
where ex.score > 60
group by e.name
order by students desc;

select count(*) from "School2"."student";
select count(*) from "School2"."student_subjects";


select e.name, count(*) as "students" from "School2"."subject" e
right join "School2"."student_subjects" ss on ss.subject_id = e.subject_id
full outer join "School2"."student" s on s.student_id = ss.student_id
group by e.name

select count(*) from "School2"."exam"
where exam.score < 60
-- 4. Select number of students with the same exam marks for each subject. – 0.2 points.
-- 5. Select students who passed at least two exams for different subject. – 0.3 points.
-- 6. Select students who passed at least two exams for the same subject. – 0.3 points.
-- 7. Select all subjects which exams passed only students with the same primary skills. – 0.3 points.
-- 8. Select all subjects which exams passed only students with the different primary skills. It means that all students passed the exam for the one subject must have different primary skill. – 0.4 points.
-- 9. Select students who does not pass any exam using each the following operator: – 0.5 points.
-- Outer join
-- Subquery with ‘not in’ clause
-- Subquery with ‘any ‘ clause Check which approach is faster for 1000, 10K, 100K exams and 10, 1K, 100K students
-- 10. Select all students whose average mark is bigger than overall average mark. – 0.3 points.
-- 11. Select top 5 students who passed their last exam better than average students. – 0.3 points.
-- 12. Select biggest mark for each student and add text description for the mark (use COALESCE and WHEN operators) – 0.3 points.
-- In case if student has not passed any exam ‘not passed' should be returned.
-- If student mark is 1,2,3 – it should be returned as ‘BAD’
-- If student mark is 4,5,6 – it should be returned as ‘AVERAGE’
-- If student mark is 7,8 – it should be returned as ‘GOOD’
-- If student mark is 9,10 – it should be returned as ‘EXCELLENT’
-- 13. Select number of all marks for each mark type (‘BAD’, ‘AVERAGE’,…) – 0.4 points.