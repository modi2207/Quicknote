

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



@WebServlet("/go")
public class demo extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//String fname=request.getParameter("file");
		try
		{
		ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
		
	
		
		
		List<FileItem> item=sf.parseRequest(request);
		
		for(FileItem it:item)
		{
		
		 it.write(new File("C:/javaworkspace19/Quicknote/WebContent/images/" + it.getName()));
		}
		
		System.out.println("success");
		}
	
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		
		
		
		
	}

	
}
