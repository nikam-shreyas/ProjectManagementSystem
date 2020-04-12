
import DBPackage.DatabaseConnection;import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/SendMessageServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class SendMessageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FileUploadDao fileUploadDao;

    @Override
    public void init() {
        fileUploadDao = new FileUploadDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // gets values of text fields
        String notice = request.getParameter("notice");

        InputStream inputStream = null; // input stream of the upload file

        String message = null;
        String filename = null;
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("fileup");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            filename = extractFileName(filePart);
        }
        
        // sends the statement to the database server
        int row = fileUploadDao.uploadFile(notice, filename, inputStream);
        if (row > 0) {
            message = "File uploaded and saved into database";
        }
        PrintWriter pw = response.getWriter();
        pw.write(message);
        
    }
    
    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
}