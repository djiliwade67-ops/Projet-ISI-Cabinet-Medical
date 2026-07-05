# MCD — Dossier Médical Informatisé

```mermaid
erDiagram
  MEDECIN ||--o{ PATIENT : "suit (1,1 / 0,N)"
  MEDECIN ||--o{ VISITE : "effectue (1,N / 0,N)"
  PATIENT ||--o{ VISITE : "fait (1,N / 0,N)"
  VISITE ||--o| ORDONNANCE : "genere (0,1)"
  VISITE ||--o| ORDONNANCE_ANALYSE : "prescrit (0,1)"
  ORDONNANCE ||--o{ PRESCRIPTION : "contient (1,N)"
  MEDICAMENT ||--o{ PRESCRIPTION : "inclus (0,N)"
  MEDICAMENT }o--|| FAMILLE : "appartient (1,1)"
  ORDONNANCE_ANALYSE ||--o{ DEMANDE_ANALYSE : "contient (1,N)"
  TYPE_ANALYSE ||--o{ DEMANDE_ANALYSE : "concerne (0,N)"
  PATIENT ||--o{ ALLERGIE_MEDICAMENT : "a (0,N)"
  MEDICAMENT ||--o{ ALLERGIE_MEDICAMENT : "provoque (0,N)"
  PATIENT ||--o{ ALLERGIE_FAMILLE : "a (0,N)"
  FAMILLE ||--o{ ALLERGIE_FAMILLE : "provoque (0,N)"
  PATIENT ||--o{ SOUFFRE : "diagnostique (0,N)"
  MALADIE ||--o{ SOUFFRE : "concerne (0,N)"
  PATIENT ||--o{ SEJOUR : "effectue (0,N)"
  CENTRE_SANTE ||--o{ SEJOUR : "accueille (0,N)"
  MALADIE ||--o{ SEJOUR : "motive (0,N)"
  SEJOUR ||--o{ TRAITEMENT : "inclut (0,N)"
  MEDICAMENT ||--o{ TRAITEMENT : "prescrit (0,N)"
  SEJOUR ||--o{ SEJOUR_OPERATION : "subit (0,N)"
  OPERATION ||--o{ SEJOUR_OPERATION : "realisee (0,N)"
```

## Légende des cardinalités

| Symbole | Signification |
|---|---|
| `\|\|` | Exactement 1 |
| `o\|` | 0 ou 1 |
| `o{` | 0 ou plusieurs |
| `\|{` | 1 ou plusieurs |

## Associations principales

| Association | Entité 1 | Cardinalité | Entité 2 | Signification |
|---|---|---|---|---|
| suit | MEDECIN | 1,N / 1,1 | PATIENT | Un médecin suit plusieurs patients |
| effectue | MEDECIN | 1,N / 0,N | VISITE | Un médecin effectue plusieurs visites |
| fait | PATIENT | 1,N / 0,N | VISITE | Un patient fait plusieurs visites |
| genere | VISITE | 0,1 | ORDONNANCE | Une visite génère au plus une ordonnance |
| prescrit | VISITE | 0,1 | ORDONNANCE_ANALYSE | Une visite prescrit au plus une ordonnance d'analyses |
| contient | ORDONNANCE | 1,N / 0,N | MEDICAMENT | Une ordonnance contient plusieurs médicaments |
| appartient | MEDICAMENT | 1,1 / 0,N | FAMILLE | Un médicament appartient à une famille |
| allergique | PATIENT | 0,N / 0,N | MEDICAMENT | Un patient peut être allergique à plusieurs médicaments |
| souffre | PATIENT | 0,N / 0,N | MALADIE | Un patient peut souffrir de plusieurs maladies |
| effectue | PATIENT | 0,N / 0,N | CENTRE_SANTE | Un patient peut séjourner dans plusieurs centres |
| subit | SEJOUR | 0,N / 0,N | OPERATION | Un séjour peut inclure plusieurs opérations |
