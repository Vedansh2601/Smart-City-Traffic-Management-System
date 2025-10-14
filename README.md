# 🚦 Smart City Traffic Management System

## 📘 Overview
With the rapid growth of urban populations, traffic congestion has become a major challenge in cities worldwide.  
Traditional fixed-timer traffic lights fail to adapt to real-time traffic conditions, causing longer travel times, fuel wastage, and pollution.

This project — **Smart City Traffic Management System** — provides a **database-driven solution** that dynamically manages traffic signals, prioritizes emergency vehicles, and generates real-time congestion reports.

---

## 🎯 Objectives
- Design a **normalized database** to manage traffic signals, vehicles, congestion data, and emergency vehicle priority.
- Implement **real-time traffic signal control logic** based on vehicle count and congestion level.
- Enable **emergency vehicle prioritization** using pre-emption logic.
- Generate **automated congestion reports** for analysis and optimization.

---

## 🧱 System Architecture

### **Core Database Entities**
| Table | Description |
|--------|--------------|
| `traffic_signal` | Stores data about signals (ID, location, current state, cycle time). |
| `vehicle` | Logs vehicles passing through intersections with timestamps. |
| `congestion_report` | Records congestion data (vehicle count, congestion level, timestamp). |
| `emergency_vehicle` | Tracks emergency vehicle data and their signal priorities. |

### **Relationships**
- One-to-many: `traffic_signal → vehicle`
- One-to-one: `emergency_vehicle → traffic_signal`
- Reports are generated using joins and triggers.

---

## 🧮 Tech Stack
| Component | Technology |
|------------|-------------|
| Database | **MySQL / PostgreSQL** |
| Design Tools | **Lucidchart / Draw.io** |
| Programming (optional) | **Python (MySQL Connector / SQLAlchemy)** |
| Documentation | **Markdown / Sphinx** |
| Version Control | **Git + GitHub** |

---

## ⚙️ Project Phases

| Phase | Duration | Key Tasks |
|-------|-----------|-----------|
| **Phase 1** | Weeks 1–2 | Database schema design & setup |
| **Phase 2** | Weeks 3–4 | Traffic signal & congestion logic |
| **Phase 3** | Weeks 5–6 | Emergency vehicle priority logic |
| **Phase 4** | Weeks 7–8 | Testing, optimization & documentation |

---

## 🧰 Folder Structure
```text
Smart-City-Traffic-Management-System/
│
sql/
├── tables/
│   ├── intersection.sql         # Table schema for intersections
│   ├── traffic_signal.sql       # Table schema for traffic signals
│   ├── congestion_report.sql    # Table schema for congestion reports
│   └── emergency_vehicle.sql    # Table schema for emergency vehicles
│
├── events/
│   └── traffic_events.sql       # Scheduled MySQL events for real-time simulation:
│       # - Rotate traffic signals (one green at a time, others red)
│       # - Update vehicle counts dynamically based on signal color
│       # - Generate congestion reports when vehicle_count exceeds thresholds
│       # - Periodic reset of vehicle counts to prevent overflow
│
├── triggers/
│   └── triggers.sql             # Optional triggers (if used)
│
└── reports/
    └── reports.sql              # Queries for congestion monitoring and traffic analysis

├── python/                 # (optional)
│   ├── main.py
│   ├── db_connection.py
│   └── simulation.py
│
├── docs/
│   ├── ERD.png
│   └── proposal.pdf
│
└── README.md
```
---
## 🧪 Testing & Validation
- **Data Integrity Tests:** Check foreign key and referential integrity.  
- **Performance Tests:** Measure query execution time under load.  
- **Functional Tests:** Validate congestion reports and emergency logic.

---

## 📊 Expected Outcomes
- Reduced congestion and improved travel times.  
- Prioritized emergency vehicle movement.  
- Data-driven insights for city traffic optimization.  
- Scalable architecture for smart city integration.

---

## 👨‍💻 Team Members
| Name | Role | Email |
|------|------|--------|
| **Ridhima Kathait** | Team Lead | ridhima.kathait@gmail.com |
| **Samriddhi Kala** | Member | kalasamriddhi@gmail.com |
| **Vedansh Shinde** | Member | vedanshshinde1@gmail.com |
| **Samaksh Nain** | Member | samakshnain999@gmail.com |

---

## 🧾 References
- [Traffic Monitoring System (GitHub)](https://github.com/DhavanRaoBV/Traffic-Monitoring-System)  
- [Traffic Management System (GitHub)](https://github.com/yashsaxena1999/Traffic-Management-System)

---

## 🪪 License
This project is developed as part of the **DBMS Course (DBMS-V-T075)** and is intended for academic and learning purposes only.

---

⭐ **If you found this project helpful, consider starring the repo!**
