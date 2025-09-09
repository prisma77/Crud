package com.prisma77.crud.repository;

import com.prisma77.crud.domain.Enrollment;
import org.apache.ibatis.annotations.*;
import java.util.List;

@Mapper
public interface EnrollmentRepository {

    @Select("SELECT e.*, s.student_no, s.name as student_name, c.code, c.title as course_title " +
            "FROM enrollment e " +
            "JOIN student s ON e.student_id = s.id " +
            "JOIN course c ON e.course_id = c.id " +
            "WHERE e.student_id = #{studentId}")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "studentId", column = "student_id"),
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "enrolledAt", column = "enrolled_at"),
            @Result(property = "student.studentNo", column = "student_no"),
            @Result(property = "student.name", column = "student_name"),
            @Result(property = "course.code", column = "code"),
            @Result(property = "course.title", column = "course_title")
    })
    List<Enrollment> findByStudentId(@Param("studentId") Long studentId);

    @Select("SELECT e.*, s.student_no, s.name as student_name, c.code, c.title as course_title " +
            "FROM enrollment e " +
            "JOIN student s ON e.student_id = s.id " +
            "JOIN course c ON e.course_id = c.id " +
            "WHERE e.course_id = #{courseId}")
    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "studentId", column = "student_id"),
            @Result(property = "courseId", column = "course_id"),
            @Result(property = "enrolledAt", column = "enrolled_at"),
            @Result(property = "student.studentNo", column = "student_no"),
            @Result(property = "student.name", column = "student_name"),
            @Result(property = "course.code", column = "code"),
            @Result(property = "course.title", column = "course_title")
    })
    List<Enrollment> findByCourseId(@Param("courseId") Long courseId);

    @Select("SELECT COUNT(*) FROM enrollment WHERE student_id = #{studentId} AND course_id = #{courseId}")
    int countByStudentAndCourse(@Param("studentId") Long studentId, @Param("courseId") Long courseId);

    @Insert("INSERT INTO enrollment(student_id, course_id, enrolled_at) VALUES(#{studentId}, #{courseId}, NOW())")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Enrollment enrollment);

    @Delete("DELETE FROM enrollment WHERE student_id = #{studentId} AND course_id = #{courseId}")
    int deleteByStudentAndCourse(@Param("studentId") Long studentId, @Param("courseId") Long courseId);
}
