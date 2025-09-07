#import "@preview/supercharged-dhbw:3.4.1": *
#import "../Zusatz/acronyms.typ": acronyms

= Fehlersuche
Währen der Praxisphase wurde eine Fehlersuche in einem Feld einer #acr("GIS") durchgeführt, da dort wiederholt die Störmeldung „#acrs("LS") #acr("SF6") min. Betriebsdruck“ auftraten. Ziel war es, durch Analyse der Ereignislisten und Signalverläufe die Ursache des Fehlers einzugrenzen, um Vorort den Fehler beheben zu können.

== Problematik
Das technische Hauptproblem des #acrlpl("UW") besteht in der wiederkehrenden Fehlermeldung „#acrs("LS") #acr("SF6") min. Betriebsdruck“, die insbesondere beim Abschalten auftritt. Das Signal sollte normalerweise zeigen, das der #acrf("LS") einen zu niedrigen Druck an dem Schutzgas #acr("SF6") und nicht mehr Schalten kann. Da die Gaskammer des #acrl("LS") aber kein Gas verliert, muss der Fehler irgendwo im Signalweg liegen. 


#figure(
 caption: "Ergebinss Ereignissverlauf",
 table(
  columns: (10%, 1fr, 1fr),
    inset: 7pt,
    align: horizon,
    table.header(
      [*Fall*],
      [*Zeit \ Fehler kommt -- Fehler geht*],
      [*Zeit \ Trenner Befehl -- Fehler kommt*],
    ),

    text("1"),
    $8,15#acr("s")$,
    $1,33#acr("s")$,

    text("2"), 
    $8,17#acr("s")$,
    $1,31#acr("s")$,

    text("3"),
    $8,17#acr("s")$,
    $1,25#acr("s")$,

    text("4"),
    $8,17#acr("s")$,
    $1,41#acr("s")$,

    text("Ø"),
    $8,16#acr("s")$,
    $1,30#acr("s")$,
  ),
)<Ereignissverlauf>

Die Analyse in @Ereignissverlauf zeigt, dass wenn der Fehler Auftritt etwa $1,30#acr("s")$ dem Schaltbefehl erscheint, was auf ein tieferliegendes Signalproblem hindeutet. Da der Fehler auch ohne Betätigung des Leistungsschalters auftritt, wird ein Zusammenhang mit der Verdrahtung ausgeschlossen und die Ursache im Bereich vor oder innerhalb des Meldemoduls vermutet.


== Lösung
Da der Fehler nicht auf eine genau Ursache zurück geführt werden kann, wurden alle Kritischen Bauteile im Signalweg ausgetauscht. Dazu gehören das Meldemodul, der Gasdichtewächter und ein Trenn-Relais. Durch diese Maßnahmen wurde der Fehler wahrscheinlich behoben, da aber keine genau Ursachen festgestellt werden konnte wurde dem Kunden empfohlen die Anlage in der nächsten Zeit zu überwachen und sich wieder zu melden, falls der Fehler erneut auftreten sollte.