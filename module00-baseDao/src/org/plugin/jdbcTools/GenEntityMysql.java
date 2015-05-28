package org.plugin.jdbcTools;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 * create entity for mysql 对mysql数据库的表创建实体类 实体类生成工具,目前支持数据库为MYSQL 5.3+
 * 针对生成的实体。按照单表生成和指定数据库名批量生成。 现目前存在数据库某些数据类型不完整。在生成的实体类中找不到，需要手动补齐。
 * 
 * @since 2015/05/15
 * @author hunter
 *
 */
public class GenEntityMysql {

	/**指定实体生成所在包的路径 包名必须为org打头**/ 
	public String packageOutPath = "org.plugin.entity.demo";
	private String authorName = "争分夺秒";// 作者名字
	/**表名**/ 
	public String tablename = "api_exam_result";
	/**表名列表**/ 
	public String[] tablenames = null; 
	/**数据库表注释**/ 
	public String[] tablecomments; 
	/**数据库名**/ 
	public String dbname = "letmeshow";
	private String[] colnames; // 列名数组
	private String[] colTypes; // 列名类型数组
	private int[] colSizes; // 列名大小数组
	private boolean f_util = false; // 是否需要导入包java.util.*
	private boolean f_sql = false; // 是否需要导入包java.sql.*

	// 数据库连接
	private final String URL = "jdbc:mysql://localhost:3306/" + dbname;
	private static final String NAME = "root";
	private static final String PASS = "root";
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	// 数据库连接池操作
	/** 创建连接 **/
	Connection con;
	/** 创建查询申明 **/
	Statement stmt;
	/** 创建结果返回容器 **/
	ResultSet rs = null;

	/**
	 * 生成实体类构造函数
	 * 
	 * @param flg
	 *            true:多表生成，false:单表生成
	 */
	public GenEntityMysql(boolean flg) {
		openConnection(URL, NAME, PASS);
		// true:单表生成，false:多表生成
		if (flg) {
			getFullTablesName(dbname);
			for (int i = 0; i < tablenames.length; i++) {
				genTableEach(tablenames[i],tablecomments[i]);
			}
		} else {
			genTableEach(tablename,"");
		}

	}

	/**
	 * 创建数据库连接，该操作需要有mysql-connector-java-5.1.21.jar包的支持。 当前使用版本为5.1
	 * 
	 * @param URL jdbc:mysql://localhost:3306/" + dbname;
	 * @param NAME root
	 * @param PASS root
	 */
	public void openConnection(String URL, String NAME, String PASS) {
		try {
			con = DriverManager.getConnection(URL, NAME, PASS);
			// 设置查询结果可滚动的ResultSet类型
			// 这个类型支持前后滚动取得纪录next(),previous(),回到第一行first(),同时还支持要去的ResultSet中的第几行absolute(int
			// n),
			// 以及移动到相对当前行的第几行relative(int n),要实现这样的ResultSet在创建Statement时用如下的方法.
			stmt = con.createStatement(rs.TYPE_SCROLL_INSENSITIVE,
					rs.CONCUR_READ_ONLY);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	/**
	 * 
	 * 指定dbname的值。批量生成整个库的实体类操作
	 * 设置全局变量String[] tablenames的值为指定库的表名和表注释
	 * @param dbname
	 */
	public void getFullTablesName(String dbname) {
		try {
			// 查要生成实体类的表
			String sql = "select TABLE_NAME,TABLE_COMMENT from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='"
					+ dbname + "';";

			rs = stmt.executeQuery(sql);
			if (rs != null) {
				rs.last();
				int count = rs.getRow();
				int idx = -1;
				// 获取返回结果集的行数
				tablenames = new String[count];
				tablecomments = new String[count];
				rs.first();
				tablenames[++idx] = rs.getString("TABLE_NAME");// rs.getArray(TABLE_NAME);
				tablecomments[idx] = rs.getString("TABLE_COMMENT");
				System.out.println(tablenames[idx].toString());
				while (rs.next()) {
					tablenames[++idx] = rs.getString("TABLE_NAME");// rs.getArray(TABLE_NAME);
					tablecomments[idx] = rs.getString("TABLE_COMMENT");
					System.out.println(tablenames[idx].toString());

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 单表生成实体类函数
	 * 
	 * @param tablename 数据库表名
	 *            
	 */
	public void genTableEach(String tablename,String tablecomment) {

		// 查要生成实体类的表
		String sql = "select * from " + tablename;
		PreparedStatement pStemt = null;
		try {
			pStemt = con.prepareStatement(sql);
			ResultSetMetaData rsmd = pStemt.getMetaData();
			int size = rsmd.getColumnCount(); // 统计列
			colnames = new String[size];
			colTypes = new String[size];
			colSizes = new int[size];
			for (int i = 0; i < size; i++) {
				colnames[i] = rsmd.getColumnName(i + 1);
				colTypes[i] = rsmd.getColumnTypeName(i + 1);

				if (colTypes[i].equalsIgnoreCase("datetime")) {
					f_util = true;
				}
				if (colTypes[i].equalsIgnoreCase("image")
						|| colTypes[i].equalsIgnoreCase("text")) {
					f_sql = true;
				}
				colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
			}

			String content = parse(colnames, colTypes, colSizes, tablename,tablecomment);

			try {
				File directory = new File("");
				// System.out.println("绝对路径："+directory.getAbsolutePath());
				// System.out.println("相对路径："+directory.getCanonicalPath());
				String path = this.getClass().getResource("").getPath();

				System.out.println(path);
				// 这里的lastIndexOf中的org为自己定义的包名的起始位置。我的包全部为org.plugin.*所以这里检索的是org
				System.out.println("src/?/"
						+ path.substring(path.lastIndexOf("/org/",
								path.length())));
				// String outputPath = directory.getAbsolutePath()+
				// "/src/"+path.substring(path.lastIndexOf("/com/",
				// path.length()), path.length()) + initcap(tablename) +
				// ".java";
				String outputPath = directory.getAbsolutePath() + "/src/"
						+ this.packageOutPath.replace(".", "/") + "/"
						+ initcap(tablename) + ".java";
				FileWriter fw = new FileWriter(outputPath);
				PrintWriter pw = new PrintWriter(fw);
				pw.println(content);
				pw.flush();
				pw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// try {
			// rs.close();
			// con.close();
			// } catch (SQLException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			// }
		}
	}

	/**
	 * 功能：生成实体类主体代码
	 * 
	 * @param colnames 列名
	 * @param colTypes 字段类型
	 * @param colSizes 字段长度
	 * @param tablename 表名
	 * @return 类文件头部信息
	 */
	private String parse(String[] colnames, String[] colTypes, int[] colSizes,
			String tablename,String tablecomment) {
		StringBuffer sb = new StringBuffer();

		sb.append("package " + this.packageOutPath + ";\r\n");
		sb.append("\r\n");

		// 判断是否导入工具包
		if (f_util) {
			sb.append("import java.util.Date;\r\n");
		}
		if (f_sql) {
			sb.append("import java.sql.*;\r\n");
		}
		// 注释部分
		sb.append("   /**\r\n");
		sb.append("    * " + tablename +  " " + tablecomment+ " 实体类\r\n");
		sb.append("    * " + new Date() + " " + this.authorName + "\r\n");
		sb.append("    */ \r\n");
		// 实体部分
		sb.append("\r\n\r\npublic class " + initcap(tablename) + "{\r\n");
		processAllAttrs(sb);// 属性
		processAllMethod(sb);// get set方法
		sb.append("}\r\n");

		// System.out.println(sb.toString());
		return sb.toString();
	}

	/**
	 * 功能：生成所有属性
	 * 
	 * @param sb
	 */
	private void processAllAttrs(StringBuffer sb) {

		for (int i = 0; i < colnames.length; i++) {
			sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " "
					+ colnames[i] + ";\r\n");
		}

	}

	/**
	 * 功能：生成所有方法
	 * 
	 * @param sb
	 */
	private void processAllMethod(StringBuffer sb) {

		for (int i = 0; i < colnames.length; i++) {
			sb.append("\tpublic void set" + initcap(colnames[i]) + "("
					+ sqlType2JavaType(colTypes[i]) + " " + colnames[i]
					+ "){\r\n");
			sb.append("\tthis." + colnames[i] + "=" + colnames[i] + ";\r\n");
			sb.append("\t}\r\n");
			sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get"
					+ initcap(colnames[i]) + "(){\r\n");
			sb.append("\t\treturn " + colnames[i] + ";\r\n");
			sb.append("\t}\r\n");
		}

	}

	/**
	 * 功能：将输入字符串的首字母改成大写
	 * 
	 * @param str
	 * @return
	 */
	private String initcap(String str) {

		char[] ch = str.toCharArray();
		if (ch[0] >= 'a' && ch[0] <= 'z') {
			ch[0] = (char) (ch[0] - 32);
		}

		return new String(ch);
	}

	/**
	 * 功能：获得列的数据类型
	 * 
	 * @param sqlType
	 * @return
	 */
	private String sqlType2JavaType(String sqlType) {

		if (sqlType.equalsIgnoreCase("bit")) {
			return "boolean";
		} else if (sqlType.equalsIgnoreCase("tinyint")) {
			return "byte";
		} else if (sqlType.equalsIgnoreCase("smallint")) {
			return "short";
		} else if (sqlType.equalsIgnoreCase("int")
				|| sqlType.equalsIgnoreCase("integer")) {
			return "int";
		} else if (sqlType.equalsIgnoreCase("bigint")) {
			return "long";
		} else if (sqlType.equalsIgnoreCase("float")) {
			return "float";
		} else if (sqlType.equalsIgnoreCase("decimal")
				|| sqlType.equalsIgnoreCase("numeric")
				|| sqlType.equalsIgnoreCase("real")
				|| sqlType.equalsIgnoreCase("money")
				|| sqlType.equalsIgnoreCase("smallmoney")) {
			return "double";
		} else if (sqlType.equalsIgnoreCase("varchar")
				|| sqlType.equalsIgnoreCase("char")
				|| sqlType.equalsIgnoreCase("nvarchar")
				|| sqlType.equalsIgnoreCase("nchar")
				|| sqlType.equalsIgnoreCase("text")) {
			return "String";
		} else if (sqlType.equalsIgnoreCase("date")
				|| sqlType.equalsIgnoreCase("datetime")
				|| sqlType.equalsIgnoreCase("timestamp")
				|| sqlType.equalsIgnoreCase("year")) {
			return "Date";
		} else if (sqlType.equalsIgnoreCase("image")) {
			return "Blod";
		}

		return null;
	}

	/**
	 * 出口 TODO
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		new GenEntityMysql(true);

	}

}