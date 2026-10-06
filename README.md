# College Event Management System (with Digital Event Pass Generation)

A clean, practical, and comprehensive **Event Management System** developed for college students using **Core Java, JDBC, and MySQL**.

---

## 📌 Project Overview

In colleges and universities, events, workshops, quizzes, and symposiums often rely on paper records or spreadsheets, resulting in duplicate entries, seat overflow, lost participant details, and manual attendance marking.

This project delivers a **centralized system** tailored for 2nd-year Computer Science curriculum standards that connects:
1. **Students**: Browse events, search categories, register with automatic capacity verification, view registration history, cancel seats, and generate digital event passes.
2. **Organizers / Faculty**: Manage event rosters, filter registered attendees, search participants by name or Registration ID, and mark attendance with duplicate prevention.
3. **Administrators**: Create, edit, and delete events, assign faculty coordinators, monitor total system metrics, and inspect all student records.

---

## 🌟 Small Novelty Feature: "Digital Event Pass System"

Rather than merely displaying a basic confirmation message, the system automatically generates an official, printable **College Event Pass** with a **unique registration ID** (e.g. `CIT-EVT-1001`):

```text
--------------------------------
        COLLEGE EVENT PASS
--------------------------------
Event       : CodeFest 2026
Student     : Kailash S
Department  : CSE
Date        : 15-10-2026
Venue       : Seminar Hall

Registration ID
CIT-EVT-1025

Status: REGISTERED
--------------------------------
```

- **Unique Registration ID**: Sequentially generated (`CIT-EVT-XXXX`), stored in MySQL.
- **Seat Availability Guarantee**: Real-time seat tracking blocks registrations once capacity is reached (`EventFullException`).
- **Duplicate Prevention**: Prevents duplicate registrations for the same event (`DuplicateRegistrationException`).
- **Print / PDF Support**: Students can click *Print / Download Pass* for offline entrance verification at the venue.

---

## 🛠️ Technology Stack

| Component | Technology | Description |
|---|---|---|
| **Programming Language** | Java (JDK 21 / 17+) | Core Java, OOP, Collections, Exception Handling |
| **Database** | MySQL 8.0 / 9.x | Relational Database with Foreign Key constraints |
| **Database Connectivity** | JDBC | `PreparedStatement`, `Connection`, `ResultSet` |
| **User Interface** | HTML5, CSS3, Vanilla JS | Clean, college-themed web UI served directly via embedded Java HTTP Server (`com.sun.net.httpserver`) |
| **Driver** | `mysql-connector-j-9.2.0.jar` | Included in `lib/` directory |

---

## 📂 Project Directory Structure

```text
JAVA PROJECT/
│
├── src/
│   ├── model/
│   │   ├── User.java                     # Abstract base class (Abstraction, Encapsulation)
│   │   ├── Student.java                  # Extends User (Inheritance & Polymorphism)
│   │   ├── Organizer.java                # Extends User
│   │   ├── Admin.java                    # Extends User
│   │   ├── Event.java                    # Event entity with seat calculation helpers
│   │   ├── Registration.java             # Registration entity
│   │   └── Attendance.java               # Attendance record entity
│   │
│   ├── dao/
│   │   ├── UserDAO.java                  # User authentication and student queries
│   │   ├── EventDAO.java                 # Event CRUD, HashMap lookup, keyword search
│   │   ├── RegistrationDAO.java          # Seat checks, unique ID generation, registrations
│   │   └── AttendanceDAO.java            # Attendance verification & duplicate prevention
│   │
│   ├── util/
│   │   ├── DBConnection.java             # Database singleton, properties loader, auto-setup
│   │   ├── ValidationUtil.java           # Input format validators (email, name, passwords)
│   │   └── JsonHelper.java               # Lightweight Core Java JSON serializer/parser
│   │
│   ├── exception/
│   │   ├── EventFullException.java       # Custom exception: "Sorry, this event is full."
│   │   └── DuplicateRegistrationException.java # Custom exception: "Already registered."
│   │
│   ├── server/
│   │   └── AppHttpServer.java            # Embedded Core Java HTTP server & REST APIs
│   │
│   └── Main.java                         # Application entry point with browser auto-launch
│
├── web/                                  # College Portal Web UI
│   ├── index.html                        # Campus landing page with featured events
│   ├── login.html                        # Role-based login with 1-click test credentials
│   ├── register.html                     # New student account registration
│   ├── student-dashboard.html            # Student dashboard with quick actions & table
│   ├── events.html                       # Event browser with search & registration modal
│   ├── my-registrations.html             # Student registration history & cancel feature
│   ├── event-pass.html                   # Official College Event Pass (Novelty)
│   ├── organizer-dashboard.html          # Organizer portal with attendance desk
│   ├── admin-dashboard.html              # Admin portal with live metric counters
│   ├── manage-events.html                # Admin Event Management (Add/Edit/Delete)
│   ├── css/
│   │   └── style.css                     # Academic Navy college theme & print styles
│   └── js/
│       └── app.js                        # Client state, API wrapper, and UI helpers
│
├── database/
│   └── event_management.sql              # MySQL DDL schema and sample records
│
├── lib/
│   └── mysql-connector-j-9.2.0.jar       # MySQL JDBC Connector
│
├── db.properties                         # Externalized DB connection credentials
├── build.bat                             # One-click compile script
├── run.bat                               # One-click start web server & launch browser
├── run-console.bat                       # One-click terminal CLI mode
└── README.md
```

---

## 💡 2nd-Year Java Concepts Demonstrated

### 1. Object-Oriented Programming (OOP)
- **Abstraction**: `User` is an `abstract class` defining `abstract String getRoleDescription()`, ensuring no generic user can be created without a role.
- **Inheritance**: `Student`, `Organizer`, and `Admin` extend `User`, inheriting base attributes (`userId`, `name`, `email`, `department`) and adding role-specific behavior.
- **Polymorphism**: In `UserDAO.mapUser()`, the returned reference is `User`, dynamically resolving to the correct subclass at runtime.
- **Encapsulation**: All fields in `Event`, `Registration`, and `User` are `private`/`protected` with public getter and setter methods.

### 2. Java Collections Framework
- `ArrayList<Event>` and `ArrayList<Registration>` used for listing, sorting, and displaying tabular records.
- `HashMap<Integer, Event>` implemented in `EventDAO.getEventMap()` to demonstrate $O(1)$ key-based fast lookups by Event ID.
- `Set<Integer>` used for tracking registered event IDs in the frontend.

### 3. Custom Exception Handling
- `EventFullException`: Thrown by `RegistrationDAO` when active seats equal `max_participants`.
- `DuplicateRegistrationException`: Thrown when a student re-registers for an event they already enrolled in.
- Proper `try-catch-finally` blocks and resource-management (`try-with-resources`) across all database operations.

### 4. JDBC & MySQL Operations
- **PreparedStatement**: Parameterized SQL queries prevent SQL injection.
- **CRUD Operations**:
  - `CREATE`: Adding events, student registration, recording attendance.
  - `READ`: Authenticating users, browsing events, viewing participant rosters.
  - `UPDATE`: Editing events, cancelling registrations.
  - `DELETE`: Removing events.
- **Transactions & Constraints**: Foreign keys (`ON DELETE CASCADE`), unique constraints (`UNIQUE KEY`), and auto-increment primary keys.

---

## 🚀 How to Run the Project

### Prerequisites
1. **Java JDK 17 or 21** installed (`java -version` and `javac -version`).
2. **MySQL Server 8.0 or 9.x** running on port `3306`.

### Option A: One-Click Launch (Windows)
1. Double-click `run.bat`.
   - The script compiles the code if not already compiled.
   - Verifies the MySQL connection.
   - Starts the server on `http://localhost:8080`.
   - Automatically opens your default web browser!

### Option B: Command Line (PowerShell / Command Prompt)
1. **Compile**:
   ```powershell
   javac -encoding UTF-8 -cp "lib/mysql-connector-j-9.2.0.jar;src" -d bin src/model/*.java src/exception/*.java src/util/*.java src/dao/*.java src/server/*.java src/Main.java
   ```
2. **Run Web Portal**:
   ```powershell
   java -cp "bin;lib/mysql-connector-j-9.2.0.jar" Main
   ```
   Open browser at: [http://localhost:8080](http://localhost:8080)

3. **Run Interactive Terminal Mode (for CLI viva demo)**:
   ```powershell
   java -cp "bin;lib/mysql-connector-j-9.2.0.jar" Main --console
   ```

---

## 🔑 Pre-Configured Demo Accounts

For quick presentation and evaluation, use these pre-loaded accounts (or click the 1-click test buttons on the login page):

| Role | Email | Password | User Name | Notes |
|---|---|---|---|---|
| **Student** | `kailash@cit.edu` | `student123` | Kailash S (CSE) | Has sample registrations & passes |
| **Organizer** | `organizer@cit.edu` | `org123` | Dr. Ramesh Kumar (CSE) | Can mark attendance & view CodeFest |
| **Admin** | `admin@cit.edu` | `admin123` | Admin User | Full event management (CRUD) |

---

## 📋 Viva / Presentation Preparation Guide

### Q1: What is the novelty of your project?
> **Answer**: Most existing student registration projects provide only a basic web page confirmation. Our system features an **automated Digital Event Pass Generator**. Upon successful enrollment, the system validates seat availability, guarantees a unique registration ID (`CIT-EVT-XXXX`), and generates an official, printable College Event Pass formatted with student credentials, department, venue, and status stamp for venue entry.

### Q2: How did you implement OOP principles?
> **Answer**:
> - **Abstraction**: Created an abstract `User` class with an abstract method `getRoleDescription()`.
> - **Inheritance**: `Student`, `Organizer`, and `Admin` extend `User`.
> - **Polymorphism**: The `UserDAO.authenticate()` method returns a generic `User` reference pointing to the specific runtime subclass.
> - **Encapsulation**: All entity variables are private and manipulated exclusively via getters and setters.

### Q3: How do you prevent SQL injection?
> **Answer**: We use JDBC `PreparedStatement` with placeholder `?` parameters for all dynamic database queries instead of concatenating strings.

### Q4: How does the system handle concurrent capacity and duplicate entries?
> **Answer**: In `RegistrationDAO.registerStudentForEvent()`:
> 1. We first check whether the student is already actively enrolled; if yes, we throw our custom `DuplicateRegistrationException`.
> 2. We check the event capacity against active registrations; if seats are exhausted, we throw our custom `EventFullException`.
> 3. Database unique keys also enforce integrity at the schema level.

---

## 🎓 Author
- **Project**: College Event Management System with Digital Event Pass Generation
- **Department**: Computer Science and Engineering &bull; CIT Chennai
