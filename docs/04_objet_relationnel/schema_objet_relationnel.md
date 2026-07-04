# Schema objet-relationnel

## MCD — entités principales

`PATIENT`, `MEDECIN`, `VISITE`, `ORDONNANCE`, `MEDICAMENT`, `FAMILLE`, `ORDONNANCE_ANALYSE`,
`TYPE_ANALYSE`, `MALADIE`, `CENTRE_SANTE`, `SEJOUR`, `OPERATION`.

Associations clés :

- `MEDECIN (0,n) — SUIT — PATIENT (1,1)` : médecin traitant.
- `MEDECIN (0,n) — EFFECTUE — VISITE (1,1)`
- `PATIENT (0,n) — CONCERNE — VISITE (1,1)`
- `VISITE (0,1) — DONNE_LIEU — ORDONNANCE (1,1)`, avec `ORDONNANCE (1,1) — PRESCRIT — MEDICAMENT (0,n)` porteuse de la posologie.
- `VISITE (0,1) — DONNE_LIEU — ORDONNANCE_ANALYSE (1,1)`, avec `ORDONNANCE_ANALYSE (1,1) — DEMANDE — TYPE_ANALYSE (0,n)` porteuse du résultat.
- `MEDICAMENT (0,n) — APPARTIENT — FAMILLE (1,1)`
- `PATIENT (0,n) — ALLERGIQUE_A — MEDICAMENT (0,n)` et `PATIENT (0,n) — ALLERGIQUE_A — FAMILLE (0,n)`
- `PATIENT (0,n) — SOUFFRE_DE — MALADIE (0,n)`
- `PATIENT (1,1) — EFFECTUE — SEJOUR (0,n)`, `CENTRE_SANTE (0,n) — ACCUEILLE — SEJOUR (1,1)`
- `SEJOUR (0,1) — CONCERNE — MALADIE (0,n)` : diagnostic principal du séjour.
- `SEJOUR (1,1) — COMPORTE — MEDICAMENT (0,n)` : traitements en cours, porteuse de posologie.
- `SEJOUR (0,n) — COMPORTE — OPERATION (0,n)` : opérations subies durant le séjour.



