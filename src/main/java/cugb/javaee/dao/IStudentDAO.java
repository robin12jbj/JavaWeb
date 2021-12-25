package cugb.javaee.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import cugb.javaee.bean.Student;

/**
 * 学生信息处理接口，主要功能包括：
 * 1.增加学生信息。
 * 2.修改学生信息。
 * 3.删除学生信息。
 * 4.查询所有学生信息。
 *
 * @author allan
 * @version 1.0
 */
public interface IStudentDAO
{
    /**
     * 增加学生信息。 
     * @param st 包含学生信息的对象。
     * @return 增加的学生的ID。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public long addStudent(Student st) throws SQLException;
    
    /**
     * 删除指定的学生信息。
     * @param studentId 要删除的学生的ID。
     * @return 已经删除的学生的ID。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public long removeStudent(long studentId) throws SQLException;
    
    /**
     * 修改指定的学生信息，可以修改的信息包括：
     * 姓名、年龄、性别。
     * @param st 包含学生信息的对象。
     * @return 被修改的学生的 ID。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public long modifyStudent(Student st) throws SQLException;
    
    /**
     * 查询所有的学生信息。
     * @return 包含学生信息的数据结构，如果没有返回NULL。
     * @throws SQLException 执行操作发生任何异常时。
     */
    public ArrayList findStudents() throws SQLException;
}
