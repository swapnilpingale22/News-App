class Article {
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String imageUrl;
  final DateTime createdAt;
  final String url;
  // final String authorImageUrl;
  // final String category;
  // final String id;
  // final int views;

  const Article({
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.imageUrl,
    required this.createdAt,
    required this.url,
    // required this.authorImageUrl,
    // required this.category,
    // required this.id,
    // required this.views,
  });

  // static List<Article> articles = [
  //   Article(
  //     id: '1',
  //     title:
  //         'Kim Jong-un tot?: Diktator von Schwester hingerichtet? Behörden sprechen Klartext',
  //     subtitle:
  //         'Die Gerüchte über Kim Jong-uns angeblichen Tod halten sich hartnäckig. Nun haben sich erstmals die Behörden zu den wilden Verschwörungstheorien geäußert.',
  //     body:
  //         'Es sind irre Verschwörungstheorien, die aktuell über Nordkoreas Machthaber Kim Jong-un verbreitet werden. Von Kims vermeintlichem Tod bis hin zu einem heimlichen Doppelgänger war da berichtet worden. Zuletzt wurde zudem behauptet, Kim Jong-un sei von seiner Schwester Kim Yo-jong ermordet worden.',
  //     author: 'SBA News, Germany.',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 1204,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1520452112805-c6692c840af0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=780&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
  //   ),
  //   Article(
  //     id: '2',
  //     title: 'Pandemie: Lauterbach erwartet mehr Corona-Ausbrüche in Schulen',
  //     subtitle:
  //         'Der Mediziner und SPD-Politiker Karl Lauterbach geht davon aus, dass die Infektionszahlen bei Schülerinnen und Schülern nach den Herbstferien deutlich steigen werden. Dafür sieht er einen simplen Grund.',
  //     body:
  //         'Der Mediziner und SPD-Politiker Karl Lauterbach geht davon aus, dass die Infektionszahlen bei Schülerinnen und Schülern nach den Herbstferien deutlich steigen werden. Dafür sieht er einen simplen Grund. Berlin - SPD-Gesundheitspolitiker Karl Lauterbach warnt vor stark steigenden Corona-Infektionszahlen bei Kindern. Wir werden nach den Herbstferien deutlich mehr Ausbrüche in den Schulen erleben, weil die Kinder nicht mehr lange lüften können',
  //     author: 'Insuedthueringen',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 1800,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1589262804704-c5aa9e6def89?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 8)),
  //   ),
  //   Article(
  //     id: '3',
  //     title:
  //         'Bilanţ. O lună cu Florin Cîţu la şefia PNL: Guvernul a fost demis, şefia Camerei, pierdută, partidul negociază cu PSD, iar Orban pregăteşte ruperea formaţiunii',
  //     subtitle:
  //         'Florin Cîţu câştiga în urmă cu o lună şefia PNL. În 30 de zile, Guvernul pe care îl conducea a fost demis, PNL a rămas fără funcţia de preşedinte al Camerei, după demisia lui Ludovic Orban, liberalii negociază în primul rând cu PSD pentru susţinerea Guvernului Ciucă',
  //     body:
  //         'Eine Abschaffung der Kirchensteuer ist nach Angaben des baden-württembergischen Ministerpräsidenten Winfried Kretschmann kein Thema für die geplante Ampelkoalition. Natürlich gibt es Laizisten, die sich über die Kirchensteuer aufregen, die sie selbst gar nicht bezahlen müssen, sagte der Grünen-Politiker der Herder Korrespondenz (Novemberausgabe). Wir haben aber wirklich andere Probleme, als uns an solchen Fragen abzuarbeiten. Das werden wir nicht machen. Außerdem sind dafür die Länder zuständig. Die Kirchensteuer sei eine Dienstleistung des Staates - und die wird auch bleiben. SPD , Grüne und FDP wollen Mitte Dezember eine gemeinsame Bundesregierung bilden. ',
  //     author: 'Augsburger Allgemeine',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 840,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1541726260-e6b6a6a08b27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 2)),
  //   ),
  //   Article(
  //     id: '4',
  //     title:
  //         'Elections Ontario asked to divulge MPP complaints that could muzzle community groups',
  //     subtitle:
  //         'Housing Minister Steve Clark asked for probe into actions of three groups under new election finances law.',
  //     body:
  //         'Es sind irre Verschwörungstheorien, die aktuell über Nordkoreas Machthaber Kim Jong-un verbreitet werden. Von Kims vermeintlichem Tod bis hin zu einem heimlichen Doppelgänger war da berichtet worden. Zuletzt wurde zudem behauptet, Kim Jong-un sei von seiner Schwester Kim Yo-jong ermordet worden.',
  //     author: 'Thestar',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 340,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1616891722751-88755e4b44aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 1)),
  //   ),
  //   Article(
  //     id: '5',
  //     title: 'No halt to coal power feasibility study',
  //     subtitle:
  //         'Mit einem Großaufgebot hat die Polizei am Sonntag das Nordderby in der 2. Fußball-Bundesliga zwischen Tabellenführer FC St. Pauli und dem FC Hansa Rostock gesichert. Im Einsatz waren mehrere Hundertschaften aus Hamburg und anderen Bundesländern sowie der Bundespolizei. Einige Rostocker Fans waren mi',
  //     body:
  //         'Prime Minister Scott Morrison has left the door open for a new coal-fired power station in Queensland, despite endorsing a new climate policy. Launching his plan to achieve net-zero emissions by 2050 on Tuesday, Mr Morrison was asked about a feasibility study being conducted into a proposed coal-fired plant in Collinsville. He said the study was due to be completed in June 2022. Any investments that people wish to make, well they have to meet the necessary planning and other regulatory approvals for them to go ahead, Mr Morrison told reporters in Canberra.',
  //     author: 'Paul Osborne',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10s',
  //     category: 'Politics',
  //     views: 2215,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1447727214830-cbcbf097b52c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 4)),
  //   ),
  //   Article(
  //     id: '1',
  //     title:
  //         'Kim Jong-un tot?: Diktator von Schwester hingerichtet? Behörden sprechen Klartext',
  //     subtitle:
  //         'Die Gerüchte über Kim Jong-uns angeblichen Tod halten sich hartnäckig. Nun haben sich erstmals die Behörden zu den wilden Verschwörungstheorien geäußert.',
  //     body:
  //         'Es sind irre Verschwörungstheorien, die aktuell über Nordkoreas Machthaber Kim Jong-un verbreitet werden. Von Kims vermeintlichem Tod bis hin zu einem heimlichen Doppelgänger war da berichtet worden. Zuletzt wurde zudem behauptet, Kim Jong-un sei von seiner Schwester Kim Yo-jong ermordet worden.',
  //     author: 'SBA News, Germany.',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 1204,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1520452112805-c6692c840af0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=780&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
  //   ),
  //   Article(
  //     id: '2',
  //     title: 'Pandemie: Lauterbach erwartet mehr Corona-Ausbrüche in Schulen',
  //     subtitle:
  //         'Der Mediziner und SPD-Politiker Karl Lauterbach geht davon aus, dass die Infektionszahlen bei Schülerinnen und Schülern nach den Herbstferien deutlich steigen werden. Dafür sieht er einen simplen Grund.',
  //     body:
  //         'Der Mediziner und SPD-Politiker Karl Lauterbach geht davon aus, dass die Infektionszahlen bei Schülerinnen und Schülern nach den Herbstferien deutlich steigen werden. Dafür sieht er einen simplen Grund. Berlin - SPD-Gesundheitspolitiker Karl Lauterbach warnt vor stark steigenden Corona-Infektionszahlen bei Kindern. Wir werden nach den Herbstferien deutlich mehr Ausbrüche in den Schulen erleben, weil die Kinder nicht mehr lange lüften können',
  //     author: 'Insuedthueringen',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 1800,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1589262804704-c5aa9e6def89?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 8)),
  //   ),
  //   Article(
  //     id: '3',
  //     title:
  //         'Bilanţ. O lună cu Florin Cîţu la şefia PNL: Guvernul a fost demis, şefia Camerei, pierdută, partidul negociază cu PSD, iar Orban pregăteşte ruperea formaţiunii',
  //     subtitle:
  //         'Florin Cîţu câştiga în urmă cu o lună şefia PNL. În 30 de zile, Guvernul pe care îl conducea a fost demis, PNL a rămas fără funcţia de preşedinte al Camerei, după demisia lui Ludovic Orban, liberalii negociază în primul rând cu PSD pentru susţinerea Guvernului Ciucă',
  //     body:
  //         'Eine Abschaffung der Kirchensteuer ist nach Angaben des baden-württembergischen Ministerpräsidenten Winfried Kretschmann kein Thema für die geplante Ampelkoalition. Natürlich gibt es Laizisten, die sich über die Kirchensteuer aufregen, die sie selbst gar nicht bezahlen müssen, sagte der Grünen-Politiker der Herder Korrespondenz (Novemberausgabe). Wir haben aber wirklich andere Probleme, als uns an solchen Fragen abzuarbeiten. Das werden wir nicht machen. Außerdem sind dafür die Länder zuständig. Die Kirchensteuer sei eine Dienstleistung des Staates - und die wird auch bleiben. SPD , Grüne und FDP wollen Mitte Dezember eine gemeinsame Bundesregierung bilden. ',
  //     author: 'Augsburger Allgemeine',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 840,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1541726260-e6b6a6a08b27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 2)),
  //   ),
  //   Article(
  //     id: '4',
  //     title:
  //         'Elections Ontario asked to divulge MPP complaints that could muzzle community groups',
  //     subtitle:
  //         'Housing Minister Steve Clark asked for probe into actions of three groups under new election finances law.',
  //     body:
  //         'Es sind irre Verschwörungstheorien, die aktuell über Nordkoreas Machthaber Kim Jong-un verbreitet werden. Von Kims vermeintlichem Tod bis hin zu einem heimlichen Doppelgänger war da berichtet worden. Zuletzt wurde zudem behauptet, Kim Jong-un sei von seiner Schwester Kim Yo-jong ermordet worden.',
  //     author: 'Thestar',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 340,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1616891722751-88755e4b44aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 1)),
  //   ),
  //   Article(
  //     id: '5',
  //     title: 'No halt to coal power feasibility study',
  //     subtitle:
  //         'Mit einem Großaufgebot hat die Polizei am Sonntag das Nordderby in der 2. Fußball-Bundesliga zwischen Tabellenführer FC St. Pauli und dem FC Hansa Rostock gesichert. Im Einsatz waren mehrere Hundertschaften aus Hamburg und anderen Bundesländern sowie der Bundespolizei. Einige Rostocker Fans waren mi',
  //     body:
  //         'Prime Minister Scott Morrison has left the door open for a new coal-fired power station in Queensland, despite endorsing a new climate policy. Launching his plan to achieve net-zero emissions by 2050 on Tuesday, Mr Morrison was asked about a feasibility study being conducted into a proposed coal-fired plant in Collinsville. He said the study was due to be completed in June 2022. Any investments that people wish to make, well they have to meet the necessary planning and other regulatory approvals for them to go ahead, Mr Morrison told reporters in Canberra.',
  //     author: 'Paul Osborne',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10s',
  //     category: 'Politics',
  //     views: 2215,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1447727214830-cbcbf097b52c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 4)),
  //   ),
  //   Article(
  //     id: '1',
  //     title:
  //         'Kim Jong-un tot?: Diktator von Schwester hingerichtet? Behörden sprechen Klartext',
  //     subtitle:
  //         'Die Gerüchte über Kim Jong-uns angeblichen Tod halten sich hartnäckig. Nun haben sich erstmals die Behörden zu den wilden Verschwörungstheorien geäußert.',
  //     body:
  //         'Es sind irre Verschwörungstheorien, die aktuell über Nordkoreas Machthaber Kim Jong-un verbreitet werden. Von Kims vermeintlichem Tod bis hin zu einem heimlichen Doppelgänger war da berichtet worden. Zuletzt wurde zudem behauptet, Kim Jong-un sei von seiner Schwester Kim Yo-jong ermordet worden.',
  //     author: 'SBA News, Germany.',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 1204,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1520452112805-c6692c840af0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=780&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
  //   ),
  //   Article(
  //     id: '2',
  //     title: 'Pandemie: Lauterbach erwartet mehr Corona-Ausbrüche in Schulen',
  //     subtitle:
  //         'Der Mediziner und SPD-Politiker Karl Lauterbach geht davon aus, dass die Infektionszahlen bei Schülerinnen und Schülern nach den Herbstferien deutlich steigen werden. Dafür sieht er einen simplen Grund.',
  //     body:
  //         'Der Mediziner und SPD-Politiker Karl Lauterbach geht davon aus, dass die Infektionszahlen bei Schülerinnen und Schülern nach den Herbstferien deutlich steigen werden. Dafür sieht er einen simplen Grund. Berlin - SPD-Gesundheitspolitiker Karl Lauterbach warnt vor stark steigenden Corona-Infektionszahlen bei Kindern. Wir werden nach den Herbstferien deutlich mehr Ausbrüche in den Schulen erleben, weil die Kinder nicht mehr lange lüften können',
  //     author: 'Insuedthueringen',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 1800,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1589262804704-c5aa9e6def89?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 8)),
  //   ),
  //   Article(
  //     id: '3',
  //     title:
  //         'Bilanţ. O lună cu Florin Cîţu la şefia PNL: Guvernul a fost demis, şefia Camerei, pierdută, partidul negociază cu PSD, iar Orban pregăteşte ruperea formaţiunii',
  //     subtitle:
  //         'Florin Cîţu câştiga în urmă cu o lună şefia PNL. În 30 de zile, Guvernul pe care îl conducea a fost demis, PNL a rămas fără funcţia de preşedinte al Camerei, după demisia lui Ludovic Orban, liberalii negociază în primul rând cu PSD pentru susţinerea Guvernului Ciucă',
  //     body:
  //         'Eine Abschaffung der Kirchensteuer ist nach Angaben des baden-württembergischen Ministerpräsidenten Winfried Kretschmann kein Thema für die geplante Ampelkoalition. Natürlich gibt es Laizisten, die sich über die Kirchensteuer aufregen, die sie selbst gar nicht bezahlen müssen, sagte der Grünen-Politiker der Herder Korrespondenz (Novemberausgabe). Wir haben aber wirklich andere Probleme, als uns an solchen Fragen abzuarbeiten. Das werden wir nicht machen. Außerdem sind dafür die Länder zuständig. Die Kirchensteuer sei eine Dienstleistung des Staates - und die wird auch bleiben. SPD , Grüne und FDP wollen Mitte Dezember eine gemeinsame Bundesregierung bilden. ',
  //     author: 'Augsburger Allgemeine',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 840,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1541726260-e6b6a6a08b27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 2)),
  //   ),
  //   Article(
  //     id: '4',
  //     title:
  //         'Elections Ontario asked to divulge MPP complaints that could muzzle community groups',
  //     subtitle:
  //         'Housing Minister Steve Clark asked for probe into actions of three groups under new election finances law.',
  //     body:
  //         'Es sind irre Verschwörungstheorien, die aktuell über Nordkoreas Machthaber Kim Jong-un verbreitet werden. Von Kims vermeintlichem Tod bis hin zu einem heimlichen Doppelgänger war da berichtet worden. Zuletzt wurde zudem behauptet, Kim Jong-un sei von seiner Schwester Kim Yo-jong ermordet worden.',
  //     author: 'Thestar',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10',
  //     category: 'Politics',
  //     views: 340,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1616891722751-88755e4b44aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 1)),
  //   ),
  //   Article(
  //     id: '5',
  //     title: 'No halt to coal power feasibility study',
  //     subtitle:
  //         'Mit einem Großaufgebot hat die Polizei am Sonntag das Nordderby in der 2. Fußball-Bundesliga zwischen Tabellenführer FC St. Pauli und dem FC Hansa Rostock gesichert. Im Einsatz waren mehrere Hundertschaften aus Hamburg und anderen Bundesländern sowie der Bundespolizei. Einige Rostocker Fans waren mi',
  //     body:
  //         'Prime Minister Scott Morrison has left the door open for a new coal-fired power station in Queensland, despite endorsing a new climate policy. Launching his plan to achieve net-zero emissions by 2050 on Tuesday, Mr Morrison was asked about a feasibility study being conducted into a proposed coal-fired plant in Collinsville. He said the study was due to be completed in June 2022. Any investments that people wish to make, well they have to meet the necessary planning and other regulatory approvals for them to go ahead, Mr Morrison told reporters in Canberra.',
  //     author: 'Paul Osborne',
  //     authorImageUrl:
  //         'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=10s',
  //     category: 'Politics',
  //     views: 2215,
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1447727214830-cbcbf097b52c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fHBvbGl0aWNzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  //     createdAt: DateTime.now().subtract(const Duration(hours: 4)),
  //   ),
  // ];

  // @override
  // List<Object?> get props => [
  //       title,
  //       subtitle,
  //       body,
  //       author,
  //       imageUrl,
  //       createdAt,
  //       url,
  //       // id,
  //       // authorImageUrl,
  //       // category,
  //     ];
}
