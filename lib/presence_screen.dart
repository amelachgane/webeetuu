import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';//



//                   : ListView.builder(
//                       itemCount: listeEtudiants!.length,
//                       itemBuilder: (context, index) {
//                         final etudiant = listeEtudiants![index];
//                         return Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 3,
//                           margin: EdgeInsets.symmetric(vertical: 8),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.all(12),
//                             title: Text(
//                               "${etudiant["nom"]} ${etudiant["prenom"]}",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Text(
//                               "Statut : ${etudiant["statut"]}",
//                               style: TextStyle(
//                                 color: etudiant["statut"] == "Présent"
//                                     ? Colors.green
//                                     : Colors.red,
//                               ),
//                             ),
//                             trailing: Icon(
//                               etudiant["statut"] == "Présent"
//                                   ? Icons.check_circle
//                                   : Icons.cancel,
//                               color: etudiant["statut"] == "Présent"
//                                   ? Colors.green
//                                   : Colors.red,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

class PresenceScreen extends StatelessWidget {
  final String titre;
  final List<Map<String, String>>? listeEtudiants;
  const PresenceScreen({required this.titre, this.listeEtudiants});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD), // Fond bleu clair
      appBar: AppBar(
        title: Text("Liste des présences"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titre,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

            ),

//             Expanded(
//               child: listeEtudiants == null || listeEtudiants!.isEmpty
//                   ? Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/no_presence.png", // Image à ajouter dans assets
//                             width: 200,
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             "La séance n’a pas commencé !",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     )
            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Groupe 1",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Divider(),
                  ),
                  PresenceRow(nom: "Meliani", prenom: "Salim", statut: "Présent"),
                  PresenceRow(nom: "Meliani", prenom: "Salim", statut: "Absent"),
                  PresenceRow(nom: "Meliani", prenom: "Salim", statut: "Présent"),
                  PresenceRow(nom: "Meliani", prenom: "Salim", statut: "Absent"),
                  ListTile(
                    title: Text("Autres Groupes",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Divider(),
                  ),
                  AutreGroupeRow(nom: "Meliani", prenom: "Salim", groupe: "Groupe 4"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}

class PresenceRow extends StatelessWidget {
  final String nom;
  final String prenom;
  final String statut;

  const PresenceRow({required this.nom, required this.prenom, required this.statut});

  @override
  Widget build(BuildContext context) {
    bool isPresent = statut == "Présent";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nom),
          Text(prenom),
          Row(
            children: [
              Text(statut),
              SizedBox(width: 5),
              Icon(
                isPresent ? Icons.emoji_people : Icons.cancel,
                color: isPresent ? Colors.green : Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AutreGroupeRow extends StatelessWidget {
  final String nom;
  final String prenom;
  final String groupe;

  const AutreGroupeRow({required this.nom, required this.prenom, required this.groupe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(nom),
          Text(prenom),
          Text(groupe),
        ],
      ),
    );
  }
}
