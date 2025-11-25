# 🚦 Smart City Traffic Management System

## 📘 Overview
Urban traffic congestion has become one of the major challenges in modern cities.  
Traditional static traffic lights cannot adapt to changing traffic volumes, causing long waits and inefficiency.

The **Smart City Traffic Management System** is a database-driven solution leveraging **MySQL Events** to simulate real-time traffic flow, dynamically manage signals, prioritize emergency vehicles, and generate automated congestion reports.

---

## 🎯 Objectives
- Build a well-normalized **database structure** for intersections, traffic signals, and congestion data.
- Implement **real-time dynamic signal control** using scheduled MySQL events.
- Provide **automatic emergency signal prioritization** using pre-emption logic.
- Generate **periodic congestion reports** for monitoring and future optimization.

---

## 🧱 System Architecture

### **Core Database Entities**
| Table | Description |
|--------|-------------|
| `intersection` | Stores intersection locations. |
| `traffic_signal` | Tracks signal state, timers, vehicle count, and emergency flags. |
| `congestion_report` | Stores congestion reports generated periodically. |

### **Relationships**
- One-to-many → `intersection` → `traffic_signal`
- Congestion data is derived directly from vehicle counts in `traffic_signal`
- Emergency logic is handled entirely through database events

---

## ⚙️ Automated MySQL Events

| Event Name | Interval | Function |
|------------|----------|----------|
| `realistic_vehicle_movement` | Every 5 sec | Simulates movement/accumulation of vehicles |
| `handle_emergency_signal` | Every 3 sec | Gives priority to the least congested emergency signal |
| `dynamic_congestion_control` | Every 10 sec | Adjusts signals dynamically based on congestion |
| `report_congestion` | Every 5 sec | Logs congestion levels into `congestion_report` |

These events collectively mimic real-world adaptive traffic behavior.

---

## 🧮 Tech Stack

| Component | Technology |
|-----------|------------|
| Database | MySQL 8+ |
| Logic Engine | MySQL Event Scheduler |
| Documentation | Markdown |
| Version Control | Git + GitHub |

---

## ⚙️ Project Phases

| Phase | Duration | Key Tasks |
|-------|----------|-----------|
| Phase 1 | Week 1 | Schema design (tables, relationships) |
| Phase 2 | Week 2–3 | Traffic flow simulation events |
| Phase 3 | Week 4 | Emergency signal handling |
| Phase 4 | Week 5 | Congestion reporting |
| Phase 5 | Week 6 | Testing, fixes, documentation |

---

## 🧰 Folder Structure
```text
Smart-City-Traffic-Management-System/
│
├── sql/
│   ├── tables/
│   │   ├── intersection.sql
│   │   ├── traffic_signal.sql
│   │   └── congestion_report.sql
│   │
│   └── events/
│       ├── realistic_vehicle_movement.sql
│       ├── handle_emergency_signal.sql
│       ├── dynamic_congestion_control.sql
│       └── report_congestion.sql
│
├── docs/
│   ├── ERD.png
│   └── proposal.pdf
│
└── README.md

```
---
## 🧪 Testing & Validation

### **Functional Testing**
- Signals rotate properly during low congestion  
- Most congested signal receives GREEN priority  
- Emergency signals override normal cycles  

### **Performance Testing**
- Event scheduler executes with low overhead  
- Scales with increasing number of intersections  

### **Data Integrity Testing**
- Foreign key constraints validated  
- Vehicle counts prevented from dropping below zero  

---

## 📊 Expected Outcomes
- Adaptive and intelligent traffic control  
- Automatically created emergency routes  
- Accurate real-time congestion insights  
- Scalable backend for smart city systems  

---

## 🔗 Repository
GitHub: https://github.com/Vedansh2601/Smart-City-Traffic-Management-System


---


## 🧾 References
- [Traffic Monitoring System (GitHub)](https://github.com/DhavanRaoBV/Traffic-Monitoring-System)  
- [Traffic Management System (GitHub)](https://github.com/yashsaxena1999/Traffic-Management-System)

---

## 🪪 License
This project is developed as part of the **DBMS Course (DBMS-V-T075)** and is intended for academic and learning purposes only.

---

⭐ **If you found this project helpful, consider starring the repo!**
