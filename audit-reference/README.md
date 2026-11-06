# Référentiel CarOS — structure initiale

> Initialisation documentaire, **sans audit réalisé**. Le dépôt actuel est **public** : ne pas déposer de données internes, contrats, documents non publics, informations personnelles, identifiants ni secrets.

## Principes

- Le code existant n'est pas modifié dans cette initialisation.
- Chaque exigence et règle possède un identifiant stable et une source vérifiable.
- Statuts : proposé, à confirmer, validé, remplacé, rejeté.
- Une règle proposée par IA ne devient pas une règle validée sans arbitrage humain.
- Toute évolution doit identifier les fonctionnalités concernées et les tests de non-régression.
- Les preuves sont datées et rattachées au commit exact.

## Parcours d'audit

1. Inventorier les sources documentaires, avec niveau de confidentialité.
2. Reconstituer la matrice exigences ↔ règles ↔ modules ↔ tests.
3. Contrôler les parcours transversaux et les interfaces.
4. Documenter les écarts constatés avec preuves, impacts et priorité.
5. Faire valider les corrections avant leur application.

## Arborescence

- **00_GOUVERNANCE** — Objet, périmètre, responsabilités, statuts de validation et politiques de changement.
- **01_SOURCES_ET_CDC** — Inventaire des documents sources, cahiers des charges et comptes rendus.
- **02_REGLES_METIER** — Règles métier validées, exceptions et hypothèses à confirmer.
- **03_EXIGENCES** — Exigences identifiées et critères d'acceptation.
- **04_ARCHITECTURE_ET_INTERFACES** — Architecture et contrats de données entre les modules.
- **05_DECISIONS** — Journal daté des arbitrages et validations.
- **06_TESTS_ET_PREUVES** — Tests fonctionnels, transversaux et preuves horodatées.
- **07_AUDITS_ET_ECARTS** — Rapports d'audit, dérives et plans de correction.
- **08_VERSIONS_ET_LIVRAISONS** — Correspondances commits, versions, livraisons et approbations.
- **09_DONNEES_ET_RGPD** — Schémas, traçabilité, règles RGPD ; jamais de données personnelles brutes.

## Modèle d'identification

- `CAROS-SRC-0001` : source
- `CAROS-REQ-0001` : exigence
- `CAROS-RUL-0001` : règle métier
- `CAROS-DEC-0001` : décision
- `CAROS-TST-0001` : test
- `CAROS-ECART-0001` : écart d'audit

> Pour les documents confidentiels : utiliser un **dépôt privé approuvé par l'entreprise**, conserver ici uniquement des références non sensibles.
