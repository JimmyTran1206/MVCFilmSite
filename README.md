# MVCFilmSite

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZlyrkpwiALlAiP6Ev1H0aIbvdnPAEM61q3g&usqp=CAU" alt="MVC Film Logo">

### Overview
The **FilmQueryProject** started as a command-line application, utilizing JDBC and MySQL to retrieve and display film data. It implemented a menu-driven interface that allowed users to look up films by ID, search keywords, or exit the application. The project focused on JDBC implementation, encapsulation of JDBC code within the `DatabaseAccessorObject` class, object-oriented programming principles, exception handling, and a simple user interface.

The evolution of the project led to the development of **SpringMVCFilmCRUD**, a full web-based C.R.U.D. (Create, Read, Update, Delete) application using Spring MVC and the DAO pattern. The DAO implementation continued to use JDBC to persist and retrieve data, but now in the context of a web application.

### Lessons Learned

1. **JDBC Implementation:**
   - In the initial project, the use of JDBC to connect to a MySQL database and retrieve film-related data laid the foundation for the CRUD operations in the Spring MVC project.
   - Transitioning to Spring MVC involved adapting the existing JDBC knowledge to integrate with the newly learned Spring framework.

2. **Encapsulation:**
   - Encapsulation of JDBC code within the `DatabaseAccessorObject` class was a good practice in the FilmQueryProject. In SpringMVCFilmCRUD, this understanding of encapsulation was crucial for organizing code within DAOs and service classes.

3. **Menu-Driven Interface vs. Web Interface:**
   - The shift from a menu-driven interface in the command-line project to a full web interface in Spring MVC demonstrated the flexibility and scalability of different user interfaces based on the application's requirements.

4. **Object-Oriented Programming:**
   - The emphasis on object-oriented principles, defining entities like Film and Actor, was maintained in SpringMVCFilmCRUD. However, the Spring MVC architecture introduced additional concepts like controllers and views.

5. **Exception Handling:**
   - The FilmQueryProject included exception handling for managing potential SQL and runtime exceptions. In SpringMVCFilmCRUD, understanding which exceptions to throw, where to throw them, and how to handle them became crucial, especially in a web context.

6. **User Interface Evolution:**
   - The simple user interface in the initial project evolved into a dynamic and interactive web interface in SpringMVCFilmCRUD. This evolution required a grasp of Spring MVC's view resolution, form handling, and navigation.

#### User Stories

1. **Film Details Viewing:**
   - Users can enter a Film's ID and view the details in a web page.

2. **Adding a New Film:**
   - Users can add a new film by entering all its properties. The input creates a Film object, saved in the database. Insert failure informs the user.

3. **Deleting a Film:**
   - Users can delete a film, removing it from the database. Delete failure is communicated to the user.

4. **Editing a Film:**
   - Users can edit a film's properties (excluding ID) through a form. Updated data is saved in the database. Update failure informs the user.

5. **Searching Films by Keyword:**
   - Users can search for films by keyword/pattern in title or description. The user can choose to update or delete a record from the resulting list.

6. **Displaying Related Data:**
   - When viewing a film's details, its actors and categories are listed.

### Collaborative Project Experience

The transition from an individual project to a collaborative one presented new challenges and opportunities for growth. Here are some lessons learned from working on a graded project with a partner:

1. **Communication:**
   - Clear and consistent communication is essential. Establishing a common understanding of project requirements, goals, and timelines helps avoid misunderstandings.

2. **Collaborative Coding:**
   - Collaborative coding tools (version control systems like Git) facilitate teamwork. Learning to branch, merge, and resolve conflicts effectively is crucial for a smooth development process.

3. **Task Distribution:**
   - Dividing tasks based on individual strengths and expertise ensures efficient progress. Regular check-ins help track progress and address any obstacles.

4. **Code Integration:**
   - Integrating code seamlessly requires synchronization and testing. Regularly pulling and merging changes minimizes conflicts and ensures a cohesive codebase.

5. **Problem Solving Together:**
   - Collaborating on problem-solving enhances learning. Discussing issues, researching solutions, and implementing fixes as a team contribute to a shared understanding of the project.

6. **Feedback and Iteration:**
   - Providing constructive feedback and being open to suggestions contribute to continuous improvement. Iterative development allows for refining code and enhancing overall project quality.

7. **Grading Criteria Alignment:**
   - Aligning coding practices, adherence to project requirements, and quality standards with grading criteria helps in delivering a project that meets expectations.

By navigating these challenges and embracing collaborative practices, the transition from an individual project to a collaborative one becomes a valuable learning experience that prepares for real-world software development scenarios.