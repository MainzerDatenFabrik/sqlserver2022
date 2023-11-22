# sqlserver2022
SQL Server 2022 Demos

This GIT repository contains some demos for the SQL Server 2022 and its new features.


## Testcase 1

Im ersten Testcase werden die Feinheiten eines I/O-Freeze im Zusammenhang mit einem TSQL Snapshot Backup betrachtet. Hierbei wird deutlich, dass sich dieser Freeze hauptsächlich auf schreibende Operationen bezieht, da diese während des Freezes in einer Warteschlange abgestellt werden und mit den Beenden des Freezes durch das Snapshot Backup, ausgeführt werden. Lesende Operationen können während sich die Datenbank im Freeze befindet weiterhin ausgeführt werden.
Für den Testcase werden usp_intitializeDB und usp_suspendForSnapshot verwendet.
### usp_initializeDB
Parameterfreie PROC, um die Tabellen in der Datenbank zurückzusetzen und für die Testcases vorzubereiten.

### usp_suspendForSnapshot
Parameterfreie PROC.
Erzeugt zunächst eine Variable, die den Namen des Backupfiles im Format "TestDB1_DATUM" abbildet.
Versetzt die Datenbank in den I/O-Freeze.
Löscht geladene Seiten der Datenbank aus dem Speicher.
Prüft, ob lesende Operationen auf der Datenbank noch möglich sind.
Prüft mittels sys.dm_server_suspend_status, ob die Datenbank eingefroren ist.
Erstellt Snapshot.
