# ProjectManagementSystem
This project was designed in accordance with the ﬁnal year project regulations of our college.
The absence of a legacy system makes it an ideal condition for deploying our project.
Deployment would require hosting our project on a server. 
Further live testing will be required to understand the bugs in the system. On successful deployment,
accomplishment of the future scope will also help improve the system. 

To set up the system:
<ul>
<li>Create MySQL Database and run Tables.sql to set up the required tables.</li>
<li>Student, Guide, PCT Members and admin login credentials need to be appended in UserValidationTable for all the users.
(Example has been provided)</li>
<li>Change the Database details to your credentials in DBPackage.DatabaseConnection.</li>
<li>Set up the project on Apache Tomcat server 8+.</li>
<li>Add the jar ﬁles to the build path (Project > Properties > JavaBuildPath > Libraries > AddexternalJars)
and deployment assembly (Project > Properties > DeploymentAssembly > Add > ArchivesfromFileSystem)
<ol>
<li> servlet.jar </li>
<li> mysql-connector.jar</li>
<li>jstl-1.2.jar </li>
</ol>
</li>
<li>Run the project on server and Open LoginPage.html on browser.</li>
</ul>


<h3>Workflow</h3>
<img src="https://i.ibb.co/LZ8YJgF/Workflow1.jpg" alt="overview"/>
<img src="https://i.ibb.co/PtGbC0q/Work-Flow2.jpg" alt="student" />
<img src="https://i.ibb.co/Y8JTZCT/Workflow3.jpg" alt="guide" />
<img src="https://i.ibb.co/8sgvTm2/Workflow4.jpg" alt="PCT" />

<h3>Use Case Diagram<h3>
<img src="https://i.ibb.co/9ZnHYRk/Use-Case-Diagram.jpg" alt="usecase" />

<h3>Pages</h3>
<img src="https://i.ibb.co/sF0BGyh/login-page.png" alt="LoginPage" />
<img src="https://i.ibb.co/CtjJHg6/stud-home.jpg" alt="StudentHomePage" />
<img src="https://i.ibb.co/X5LT3GX/team-info.png" alt="TeamInfoForm" />
<img src="https://i.ibb.co/DGgMPrJ/guide-home.png" alt="GuideHomePage" />
<img src="https://i.ibb.co/dKvXLpY/chat.jpg" alt="ChatPage" />
<img src="https://i.ibb.co/ZJ008x1/controlpage.jpg" alt="ControlPage" />
<img src="https://i.ibb.co/2Z1m6bD/notice.jpg" alt="NoticePage" />


