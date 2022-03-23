Problem:    diet
Rows:       9
Columns:    5
Non-zeros:  25
Status:     OPTIMAL
Objective:  total_cost = 40 (MINimum)

   No.   Row name   St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 daily_necessities[CALORIES]
                    NL          2000          2000                   0.0333333 
     2 daily_necessities[PROTEIN]
                    B        104.133            50               
     3 daily_necessities[CALCIUM]
                    B        2122.73           700               
     4 max_number[BREAD]
                    NU             4                           4            -2 
     5 max_number[MILK]
                    NU             7                           7            -2 
     6 max_number[EGGS]
                    NU             2                           2      -2.33333 
     7 max_number[MEAT]
                    B              0                           3 
     8 max_number[SWEETS]
                    B       0.533333                           2 
     9 total_cost   B             40                             

   No. Column name  St   Activity     Lower bound   Upper bound    Marginal
------ ------------ -- ------------- ------------- ------------- -------------
     1 x[BREAD]     B              4             0               
     2 x[MILK]      B              7             0               
     3 x[EGGS]      B              2             0               
     4 x[MEAT]      NL             0             0                     11.3333 
     5 x[SWEETS]    B       0.533333             0               

Karush-Kuhn-Tucker optimality conditions:

KKT.PE: max.abs.err = 2.27e-13 on row 1
        max.rel.err = 5.68e-17 on row 1
        High quality

KKT.PB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

KKT.DE: max.abs.err = 8.88e-16 on column 4
        max.rel.err = 5.44e-17 on column 4
        High quality

KKT.DB: max.abs.err = 0.00e+00 on row 0
        max.rel.err = 0.00e+00 on row 0
        High quality

End of output
