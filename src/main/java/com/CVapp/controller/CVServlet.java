package com.CVapp.controller;

import com.CVapp.model.CVBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.Base64;
import java.io.InputStream;

@WebServlet(name = "CVServlet", urlPatterns = {"/cv"})
@MultipartConfig
public class CVServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CVBean cv = new CVBean();

        cv.setName(request.getParameter("name"));
        cv.setEmail(request.getParameter("email"));
        cv.setPhone(request.getParameter("phone"));
        cv.setEducation(request.getParameter("education"));
        cv.setExperience(request.getParameter("experience"));
        cv.setSkills(request.getParameter("skills"));
        cv.setSummary(request.getParameter("summary"));
        cv.setProjects(request.getParameter("projects"));

        Part filePart = request.getPart("profileImage");

        if (filePart != null && filePart.getSize() > 0) {
            InputStream inputStream = filePart.getInputStream();
            byte[] imageBytes = inputStream.readAllBytes();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            cv.setProfileImage("data:" + filePart.getContentType() + ";base64," + base64Image);
        } else {
            cv.setProfileImage("");
        }

        request.setAttribute("cv", cv);
        request.getRequestDispatcher("cvTemplate.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("example".equals(action)) {
            CVBean cv = new CVBean();

            cv.setName("Hasmen Medina binti Hakimie");
            cv.setEmail("hasmen.medina@gmail.com");
            cv.setPhone("011-26050489");
            cv.setEducation("Bachelor of Computer Science (Hons.) - Enterprise Computing\nUiTM Cawangan Terengganu (Graduation: 2026)");
            cv.setExperience("Junior Web Intern at Nexus Solutions Sdn Bhd (6 Months)\nIntern Web Developer at Tech Startup (June 2025 - September 2025)\n- Maintained internal corporate platforms using Java.\n- Assisted in drafting responsive frontend themes.");
            cv.setSkills("Java, Jakarta EE 11, Tailwind CSS, Maven, Git, MySQL, RESTful APIs");
            cv.setSummary("A motivated Computer Science student with interest in web application development and enterprise programming");
            cv.setProjects("Jakarta Web MVC Application Framework\nCV Web Application using MVC architecture and JavaBean");
            cv.setProfileImage("");

            request.setAttribute("cv", cv);
            request.getRequestDispatcher("cvTemplate.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}