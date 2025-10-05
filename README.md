# SWK5_Projektarbeit
## Projektbeschreibung
Dieses Projekt dient zur Entwicklung eines ????-Systems im Rahmen der Ausbaustufe 1 (SWK). Ziel ist es, eine einfache Datenbank mit Entitäten für ??? zu erstellen, sowie eine grundlegende Zugriffsschicht und Testdaten bereitzustellen.

## Teammitglieder
- Lukas Kastner Gruppe 2
- Jakob Müller Gruppe 2

## Build - dbManager
Das build.py-Skript muss ausgeführt werden, um die Mongo-DB-Datenbank und die Testdaten zu erstellen. Bei jeder Ausführung wird die bestehende Datenbank gelöscht und neu erstellt. Dies stellt sicher, dass alle Änderungen an den Testdaten nachvollziehbar sind und die Datenbank in einem sauberen Zustand für Tests vorliegt.

Ausführung in der CMD:
Navigiere zum Verzeichnis, in dem sich die build.py-Datei befindet. (neben dieser README) Führe in diesem Verzeichnis in der cmd aus:

```py
python build.py
```
Das erstellt die db und befüllt sie mit den notwendigen Daten für die Ausführung der Tests. Das kann durch Ausführung des Programmes mit der Bezeichnung: Program.cs in der cmd-line eingesehen werden.

## Sourcecodeverwaltung mit GitHub
### Zweck der Sourcecodeverwaltung
Für die Entwicklung dieses Projekts verwenden wir GitHub als Sourcecodeverwaltungssystem. Die Versionierung des Codes sowie die Zusammenarbeit im Team werden durch die Git- und GitHub-Funktionen erleichtert. GitHub ermöglicht uns eine strukturierte und nachvollziehbare Entwicklung des Projekts und stellt sicher, dass alle Änderungen sauber dokumentiert und bei Bedarf rückgängig gemacht werden können.

### Vorgehensweise und Git-Workflow
Es wurde vereinbart gemeinsam mittels VSC Live Share zu arbeiten wenn zeitgleiche Arbeit möglich ist und sonst auf die Workflows via Github umzusteigen. Da wir in einem Zweier-Team arbeiten, haben wir uns auf die folgenden Regeln und Prozesse für die Zusammenarbeit auf GitHub geeinigt:

### Repository erstellen und klonen
Das Hauptrepository für das Projekt wurde auf GitHub erstellt und von beiden Teammitgliedern auf die lokalen Rechner geklont. Alle Änderungen werden zunächst lokal entwickelt und danach in das zentrale Repository gepusht.

### Branching-Strategie

Der main-Branch ist der stabile Branch, der nur getestete und freigegebene Änderungen enthält.
Für die Entwicklung neuer Features oder Korrekturen verwenden wir separate Feature-Branches (z. B. feature/datenbank-anbindung oder feature/frontend-design).
Jeder arbeitet an seinem eigenen Branch und erstellt bei Abschluss der Entwicklung einen Pull Request in den main-Branch.

### Commit-Nachrichten

Wir verwenden klare und prägnante Commit-Nachrichten, die die Änderungen beschreiben (z. B. Datenbankanbindung für Feiertage hinzugefügt oder Fehler in der Routenberechnung behoben).
Dies dient der besseren Nachverfolgbarkeit und Transparenz.

## Projektstruktur

<img width="158" height="269" alt="image" src="https://github.com/user-attachments/assets/944537b2-080a-4807-8859-b6ae3f8e6803" />

### Properties
Beinhaltet projektbezogene Einstellungen, wie die Assembly-Informationen oder Konfigurationsdateien.

### Controllers
Hier befinden sich die Controller-Klassen für die API. Sie definieren die Endpunkte und steuern den Datenfluss zwischen dem Frontend und der Geschäftslogik des Projekts.

### BusinessLogic.Manager
Dieser Ordner enthält die Geschäftslogik und Manager-Klassen, die komplexe Abläufe und Verarbeitungen innerhalb des Systems implementieren.

### Dal.Ado
Hier sind die Klassen, die den Datenzugriff implementieren, um Daten aus der Datenbank abzurufen oder zu speichern.

### Dal.Common
Beinhaltet gemeinsam genutzte Komponenten für den Datenzugriff, wie Schnittstellen oder generische Klassen, die in verschiedenen 'Dao'-Implementierungen verwendet werden.

### Dto
Dient zur Definition von Data Transfer Objects. Diese Objekte werden verwendet, um Daten effizient zwischen verschiedenen Schichten des Systems zu übertragen.

### Model
Enthält die Domänenmodelle des Projekts, die die Struktur und Eigenschaften der Daten definieren, z.B. Klassen wie RouteModel oder HolidayModel.

### Program
Beinhaltet die Hauptdateien und Skripte, die zum Starten und Initialisieren des Programms verwendet werden. Typischerweise enthält es die Program.cs-Datei für den Einstiegspunkt der Anwendung.
