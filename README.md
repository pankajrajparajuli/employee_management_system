# 📊 LS Corporation – Project Management System

A fully functional web-based project management system developed as part of the **CC6012NI Data and Web Development** coursework at **Islington College / London Metropolitan University**. This system enables centralized tracking and coordination of users, tasks, milestones, resources, and comments within multiple concurrent projects.

---

## 📌 Table of Contents

- [📘 About the Project](#📘-about-the-project)
- [✨ Key Features](#✨-key-features)
- [🧱 Technology Stack](#🧱-technology-stack)
- [🧠 System Design](#🧠-system-design)
- [📁 Project Structure](#📁-project-structure)
- [🗃️ Database Schema](#️-database-schema)
- [⚙️ Setup Instructions](#️-setup-instructions)

---

## 📘 About the Project

**LS Corporation**, a mid-sized tech firm, needed a centralized system to manage projects, tasks, and team communication. This system was designed to:

- Centralize project data  
- Assign users to multiple tasks and projects  
- Track progress via milestones and subtasks  
- Facilitate team collaboration via comments  
- Provide insights through dashboards and top performer metrics  

---

## ✨ Key Features

- ✅ User, Project, and Task CRUD  
- ✅ Milestones and Subtasks Management  
- ✅ Multi-user Task Assignment  
- ✅ Task Commenting System  
- ✅ Resource Allocation per Task  
- ✅ Top Performer Dashboard (Ranking by Task Completion)  
- ✅ Project-wise Milestone Tracking  
- ✅ Modern Web UI with Bootstrap Design  
- ✅ Oracle 11g Backend Integration  

---

## 🧱 Technology Stack

- **Frontend**: ASP.NET Web Forms (C#), Bootstrap 5  
- **Backend**: Oracle 11g Express Edition  
- **ORM/DB Tooling**: Oracle SQL Developer & Data Modeler  
- **Hosting (Dev)**: IIS Express  

---

## 🧠 System Design

- 🔁 **Normalization**: UNF → 1NF → 2NF → 3NF (included in documentation)  
- 🧩 **ERD**: Created using Oracle SQL Developer Data Modeler  
- 📖 **Data Dictionary**: Covers datatypes, constraints, and keys  
- 📊 **Complex Queries**:
  - Top 3 performers per project (based on completed tasks)
  - User-specific project/task overview
  - Project milestone listing with filters

---

## 📁 Project Structure
lscorporation/
│ lscorporation.sln
├── lscorporation/
│ ├── Global.asax
│ ├── Web.config
│ ├── Pages/
│ │ ├── Forms/
│ │ │ ├── Basic/
│ │ │ │ ├── UserForm.aspx
│ │ │ │ ├── ProjectForm.aspx
│ │ │ │ ├── TaskForm.aspx
│ │ │ │ └── ... (others)
│ │ │ └── Complex/
│ │ │ ├── TopPerformer.aspx
│ │ │ ├── UserProjects.aspx
│ │ │ └── ProjectMilestones.aspx
│ │ └── Dashboard/
│ │ └── Dashboard.aspx
│ ├── App_Code/
│ └── App_Data/
---

## 🗃️ Database Schema

Includes the following core entities and relationships:

- `Users`: Participants with roles (PM, Dev, Designer, etc.)
- `Projects`: Each with its own milestones and timelines
- `Tasks`: Assigned to users and linked to projects
- `SubTasks`: Detailed breakdowns of tasks
- `Milestones`: Progress tracking per project
- `Resources`: Tools/resources per task
- `Comments`: Linked to tasks for team communication
- `UserProjectTasks`: Many-to-many user-to-task mapping
- `UserProjects`: Many-to-many user-to-project mapping

---

## ⚙️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/ls-corporation-project-management.git
