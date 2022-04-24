

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Downloadd")
public class Downloadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String FILE_LOCATION = "C:/javaworkspace19/Quicknote/WebContent/notes";
    final String[][] contentTypes = {{"xml", "text/xml"},{"pdf", "application/pdf"}};   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object f = request.getParameter("filename");
		if(f != null) {
			String fn = (String) f;
			String contentType = "application/pdf";
			File file = new File(FILE_LOCATION + "/" + fn);
			response.setContentType(contentType);
			response.addHeader("Content-Disposition", "attachment; filename=" + fn);
			response.setContentLengthLong((int)file.length());
			ServletOutputStream  sos = response.getOutputStream();
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			int byteRead = bis.read();
			while (byteRead != -1) {
				sos.write(byteRead);
				byteRead = bis.read();
			}
			if(sos != null) sos.close();
			if(bis != null) bis.close();
			
		}
	}

	private String getContentType(String ft) {
		String rt = null;
		for (int i=0; i<contentTypes.length; i++) {
			if (ft.equals(contentTypes[i][0])) rt = contentTypes[i][1];
		}
		return rt;
	}
	

}
