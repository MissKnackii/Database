3) Requêtes
	1/
SELECT nom, prenom, adresse, ville 
FROM employe
WHERE nom like 'D%' and (ville='Seattle' or ville='London')
ORDER BY nom ASC

	2/
SELECT nom, prenom, fonction, 'Est chef' as type
FROM employe 
WHERE superieurhierarchique is null

	3/
SELECT com.commandeID, cli.nomsociete,to_char(com.datecommande, 'dd/MM/YYYY'), fraisports/1.2 as "frais de port en euros"
FROM commande as com
	JOIN client as cli ON com.ClientID = cli.ClientID

	4/
SELECT e.nom, e.prenom, e.fonction, sup.nom as "Nom superieur", sup.fonction as "fonction superieur"
FROM employe as e
	JOIN employe as sup ON e.superieurhierarchique = sup.employeID

	5/
SELECT e.nom, e.prenom,to_char(e.datenaissance, 'dd/MM/YYYY'), sup.nom as "Nom superieur", sup.prenom as "Prenom superieur", to_char(sup.datenaissance, 'dd/MM/YYYY') as "Date naiss. sup hier."
FROM employe as e
	JOIN employe as sup ON e.superieurhierarchique = sup.employeID
WHERE sup.datenaissance > e.datenaissance

	6/
SELECT nomsociete
FROM client as cli
	JOIN commande as com ON cli.clientid = com.clientid
	JOIN lignescommande as lc ON com.commandeID = lc.commandeID
	JOIN produit as p ON lc.produitid = p.produitid
	JOIN fournisseur as f ON p.fournisseurid = f.fournisseurid
WHERE f.nomfournisseur = 'Exotic Liquids'