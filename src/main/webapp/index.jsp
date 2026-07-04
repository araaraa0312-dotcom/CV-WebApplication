<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>CV Generator</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-100 min-h-screen">

<div class="max-w-5xl mx-auto py-10 px-6">
    <div class="bg-white rounded-2xl shadow-xl overflow-hidden">

        <div class="bg-slate-900 text-white px-8 py-8 text-center">
            <h1 class="text-4xl font-bold">Create Your Professional CV</h1>
            <p class="text-blue-300 mt-2">Fill in your details and upload your profile picture.</p>
        </div>

        <form action="cv" method="post" enctype="multipart/form-data"
              class="grid grid-cols-1 md:grid-cols-2 gap-6 p-8">

            <div>
                <label class="font-semibold">Full Name *</label>
                <input type="text" name="name" required class="w-full mt-2 border rounded-lg px-4 py-3">
            </div>

            <div>
                <label class="font-semibold">Profile Picture</label>
                <input type="file" name="profileImage" accept="image/*"
                       class="w-full mt-2 border rounded-lg px-4 py-3 bg-white">
            </div>

            <div>
                <label class="font-semibold">Email *</label>
                <input type="email" name="email" required class="w-full mt-2 border rounded-lg px-4 py-3">
            </div>

            <div>
                <label class="font-semibold">Phone *</label>
                <input type="text" name="phone" required class="w-full mt-2 border rounded-lg px-4 py-3">
            </div>

            <div class="md:col-span-2">
                <label class="font-semibold">Profile Summary</label>
                <textarea name="summary" rows="3" class="w-full mt-2 border rounded-lg px-4 py-3"></textarea>
            </div>

            <div>
                <label class="font-semibold">Education *</label>
                <textarea name="education" rows="5" required class="w-full mt-2 border rounded-lg px-4 py-3"></textarea>
            </div>

            <div>
                <label class="font-semibold">Work Experience *</label>
                <textarea name="experience" rows="5" required class="w-full mt-2 border rounded-lg px-4 py-3"></textarea>
            </div>

            <div>
                <label class="font-semibold">Technical Skills *</label>
                <textarea name="skills" rows="4" required class="w-full mt-2 border rounded-lg px-4 py-3"></textarea>
            </div>

            <div>
                <label class="font-semibold">Projects</label>
                <textarea name="projects" rows="4" class="w-full mt-2 border rounded-lg px-4 py-3"></textarea>
            </div>

            <div class="md:col-span-2 flex flex-col md:flex-row gap-4 mt-4">
                <button type="submit"
                        class="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700">
                    Generate My CV
                </button>

                <a href="cv?action=example"
                   class="w-full text-center border border-blue-600 text-blue-600 py-3 rounded-lg font-semibold hover:bg-blue-50">
                    View Example CV
                </a>
            </div>
        </form>
    </div>
</div>

</body>
</html>