# Complete Guide: Installing and Setting Up Oracle Database 21c XE

This guide provides a full walkthrough for installing Oracle Database 21c Express Edition on Windows, creating a user, and performing basic database operations.

---
## 1. Downloading Oracle XE

First, you need to get the installer from the official source.

1.  Go to the Oracle website and find the **Oracle Database 21c Express Edition (XE)** download page.
2.  Download the ZIP file for Windows.
3.  Once downloaded, extract the contents of the ZIP file to a convenient folder on your computer (e.g., `C:\oracle-installer`).

---
## 2. Installing the Database

Next, run the installation program.

1.  Navigate to the folder where you extracted the files and right-click the **`setup.exe`** file, then select "Run as administrator".
2.  Follow the on-screen prompts in the installation wizard:
    * Accept the license agreement.
    * Choose an installation destination folder (the default is usually fine).
    * You will be prompted to create a password for the administrative users (`SYS`, `SYSTEM`, etc.). **Choose a strong password and remember it.**
3.  The installer will perform a prerequisite check.
    * **If all checks pass**, click "Install" to begin the main installation.
    * **If you get an error about `ORACLE_HOME` or `TNS_ADMIN`**, proceed to the troubleshooting section below.
4.  The installation process will take several minutes. When it finishes, a summary screen will show you key connection information. Note that the Pluggable Database (PDB) is named **`XEPDB1`**. Click "Finish".

---
## 3. Troubleshooting: Environment Variable Error

If the prerequisite check fails because `ORACLE_HOME` and `TNS_ADMIN` are already set, you must remove them before proceeding.

1.  Cancel the current installation.
2.  Press the **Windows Key + R**, type **`sysdm.cpl`**, and press Enter to open System Properties.
3.  Go to the **Advanced** tab and click the **Environment Variables...** button.
4.  In **both** the "User variables" and "System variables" lists, look for variables named **`ORACLE_HOME`** and **`TNS_ADMIN`**.
5.  If you find either one, select it and click the **Delete** button.
6.  Click **OK** on all windows to save your changes.
7.  Restart your computer to ensure the changes are applied, then run the Oracle installer (`setup.exe`) again.

---
## 4. Creating Your First User

After a successful installation, the next step is to create a dedicated user for your development work.

1.  Open the Windows Command Prompt (`cmd`).
2.  Connect to the database with full administrative privileges:
    ```sql
    sqlplus / as sysdba
    ```
3.  Switch your session's context into the pluggable database, **`XEPDB1`**:
    ```sql
    ALTER SESSION SET CONTAINER = XEPDB1;
    ```
4.  Create your new user. We'll use the classic `scott` with the password `tiger` as an example:
    ```sql
    CREATE USER scott IDENTIFIED BY tiger;
    ```
5.  Grant the user the necessary permissions to connect and create database objects:
    ```sql
    GRANT CONNECT, RESOURCE, DBA TO scott;
    ```
6.  The administrative setup is complete. You can disconnect by typing:
    ```sql
    exit
    ```

---
## 5. Testing and Basic Operations

Finally, connect as your new user and perform some basic operations to confirm everything is working correctly.

1.  In a new command prompt, connect as the `scott` user using the full connection string:
    ```
    sqlplus scott/tiger@localhost/XEPDB1
    ```
2.  Once you see the `SQL>` prompt, run the following commands to create a table, add data, and create a view.

    * **Create a table:**
        ```sql
        CREATE TABLE departments (
            department_id   NUMBER PRIMARY KEY,
            department_name VARCHAR2(50)
        );
        ```
    * **Insert data:**
        ```sql
        INSERT INTO departments (department_id, department_name) VALUES (10, 'FINANCE');
        ```
    * **Create a view on the table:**
        ```sql
        CREATE VIEW departments_view AS
        SELECT department_id, department_name
        FROM departments;
        ```
    * **Query the view to see the final result:**
        ```sql
        SELECT * FROM departments_view;
        ```

If all these commands run without error, your Oracle Database is fully installed and ready for development. It is highly recommended to download and use **Oracle SQL Developer** for a more user-friendly experience.