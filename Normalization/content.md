- Key definition
Super key: 2^n-1 , all possible combination. -1 to avoid the null set
Candidate keys: minimal choosen from Super key -> {A, B, C, D} okay -> but -> {A, B, AB} -> here AB is not as not minimal. In candidate, it needs to have unique values but can have null values.
Primary key: unique and not null 

-- Finding closure
To identify candidate keys
Relations are given: alpha depermines beta. For alpha, we will have unique beta. Same alpha can not have two beta values.
Questions asked in every question:
1. What is the candiate key?
2. What are prime and non-prime aatribites
3. Convert t0 normal form

Prime attributes: part of candidate key {A, B}
Non Prime: not part of candidate key

## Normalization
- 1NF: no multivalued attributes -> (writting two or more values in single cell, separated by comma)
- 2NF: no partial depedency -> any proper subset of candidate key is determining non prime attribute, means aprt of candidate key is deteremining non prime attribute. Like candidate key is AB but in relation only B is determining C (non prime attribute), so this is partial dependency. But, if prime attribute is determining another prime attribute or non prime attribute is determining another non , then it is in 2NF
- 3NF: All prime attributes part of candiate key. Super key is on left hand side or prime attribute on right hand side
- BCNF: Super keys on left hand side. Onlu super keys are determining attributes

> Candidate key is aslo super key. But, all super keys will ahve candidate key in it. So, if we add any attribute in candidate key, it becomes super key
