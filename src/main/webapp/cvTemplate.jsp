<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.CVapp.model.CVBean"%>

<%
    CVBean cv = (CVBean) request.getAttribute("cv");
    String firstLetter = "U";
    if (cv != null && cv.getName() != null && !cv.getName().isEmpty()) {
        firstLetter = cv.getName().substring(0, 1).toUpperCase();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Professional CV</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-100 py-10">

<div class="max-w-6xl mx-auto bg-white shadow-2xl rounded-xl overflow-hidden">

    <div class="bg-slate-900 text-white p-10">
        <div class="flex items-center gap-8">

                    <%
            if (cv.getProfileImage() != null && !cv.getProfileImage().isEmpty()) {
        %>
            <img src="<%= cv.getProfileImage() %>"
                 class="w-36 h-36 rounded-full border-4 border-white object-cover">
        <%
            } else {
        %>
            <div class="w-36 h-36 rounded-full bg-white text-slate-900 flex items-center justify-center text-5xl font-bold">
                <%= firstLetter %>
            </div>
        <%
            }
        %>

            <div>
                <h1 class="text-5xl font-bold tracking-wide">
                    <%= cv.getName() %>
                </h1>
                <p class="text-blue-300 text-xl mt-3">
                    Applicant Profile
                </p>

                <div class="flex flex-wrap gap-6 mt-5 text-gray-300">
                    <span>📧 <%= cv.getEmail() %></span>
                    <span>📞 <%= cv.getPhone() %></span>
                </div>
            </div>

        </div>
    </div>

    <div class="p-10 space-y-4">

        <section>
            <h2 class="text-2xl font-bold text-blue-700 border-b-2 border-blue-500 pb-2">
                PROFILE SUMMARY
            </h2>
            <p class="mt-2 whitespace-pre-line text-gray-700">
                <%= cv.getSummary() %>
            </p>
        </section>

        <section>
            <h2 class="text-2xl font-bold text-blue-700 border-b-2 border-blue-500 pb-2">
                EDUCATION HISTORY
            </h2>
            <p class="mt-2 whitespace-pre-line text-gray-700 ">
                <%= cv.getEducation() %>
            </p>
        </section>

        <section>
            <h2 class="text-2xl font-bold text-blue-700 border-b-2 border-blue-500 pb-2">
                EMPLOYMENT & EXPERIENCE
            </h2>
            <p class="whitespace-pre-line text-gray-700">
                <%= cv.getExperience() %>
            </p>
        </section>

        <section>
            <h2 class="text-2xl font-bold text-blue-700 border-b-2 border-blue-500 pb-2">
                TECHNICAL SKILLS
            </h2>

            <div class="mt-5 whitespace-pre-line flex flex-wrap gap-3">
                <%
                    String skills = cv.getSkills();
                    if (skills != null && !skills.isEmpty()) {
                        String[] skillList = skills.split("[,\\n]+");
                        for (String skill : skillList) {
                %>
                    <span class="bg-blue-100 text-blue-700 px-4 py-2 rounded-full text-sm font-semibold">
                        <%= skill.trim() %>
                    </span>
                <%
                        }
                    }
                %>
            </div>
        </section>

        <section>
            <h2 class="text-2xl font-bold text-blue-700 border-b-2 border-blue-500 pb-2">
                PROJECTS
            </h2>
            <p class="mt-2 whitespace-pre-line text-gray-700">
                <%= cv.getProjects() %>
            </p>
        </section>

        <div class="flex justify-between pt-6">
            <a href="index.jsp"
               class="bg-slate-900 text-white px-6 py-3 rounded-lg hover:bg-slate-800">
                ← Back to Form
            </a>

            <button onclick="window.print()"
                    class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700">
                Print CV
            </button>
        </div>

    </div>
</div>

</body>
</html>