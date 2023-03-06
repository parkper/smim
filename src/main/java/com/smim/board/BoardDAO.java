package com.smim.board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smim.dbcp.DBConnectionMgr;

public class BoardDAO {

	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = "D:/workspace-smim/smim/src/main/webapp/smim/uploadFile";	
	private static final String ENCTYPE = "utf-8";
	private static int MAXSIZE = 5*1024*1024;
	
	public BoardDAO( ) {
		try { pool = DBConnectionMgr.getInstance( ); }
		catch(Exception e) { e.printStackTrace( ); }
	}
	
	public Vector<BoardVO> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardVO> vlist = new Vector<BoardVO>( );		
		
		try {
			con = pool.getConnection( );			
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from tblBoard order by ref desc, pos limit ?, ?";		
				pstmt = con.prepareStatement(sql);				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				sql = "select * from tblBoard where " + keyField + " like ? ";
				sql += "order by ref desc, pos limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");				
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery( );
			
			while(rs.next( )) {
				BoardVO bean = new BoardVO( );
				
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				
				vlist.add(bean);
			}
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		
		return vlist;
	}
	
	
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection( );
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from tblBoard";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from  tblBoard where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery( );
			if (rs.next( )) { 	totalCount = rs.getInt(1); }
		}catch(Exception e) { e.printStackTrace( ); }finally { pool.freeConnection(con, pstmt, rs); }
		return totalCount;
	}

	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;
		
		try {
			con = pool.getConnection( );
			sql = "select max(num)  from tblBoard";			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery( );
			int ref = 1;
			if(rs.next( )) ref = rs.getInt(1) + 1;			
			File file = new File(SAVEFOLDER);			
			if(!file.exists( )) file.mkdirs( );			
			multi = new MultipartRequest(req,SAVEFOLDER,MAXSIZE,ENCTYPE,new DefaultFileRenamePolicy( ));
			
			if(multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length( );
			}
			String content = multi.getParameter("content");			
			if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {			
				content = UtilMgr.replace(content, "<", "&lt;");				
			}
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql += "values(?, ?, ?, ?, 0, 0, now( ), ?, 0, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, multi.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			
			pstmt.executeUpdate( );
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
	}	
	
	
	public BoardVO getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardVO bean = new BoardVO( );
		
		try {
			con = pool.getConnection( );
			sql = "select * from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery( );
			if (rs.next( )) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setIp(rs.getString("ip"));
			}
		} 
		catch(Exception e) { e.printStackTrace( ); }finally { pool.freeConnection(con, pstmt, rs); }
		return bean;
	}
	
	
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "update tblBoard set count=count+1 where num=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate( );
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt); }
	}

	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection( );			
			sql = "select filename from tblBoard where num=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery( );
			
			if (rs.next( ) && rs.getString(1) != null) {
				if (!rs.getString(1).equals("")) {					
					File file = new File(SAVEFOLDER + "/" + rs.getString(1));			
					if (file.exists( )) UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));					
				}
			}
			
			sql = "delete from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate( );			
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
	}
	
	
	public void updateBoard(BoardVO bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "update tblBoard set name=?, subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName( ));
			pstmt.setString(2, bean.getSubject( ));
			pstmt.setString(3, bean.getContent( ));
			pstmt.setInt(4, bean.getNum( ));
			
			pstmt.executeUpdate( );
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt); }
	}
	
	
	public void replyBoard(BoardVO bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "insert tblBoard (name,content,subject,ref,pos,depth,regdate,pass,count,ip)";
			sql += "values(?,?,?,?,?,?,now( ),?,0,?)";
			int pos = bean.getPos( ) + 1;
			int depth = bean.getDepth( ) + 1;		
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName( ));
			pstmt.setString(2, bean.getContent( ));
			pstmt.setString(3, bean.getSubject( ));
			pstmt.setInt(4, bean.getRef( ));
			pstmt.setInt(5, pos);
			pstmt.setInt(6, depth);
			pstmt.setString(7, bean.getPass( ));
			pstmt.setString(8, bean.getIp( ));
			
			pstmt.executeUpdate( );
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
	}

	
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "update tblBoard set pos = pos + 1 where ref=? and pos > ?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate( );
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
	}

	
	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
		
		try {
			String filename = req.getParameter("filename");			
			File file = new File(UtilMgr.con(SAVEFOLDER + File.separator + filename));	
			byte b[ ] = new byte[(int) file.length( )];			
			res.setHeader("Accept-Ranges", "bytes");			
			String strClient = req.getHeader("User-Agent");
			
			if(strClient.indexOf("MSIE6.0") != -1) {				
				res.setContentType("application/smnet;charset=euc-kr");				
				res.setHeader("Content-Disposition", "filename=" + filename + ";");
			}else {
				res.setContentType("application/smnet;charset=euc-kr");
				res.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
			}
			
			out.clear( );
			out = pageContext.pushBody( );			
			
			if (file.isFile( )) {
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream bos = new BufferedOutputStream(res.getOutputStream( ));				
				int read = 0;
				
				while((read = bis.read(b)) != -1) {
					bos.write(b, 0, read);					
				}
							
				bos.close( );
				bis.close( );
			}
		}
		catch(Exception e) { e.printStackTrace( ); }
	}
	
	
	public void post1000( ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate( );
			}
		}
		catch(Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
	}
	
	public static void main(String[] args) {
		new BoardDAO( ).post1000( );
		System.out.println("SUCCESS");
	}
}
