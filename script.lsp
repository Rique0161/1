(defun c:as()

(setvar "cmdecho" 0)
(vl-load-com)


(setq arq1 "C:\\Users\\CALCULISTA4\\Desktop\\projeto_completo\\1\\analise_de_dados-senao.txt")
(setq edit (open arq1 "w"))
(close edit)

(setq arq2 "C:\\Users\\CALCULISTA4\\Desktop\\projeto_completo\\1\\analise_de_dados-grupo.txt")
(setq edit (open arq2 "w"))
(close edit)



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
	(setq cont2 0)
	(setq cont3 0)
	(setq cont4 0)
	(setq teste 0)
	(setq contadorfixo 1)
	
	
	(setq lista (list))
	(setq lista2 (list))
	
	(while (< cont pllength)
	
	
		
		(setq PL (ssname plines cont))
		
		(setq startpoint (getpropertyvalue PL "startpoint"))
		;(print startpoint)
		
		(setq x (rtos (nth 0 startpoint)))
		(setq y (rtos (nth 1 startpoint)))
		(setq z (rtos (nth 2 startpoint)))
		(setq startpoint (strcat x ", " y ", " z))
		;(print startpoint)
		
		;-------------------------------------------------------
		
		(setq endpoint (getpropertyvalue PL "endpoint"))
		;(print endpoint)
		
		(setq x (rtos (nth 0 endpoint)))
		(setq y (rtos (nth 1 endpoint)))
		(setq z (rtos (nth 2 endpoint)))
		(setq endpoint (strcat x ", " y ", " z))
		;(print endpoint)
		
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
	
	(setq listalength (length lista))
	(print listalength)
	(setq contex 0)
	
	(while (< cont2 listalength)

		(setq cont3 0)


		(setq start (nth cont2 lista))
		;(setq s2 (nth  (+ contex 1) lista))
		;(setq s3 (nth  (+ contex 2) lista))
		;(setq start (strcat s1 " " s2 " " s3))
		;(print start)
		

		(setq handlestart (nth cont2 lista2))

		(while (< cont3 listalength)
		
		
		
		
			;(setq comp (nth cont3 lista))
			
			(setq comp (nth cont3 lista))
			;(setq c2 (nth  (+ cont3 1) lista))
			;(setq c3 (nth  (+ cont3 2) lista))
			;(setq start (strcat s1 " " s2 " " s3))
				;(print cont3)			
			(setq handlecomp (nth cont3 lista2))
			
			
			;(setq sl1 (rtos (nth 0 start)))
			;(setq sl2 (rtos (nth 1 start)))
			;(setq start1 (strcat sl1 " " sl2))
			;(setq cl1 (rtos (nth 0 comp)))
			;(setq cl2 (rtos (nth 1 comp)))
			;(setq comp1 (strcat cl1 " " cl2))
			
		    (setq con (strcat (rtos cont3) ": " start " " comp))
			;(print con)
			
			
			;(setq edit (open arq "a"))
			;(write-line con edit)
			;(close edit)
			
			
			
			(if (/= handlestart handlecomp)
			(progn
			;(print (strcat handlestart " diferente de " handlecomp))
			
				;(setq pc (nth 0 start))
				;(print start)
				;(print comp)
				(setq se (member start grupo))
				;(print se)
				(if (/= se nil) (setq contadorfixo (+ contadorfixo 1)))
				;(print "contador fixo")
				;(print contadorfixo)
				

				;(print con)

				
				
				(if (= se nil)
					(progn
							(setq edit (open arq1 "a"))
							(write-line con edit)
							(close edit)
					
						(if (= start comp)
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
		
		
			(setq cont3 (+ cont3 1))
			
		)
		
		(setq cont2 (+ cont2 1))
		(setq contex (+ contex 3))

	)
	
	(setq grupolength (length grupo))
	
	;(setq grupo2 (list))
	;(setq cont 0)
	;(while (< cont grupolength)
		
	;	(setq ent (nth cont grupo))
	;	(print ent)
	;	(setq se (member ent grupo2))
	;	(print se)
		
	;	(if (= se nil)
	;	(progn
	;		(setq grupo2 (cons ent grupo2))
	;		(print grupo2)
	;		(setq grupo2length (length grupo2))
	;		(print grupo2length)
	;	)
	;	)
	;	(setq cont (+ cont 1))
		
	;)



	
	(defun texto()

		(setq teste1 1)

		;(print grupo)
		
		(repeat grupolength
			
			(setq p1 (nth cont4 grupo))
			;(setq t1 (rtos (nth 0 p1) 2 12))
			;(setq t2 (rtos (nth 1 p1) 2 12))
			;(setq t3 (rtos (nth 2 p1) 2 12))
			;(setq stri (strcat t1 ", " t2 ", " t3))
			;(print stri)
			(command "mtext" p1 "h" "2" "" (rtos teste1) "")
			;(print cont4)
			
			(setq cont4 (+ cont4 1))
			
			(princ)
		
			
		
			
			
			(setq teste1 (+ teste1 1))
			
			

		
		)
	)
	
	(texto)
	
	(defun sla()
		(setq cont 0)
		(setq grupolength (length grupo))
		(while (< cont grupolength)
			(setq ent (nth cont grupo))
			(setq x (rtos (nth 0 ent)) y (rtos (nth 1 ent)))

			(setq edit (open arq2 "a"))
			(write-line (strcat (rtos (+ cont 1)) ": " x ", " y) edit)
			(close edit)
			(setq cont (+ cont 1))
			
		)
	)
		

(princ)
)
