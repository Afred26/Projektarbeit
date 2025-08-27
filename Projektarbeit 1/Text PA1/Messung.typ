#import "@preview/supercharged-dhbw:3.4.1": *
#import "../Zusatz/acronyms.typ": acronyms

= DIN VDE 0100 Teil 600 Messung

In der #acr("DIN") #acr("VDE") 0100 Norm sind die Bestimmungen zum errichten Niederspannung Anlagen festgehalten. Die DIN VDE 0100 Norm setzt sich aus kleineren Teilgebieten zusammen:
#figure(
  caption: "Aufbau der DIN VDE 0100 Norm ",
  table(
    columns: (1fr, 80%),
    column-gutter: 0%,
    inset: 10pt,
    align: horizon,

    text("Teil 100"), text("Anwendungsbereiche"),
    text("Teil 200"), text("Begriffserklärung"),
    text("Teil 400"), text("Planen unter Berücksichtigung der erforderlichen Schutzmaßnahmen"),
    text("Teil 500"), text("Auswählen und Errichten elektrischer Betriebsmittel"),
    text("Teil 600"), text("Prüfen der elektrischen Anlage"),
    text("Teil 700"), text("Spezielle Anforderungen für Betriebsstätten, Räume und Anlagen 
    besonderer Art"),
    text("Teil 800"), text("Funktionelle Aspekte wie: Energieeffizienz, Intelligenten 
    Niederspannungsanlagen"),
    
  ),
)<table_VDE_0100_600>

== Prüfung Neuanlagen
Im folgenden Teil werden wir uns nur mit der erst Prüfung einer neuen Anlage nach #acr("DIN") #acr("VDE") 0100 Teil 600 #cite(<noauthor_din_2017>) beschäftigen.
Die Prüfung besteht aus der Sichtprüfung, der Erprobung und der Messung, wobei die Messung selbst noch mal in Durchgängigkeit des Schutzleiters, Insolationswiderstand, Schleifenimpedanz und #acr("RCD") -Prüfung unterteilt werden kann.
Prüfungen dürfen nur mit einem, nach #acr("VDE") 0413 geprüften, Messgerät durchgeführt werden.


== Sichtprüfung
Bei der Sichtprüfung wird die Anlage auf sichtbare Mängel und Fehler überprüft.
Dies umfasst die Kontrolle der korrekten Installation von Leitungen, Schaltern und anderen Komponenten.
Es wird sichergestellt, dass alle Teile ordnungsgemäß befestigt und keine sichtbaren Schäden vorhanden sind.
Die Sichtprüfung wird bereits werden der Montage der Anlage durchgeführt, da es dann am einfachste ist, Fehler zu erkennen und zu reparieren. 

== Erproben
Dieser Schritt beinhaltet das Testen der Anlage unter Betriebsbedingungen.
Hierbei wird überprüft, ob alle Betriebsmittel der Anlage korrekt funktionieren.
Die Erprobung stellt sicher, dass die Anlage unter realen Bedingungen sicher betrieben werden kann.
Beim Erproben werden einzelne Teile der Anlage nacheinander eingeschalten und auf Funktion getestet.
Es gilt äußerste Vorsicht, da noch keine der Schutzmaßnahmen überprüft wurden und kleine Fehler wie z.B. eine Sternpunktverschiebung zu großen Schäden führen kann.

== Messung
Die Messung ist ein zentraler Bestandteil der Erstprüfung nach #acr("DIN") #acr("VDE") 0100 Teil 600.
Es werden verschiedene elektrische Parameter gemessen, um die Sicherheit und Funktionalität der Anlage zu gewährleisten.
Zu den wichtigsten Messungen gehören:

=== Durchgängigkeit des Schutzleiters
Diese Messung ist das Erste, was nach der Sichtprüfung gemacht werden sollte, und ist noch vor dem Erproben zu messen.
Die Messung stellt sicher, dass alle Schutzleiter korrekt verbunden sind und einen niedrigen Widerstand aufweisen.
Ein hoher Widerstand könnte auf eine schlechte Verbindung hinweisen, die im Fehlerfall gefährlich sein könnte.
Der Messwert darf nicht wesentlich über dem Errechneten Idealwert liegen. 

=== Isolationswiderstand
Auch der Isolationswiderstand ist vor dem ersten Einschalten der Anlage zu messen.
Der Isolationswiderstand zwischen aktiven Leitern und Erde wird gemessen, um sicherzustellen, dass keine ungewollten Strompfade existieren.
Ein niedriger Isolationswiderstand könnte auf beschädigte Isolierung oder Feuchtigkeit hinweisen.
Der Grenzwert liegt zwar bei einem #acrs("M")#acrs("Ω") doch sind alle Werte, die unter dem Maximalwert des Messgerätes (meist >500#acrs("M")#acrs("Ω")) liegen auf ihre Ursache zu kontrollieren. 

=== Schleifenimpedanz
Diese Messung hilft, die Wirksamkeit der Schutzmaßnahmen im Fehlerfall zu beurteilen.
Eine niedrige Schleifenimpedanz bedeutet, dass im Fehlerfall ein hoher Fehlerstrom fließen kann, der die Sicherung schnell auslösen lässt.
Es muss geprüft werden, ob der Kurzschlussstrom größer als der Auslösestrom ist.
Der Auslösestrom hängt von der Auslösecharakteristik und dem Bemessungsstroms der Sicherung ab. 

=== RCD-Prüfung
#acrfpl("RCD") werden getestet, um sicherzustellen, dass sie bei einem Fehlerstrom korrekt auslösen.
Dies ist besonders wichtig für den Schutz von Personen vor elektrischem Schlag. Je nach Typs des #acrpl("RCD") muss die Messung etwas anders ausfallen.
Für einen #acr("RCD") des Typen A muss die Auslösezeit und der Auslösestrom mit einer Wechselspannung gemessen werden.
Die Auslösezeit darf dabei nicht über 0,3 #acr("s") liegen (im Normalfall werden Zeiten unter 0,05s erwartet).
Der Auslösestrom ist das 0,5 – 1fache des Nennauslösestroms des #acrpl("RCD") (bei einer 30#acrs("m")#acrs("A") #acr("RCD") lieget der Auslösestrom normalerweise bei ca. 21#acrs("m")#acrs("A")).
Bei einem #acr("RCD") Typ B (Allstromsensitiv) muss zusätzlich auch die Auslösung mit Gleichstrom gemessen werden, wobei die Auslösezeitz weiterhin unter 0,3#acr("s") liegt aber der Auslösestrom beim 1 – 2fachen liegt.
