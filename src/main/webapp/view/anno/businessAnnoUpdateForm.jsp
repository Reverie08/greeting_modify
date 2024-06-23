<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Anno</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
<style>
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 2rem;
    }
    .header {
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .fixed-sidebar {
        position: fixed;
        top: 0;
        left: 0;
        height: 100%;
        width: 16.66%;
    }
    .main-content {
        margin-left: 16.66%;
    }
    .form-group {
        margin-bottom: 1rem;
    }
    .form-label {
        display: block;
        font-weight: bold;
        margin-bottom: 0.5rem;
    }
    .form-input {
        width: 100%;
        padding: 0.5rem;
        border: 1px solid #ddd;
        border-radius: 0.375rem;
    }
    .form-textarea {
        width: 100%;
        padding: 0.5rem;
        border: 1px solid #ddd;
        border-radius: 0.375rem;
        resize: vertical;
    }
    .skill-button {
        display: inline-block;
        padding: 0.5rem 1rem;
        border: 1px solid #ddd;
        border-radius: 0.375rem;
        margin: 0.25rem;
        cursor: pointer;
    }
    .skill-button.selected {
        background-color: #3182ce;
        color: white;
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const skillButtons = document.querySelectorAll('.skill-button');
        skillButtons.forEach(button => {
            button.addEventListener('click', () => {
                button.classList.toggle('selected');
                updateSelectedSkills();
            });
        });
    });

    function updateSelectedSkills() {
        const selectedSkills = document.querySelectorAll('.skill-button.selected');
        const skillNames = Array.from(selectedSkills).map(button => button.dataset.skillname);
        document.getElementById('selectedSkills').value = skillNames.join(',');
    }
</script>
</head>
<body class="bg-gray-100">
<div class="flex flex-col h-screen">
    <header class="header bg-white p-4 shadow-md">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-2xl font-bold">Update Anno</h1>
        </div>
    </header>
    <div class="flex flex-grow">
    
        <!-- Sidebar -->
        <aside class="bg-white rounded-lg shadow p-4 fixed-sidebar">
            <h2 class="text-lg font-bold mb-4">Sidebar</h2>
            <ul>
                <li class="mb-2"><a href="${pageContext.request.contextPath}/anno/business-anno-info?annoId=${anno.annoId}" class="text-blue-500"><b>공고내용</b></a></li>
                <li class="mb-2"><a href="${pageContext.request.contextPath}/anno/business-anno-management?annoId=${anno.annoId}" class="text-blue-500">이력서 관리</a></li>
                <li class="mb-2"><a href="#" class="text-blue-500">미정</a></li>
            </ul>
        </aside>

        <!-- Main Content -->
        <div class="main-content w-5/6 p-4 overflow-x-auto">
            <div class="container bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-2xl font-bold mb-4">Update Anno</h2>
                <form action="anno-update-pro" method="post">
                    <input type="hidden" name="annoId" value="${anno.annoId}">

                    <div class="form-group">
                        <label for="businessName" class="form-label">기업명:</label>
                        <input type="text" id="businessName" name="businessName" value="${anno.businessName}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="welfare" class="form-label">복지:</label>
                        <input type="text" id="welfare" name="welfare" value="${anno.welfare}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoTitle" class="form-label">공고 제목:</label>
                        <input type="text" id="annoTitle" name="annoTitle" value="${anno.annoTitle}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoCareer" class="form-label">경력:</label>
                        <input type="text" id="annoCareer" name="annoCareer" value="${anno.annoCareer}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoSalary" class="form-label">연봉:</label>
                        <input type="text" id="annoSalary" name="annoSalary" value="${anno.annoSalary}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoEdu" class="form-label">학력:</label>
                        <input type="text" id="annoEdu" name="annoEdu" value="${anno.annoEdu}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoGrade" class="form-label">직급:</label>
                        <input type="text" id="annoGrade" name="annoGrade" value="${anno.annoGrade}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoWorkType" class="form-label">근무 형태:</label>
                        <input type="text" id="annoWorkType" name="annoWorkType" value="${anno.annoWorkType}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoWorkDay" class="form-label">근무 요일:</label>
                        <input type="text" id="annoWorkDay" name="annoWorkDay" value="${anno.annoWorkDay}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoWorkPlace" class="form-label">근무지:</label>
                        <input type="text" id="annoWorkPlace" name="annoWorkPlace" value="${anno.annoWorkPlace}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoCommon" class="form-label">공통 자격:</label>
                        <input type="text" id="annoCommon" name="annoCommon" value="${anno.annoCommon}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoQualification" class="form-label">지원 자격:</label>
                        <input type="text" id="annoQualification" name="annoQualification" value="${anno.annoQualification}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoPickNum" class="form-label">채용 인원:</label>
                        <input type="text" id="annoPickNum" name="annoPickNum" value="${anno.annoPickNum}" class="form-input">
                    </div>

                    <div class="form-group">
                        <label for="annoContent" class="form-label">공고 내용:</label>
                        <textarea id="annoContent" name="annoContent" class="form-textarea">${anno.annoContent}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="businessId" class="form-label">기업 ID:</label>
                        <input type="text" id="businessId" name="businessId" value="${anno.businessId}" class="form-input">
                    </div>
                    
                    
                    <!-- Skill Selection -->
                    <div class="form-group">
                        <label for="skills" class="form-label">스킬:</label>
                        <div id="skills">
                            <c:forEach var="skill" items="${skills}">
                                <div class="skill-button ${skill.java != null ? 'selected' : ''}" data-skillname="java">java</div>
                                <div class="skill-button ${skill.jsp != null ? 'selected' : ''}" data-skillname="jsp">jsp</div>
                                <div class="skill-button ${skill.html != null ? 'selected' : ''}" data-skillname="html">html</div>
                                <div class="skill-button ${skill.css != null ? 'selected' : ''}" data-skillname="css">css</div>
                                <div class="skill-button ${skill.javascript != null ? 'selected' : ''}" data-skillname="javascript">javascript</div>
                                <div class="skill-button ${skill.react != null ? 'selected' : ''}" data-skillname="react">react</div>
                                <div class="skill-button ${skill.springframework != null ? 'selected' : ''}" data-skillname="springframework">springframework</div>
                                <div class="skill-button ${skill.springboot != null ? 'selected' : ''}" data-skillname="springboot">springboot</div>
                                <div class="skill-button ${skill.python != null ? 'selected' : ''}" data-skillname="python">python</div>
                                <div class="skill-button ${skill.typescript != null ? 'selected' : ''}" data-skillname="typescript">typescript</div>
                                <div class="skill-button ${skill.express != null ? 'selected' : ''}" data-skillname="express">express</div>
                                <div class="skill-button ${skill.oracle != null ? 'selected' : ''}" data-skillname="oracle">oracle</div>
                                <div class="skill-button ${skill.mysql != null ? 'selected' : ''}" data-skillname="mysql">mysql</div>
                                <div class="skill-button ${skill.mongodb != null ? 'selected' : ''}" data-skillname="mongodb">mongodb</div>
                            </c:forEach>
                        </div>
                    </div>
                    
                    <input type="hidden" id="selectedSkills" name="selectedSkills">
                    <div class="form-group">
                        <input type="submit" value="Submit" class="bg-blue-500 text-white px-4 py-2 rounded cursor-pointer">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
