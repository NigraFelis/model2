package com.gms.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gms.web.constant.DB;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.factory.DatabaseFactory;

public class MemberDAOImpl implements MemberDAO{
	Connection conn;
	public static MemberDAOImpl instance = new MemberDAOImpl();
	public static MemberDAOImpl getInstance() {
		return instance;
	}
	private MemberDAOImpl(){
		conn=null;
	}
	
	@Override
	public String insert(Map<?,?> map) {
		String rs="";
		MemberBean bean=(MemberBean)map.get("member");
		@SuppressWarnings("unchecked")
		List<MajorBean> major = (List<MajorBean>)map.get("major");
		PreparedStatement pstmt = null;
		
		try {
			conn= DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL.MEMBER_INSERT);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());	
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getSsn());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getProfile());
			System.out.println("***"+SQL.MEMBER_INSERT);
			pstmt.executeUpdate();
			
			for(int i=0; i<major.size(); i++){
				System.out.println("--------");
				pstmt=conn.prepareStatement(SQL.MAJOR_INSERT);
				pstmt.setString(1, major.get(i).getMajorId());
				pstmt.setString(2, major.get(i).getTitle());
				pstmt.setString(3, major.get(i).getSubjId());
				pstmt.setString(4, major.get(i).getId());
				rs=String.valueOf(pstmt.executeUpdate());
				System.out.println(rs);
			}
			System.out.println(major.get(1));
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(conn !=null){
				try {
					conn.rollback();
				} catch (SQLException ex) {
					e.printStackTrace();
				}
			}
		}
		return rs;
	}

	@Override
	public List<?> selectAll() {
		List<StudentBean>list = new ArrayList<>();
		try {
			ResultSet rs = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.STUDENT_LIST).executeQuery();
			StudentBean member=null;	
				while(rs.next()){
					member = new StudentBean();
					member.setNum(rs.getString(DB.NUM));
					member.setId(rs.getString(DB.ID));
					member.setName(rs.getString(DB.NAME));
					member.setEmail(rs.getString(DB.EMAIL));
					member.setPhone(rs.getString(DB.PHONE));
					member.setRegdate(rs.getString(DB.REGDATE));
					member.setSsn(rs.getString(DB.SSN));
					member.setTitle(rs.getString(DB.TITLE));
					list.add(member);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MemberBean> selectByName(String name) {
		List<MemberBean>list = new ArrayList<>();
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_FINDBYNAME);
			pstmt.setString(1,name);
			ResultSet rs = pstmt.executeQuery();
			MemberBean member=null;
				while(rs.next()){
					member = new MemberBean();
					member.setId(rs.getString(DB.MEMBER_ID));
					member.setName(rs.getString(DB.NAME));
					member.setPassword(rs.getString(DB.MEMBER_PASS));
					member.setSsn(rs.getString(DB.SSN));
					member.setRegdate(rs.getString(DB.REGDATE));
					list.add(member);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public MemberBean selectById(String id) {
		MemberBean member = null;
		
		try {
			
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_FINDBYID);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				member=new MemberBean();
				member.setId(rs.getString(DB.MEMBER_ID));
				member.setName(rs.getString(DB.MEMBER_NAME));
				member.setPassword(rs.getString(DB.MEMBER_PASS));
				member.setSsn(rs.getString(DB.MEMBER_SSN));
				System.out.println(member);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return member;
	}

	@Override
	public String count() {
		String count="";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_CONUT);
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				count=String.valueOf(rs.getString("count"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
		
	}
	@Override
	public String update(MemberBean member) {
		int rs=0;
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_UPDATE);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getId());
			rs= pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(rs);
		
	}

	@Override
	public String delete(String id) {
		String rs="";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).getConnection().prepareStatement(SQL.MEMBER_DELETE);
			pstmt.setString(1, id);
			rs= String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}

}
