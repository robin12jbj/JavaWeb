package cugb.javaee.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import cugb.javaee.bean.Student;

/**
 * ѧ����Ϣ����ӿڣ���Ҫ���ܰ�����
 * 1.����ѧ����Ϣ��
 * 2.�޸�ѧ����Ϣ��
 * 3.ɾ��ѧ����Ϣ��
 * 4.��ѯ����ѧ����Ϣ��
 *
 * @author allan
 * @version 1.0
 */
public interface IStudentDAO
{
    /**
     * ����ѧ����Ϣ�� 
     * @param st ����ѧ����Ϣ�Ķ���
     * @return ���ӵ�ѧ����ID��
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public long addStudent(Student st) throws SQLException;
    
    /**
     * ɾ��ָ����ѧ����Ϣ��
     * @param studentId Ҫɾ����ѧ����ID��
     * @return �Ѿ�ɾ����ѧ����ID��
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public long removeStudent(long studentId) throws SQLException;
    
    /**
     * �޸�ָ����ѧ����Ϣ�������޸ĵ���Ϣ������
     * ���������䡢�Ա�
     * @param st ����ѧ����Ϣ�Ķ���
     * @return ���޸ĵ�ѧ���� ID��
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public long modifyStudent(Student st) throws SQLException;
    
    /**
     * ��ѯ���е�ѧ����Ϣ��
     * @return ����ѧ����Ϣ�����ݽṹ�����û�з���NULL��
     * @throws SQLException ִ�в��������κ��쳣ʱ��
     */
    public ArrayList findStudents() throws SQLException;
}
