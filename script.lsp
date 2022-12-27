(defun c:teste()

(setvar "cmdecho" 0)
(vl-load-com)


(setq todaspolylines (ssget "X" '((0 . "LWPOLYLINE"))))

(setq contadordex 0)
(setq contadordey 0)
(setq plines (ssadd))

(setq pllength (sslength todaspolylines))


(while (< contadordex pllength)

	(setq ent (ssname todaspolylines contadordex))
	(setq obj (vlax-ename->vla-object ent))
	(setq lay (vlax-get-property obj 'Layer))


	(if (or (= lay "LP050-PN040") (= lay "LP075-PN040") (= lay "LP100-PN040") (= lay "LP125-PN060"))
		(progn

			(ssadd ent plines)
			(setq entplines (ssname plines contadordex))


		)
	)
	
	(setq contadordex (+ contadordex 1))
)
(setq pllength (sslength plines))


;(print pllength)


(setq grupo (list))

		(setq cont 0)
		(setq cont2 (1- (* pllength 2)))
		(setq cont3 (1- (* pllength 2)))
		(setq cont4 0)
		(setq teste 0)
		(setq contadorfixo 1)
		
		
		(setq lista (list))
		(setq lista2 (list))
		
		(while (< cont pllength)
		
		
			
			(setq PL (ssname plines cont))
			
			(setq startpoint (getpropertyvalue PL "startpoint"))
			
			;-------------------------------------------------------
			
			(setq endpoint (getpropertyvalue PL "endpoint"))
			
			(setq handle (getpropertyvalue PL "handle"))

			(setq lista2 (cons handle lista2))
			(setq lista2 (cons handle lista2))
			(setq lista (cons startpoint lista))
			(setq lista (cons endpoint lista))
			
			;(print lista)
			;(print lista2)
			
			(setq cont (+ cont 1))
		
		
			;-------------------------------------
			;-------------------------------------			
			
			
		)	
		
		(while (/= cont2 0)

			(setq cont3 (1- (* pllength 2)))

			(setq start (nth cont2 lista))

			(setq handlestart (nth cont2 lista2))

			(while (/= cont3  0)
			
			
			
			
				(setq comp (nth cont3 lista))
				;(print cont3)			
				(setq handlecomp (nth cont3 lista2))
				
				
				(setq sl1 (rtos (nth 0 start)))
				(setq sl2 (rtos (nth 1 start)))
				(setq start1 (strcat sl1 " " sl2))
				(setq cl1 (rtos (nth 0 comp)))
				(setq cl2 (rtos (nth 1 comp)))
				(setq comp1 (strcat cl1 " " cl2))
				
			(setq con (strcat (rtos cont3) ": " start1 " " comp1))
				;(print con)
				
				
				(if (/= handlestart handlecomp)
				(progn
				;(print (strcat handlestart " diferente de " handlecomp))
				
					(setq pc (nth 0 start))

					(setq se (member start grupo))
					;(print se)
					(if (/= se nil) (setq contadorfixo (+ contadorfixo 1)))
					;(print "contador fixo")
					;(print contadorfixo)
					

					;(print con)

					
					
					(if (= se nil)
						(progn
						
							(if (= start1 comp1)
							(progn
							;(print strcat start " = " comp)
							;(print con)
								(setq grupo (cons start grupo))
								;(print "if")
								;(print grupo)
								;(print "----------------")
							)
							)
						)
					)
					
					
				)
				)
			
			
				(setq cont3 (- cont3 1))
				
			)
			
			(setq cont2 (- cont2 1))

		)
		
		
		
		(defun texto()

			(setq teste1 1)

			(setq grupolength (length grupo))
			;(print grupo)
			
			(repeat grupolength
				
				(setq p1 (nth cont4 grupo))
				(setq t1 (rtos (nth 0 p1) 2 12))
				(setq t2 (rtos (nth 1 p1) 2 12))
				(setq t3 (rtos (nth 2 p1) 2 12))
				(setq stri (strcat t1 ", " t2 ", " t3))
				;(print stri)
				(command "mtext" p1 "h" "4" "" (rtos teste1) "")
				(print cont4)
				
				(setq cont4 (+ cont4 1))
				
				(princ)
				
				(setq teste1 (+ teste1 1))

			
			)
		)
		
		(texto)
		

(princ)
)
