# 🕵️ Forensic Murder Case EDA — SQL Investigation

## 📌 Project Title: *"Who Killed Roland Greene?"*

As a **Forensic Data Analyst at the FBU**, you are tasked with investigating the suspicious death of Roland Greene — a famous art collector — who was found dead in the **Vault Room** at 8:00 PM, shortly after receiving a call at **7:55 PM**. Although all guests claimed to have alibis, one is lying. Your mission: uncover the truth using data.

---

## 🧠 Problem Statement

> Roland Greene was murdered during a private estate auction attended by 30 guests. He received a call around **19:55**, and was found dead 5 minutes later. Using forensic data, you're to:
>
> 1. Determine **who killed Roland Greene**
> 2. Identify **prime suspects and explain why**

---

## 🗂️ Datasets Used

- **Suspects List**
- **Access Logs**
- **Call Records**
- **Forensic Timeline**

📁 Dataset Source: [Google Drive Folder](https://drive.google.com/folderview?id=1SD_VuBZjQLO_W49lCvNiI3tdHg5qBvWe)

---

## 🛠 Tools Used

- Microsoft SQL Server
- T-SQL (CTEs, Joins, Filters, etc.)
- Exploratory Data Analysis (EDA)
- Deductive Reasoning

---

## 📊 Analytical Approach

The investigation followed these key steps:

1. **Filtered access logs** for successful entries into the Vault Room.
2. Identified **8 suspects** who accessed the room successfully.
3. Joined with suspect details to narrow down those who entered **before 8PM**.
4. Correlated **call logs** with access times to identify suspicious patterns.
5. Referenced the **forensic timeline** for supporting evidence.

---

## 🔍 Key Findings

### 👤 Prime Suspects

- **Morgan Bennett**
- **Samira Shaw**
- **Victor Shaw**
- **Robin Ahmed**

> These individuals accessed the Vault Room **before 8:00 PM** and **no record** suggests they exited before the murder. That made them the top suspects.

### 💀 Likely Murderer

> **🛑 Samira Shaw** is the primary suspect.

**Evidence:**
- Samira made a call at **19:51:36** lasting **9 minutes**.
- Her **Vault Room access time** was **19:52:36** — during the call.
- This implies she was on the call **inside the Vault Room** when the murder occurred at 8:00 PM.

This overlap of call duration and room access places her directly at the crime scene at the critical moment.

---

## 📁 Repository Structure

├── README.md # This file
├── forensic_analysis.sql # SQL script containing all queries and analysis steps
├── summary&object.txt # Problem statement and project background
└── Dataset


---

## 🏁 Conclusion

This project demonstrates the power of **SQL-based exploratory data analysis** in solving real-world problems — even a murder mystery. Using timestamp filters, relational joins, and investigative reasoning, we narrowed the pool of suspects and uncovered key behavioral clues from the data.

---

## 🚀 How to Use

1. Download or clone the repo.
2. Load the dataset into Microsoft SQL Server.
3. Run `forensic_analysis.sql` to perform the full investigation.
4. Examine the query results and conclusions in the script comments.

---

