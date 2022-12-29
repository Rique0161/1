(defun c:as()


(defun texto()
	
		(setvar "clayer" "CN")

		(command "mtext" ve "h" "1" "" condicao "")

		(princ)
					
)





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


(setq grupo (list))
(setq grupoexemplo (list))

	(setq cont 0)
	(setq cont2 0)
	(setq cont3 0)
	
	
	(setq teste 0)
	(setq contadorfixo 1)
	
	
	(setq lista (list))
	(setq lista2 (list))
	(setq listaenames (list))
	(setq listaenames2(list))
	(setq listastartpoint (list))
	(setq listaendpoint (list))

	
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
		
		(setq listastartpoint (cons startpoint listastartpoint))
		(setq listaendpoint (cons endpoint listaendpoint))

		(setq lista2 (cons handle lista2))
		(setq lista2 (cons handle lista2))
		
		(setq lista (cons startpoint lista))
		(setq lista (cons endpoint lista))
		
		(setq listaenames (cons pl listaenames))
		(setq listaenames (cons pl listaenames))
		
		(setq listaenames2 (cons pl listaenames2))
		
		(setq listaenames2length (length listaenames2))
		;(setq lista2length (length lista2))
		;(if (= listaenameslength (/ lista2length 2)) (print "ok")(print "n"))
		
		;(print lista)
		;(print lista2)
	
		
		(setq cont (+ cont 1))
	
	
		;-------------------------------------
		;-------------------------------------			
		
		
	)	
	
	
	(setq primeirocontador 0)
	(setq segundocontador 0)
	
	
	
	
	
	(setq listalength (length lista))
	;(print listalength)
	(setq contex 0)
	
	(while (< cont2 listalength)

		(setq cont3 0)


		(setq start (nth cont2 lista))
		
		(setq contadorsla 0)
		(setq enamestart (nth cont2 listaenames))

		(while (< cont3 listalength)
		
			(setq contv 0)
		
		
			;(setq comp (nth cont3 lista))
			
			(setq comp (nth cont3 lista))
			
			(setq enamecomp (nth cont3 listaenames))
			
			
		    (setq con (strcat (rtos cont3) ": " start " " comp))
			
			
			
			(if (/= enamestart enamecomp)
			(progn
			;(print (strcat handlestart " diferente de " handlecomp))
	
				(setq se (member start grupo))

				(if (= start comp)
					(progn
						(if (= se nil)
						(progn

							(setq grupo (cons start grupo))
							;(print grupo)
							(setq p (nth cont2 listaenames))
							(setq grupoexemplo (cons p grupoexemplo))

						)
						)

						(setq contadorsla (+ contadorsla 1))
						
						
						
						
						;(print contadorsla)
						
					)
				)

				
				
			)
			)
		
		
			
		
			(setq cont3 (+ cont3 1))
			
		)
		
		(setq grupolength (length grupo))
		(setq listastartpointlength (length listastartpoint))
		(setq lengthgrupoexemplo (length grupoexemplo))
		
		(setq contadorwhile1 0)
		(setq contadorwhile2 0)
		
		(setq cont2 (+ cont2 1))
		(setq contex (+ contex 3))

	)
	
	
	(setq contv 0)
	(setq contc 0)
		
		
	(while (< contv grupolength)
	

		(setq ve (nth contv grupo))
		
		(setq enameve (nth contv grupoexemplo))
		
		(setq contc 0)
		
		(setq contre 0)
	
		(while (< contc listalength)
		
			
	
			(setq ce (nth contc lista))
			
			
			(setq enamece (nth contc listaenames))
			
			
			(if (/= enamece enameve)
			(progn
			
			
			
				(if (= ce ve)
				(progn
					(setq contre (+ contre 1))
					;(print "ce")
					;(print enamece)
					;(print "ce")
					;(print enameve)
					
					(setq nome "reducao ")
					
						
						(defun sla()
						
						
							(setq starts (getpropertyvalue enameve "startpoint"))
							(setq ends (getpropertyvalue enameve "endpoint"))
							(setq startc (getpropertyvalue enamece "startpoint"))
							(setq endc (getpropertyvalue enamece "endpoint"))
							
							;(print starts)
							;(print ends)
							;(print startc)
							;(print endc)
							
							;(if (= ends startc)(print "ok"))
							
							(cond
								((= (strcat (rtos (nth 0 starts)) (rtos(nth 1 starts))) (strcat (rtos (nth 0 endc)) (rtos(nth 1 endc))))
								(progn
									(command "dimang" "" starts ends startc "1" "")
									(setq dang (entlast))
									(setq obj (vlax-ename->vla-object dang))
									(setq rad (vlax-get-property obj 'Measurement))
									(setq angulo (angtos rad 0))
									(print angulo)
									(entdel dang)
								)
								)
								
								((= (strcat (rtos (nth 0 ends)) (rtos(nth 1 ends))) (strcat (rtos (nth 0 endc)) (rtos(nth 1 endc))))
								(progn
									(command "dimang" "" ends starts startc "1" "")
									(setq dang (entlast))
									(setq obj (vlax-ename->vla-object dang))
									(setq rad (vlax-get-property obj 'Measurement))
									(setq angulo (angtos rad 0))
									(print angulo)
									(entdel dang)
								)
								)
								
								((= (strcat (rtos (nth 0 ends)) (rtos(nth 1 ends))) (strcat (rtos (nth 0 startc)) (rtos(nth 1 startc))))
								(progn
									(command "dimang" "" startc starts endc "1" "")
									(setq dang (entlast))
									(setq obj (vlax-ename->vla-object dang))
									(setq rad (vlax-get-property obj 'Measurement))
									(setq angulo (angtos rad 0))
									(print angulo)
									(entdel dang)
								)
								)
								
								((= (strcat (rtos (nth 0 starts)) (rtos(nth 1 starts))) (strcat (rtos (nth 0 startc)) (rtos(nth 1 startc)))) 
								(progn
									(command "dimang" "" starts ends endc "1" "")
									(setq dang (entlast))
									(setq obj (vlax-ename->vla-object dang))
									(setq rad (vlax-get-property obj 'Measurement))
									(setq angulo (angtos ( 0))
									(print angulo)
									(entdel dang)
								)
								)
							)
							)
							
							(cond
								((= (atoi angulo) 180)
								(progn
								
								
								(setq objce (vlax-ename->vla-object enamece))
								(setq layce (vlax-get-property objce 'Layer))
								(setq tipoce (substr layce 1 2))
								(setq especce (substr layce 3 9))
								(setq dnce (distof (substr layce 3 3)))
								
								
								(setq objve (vlax-ename->vla-object enameve))
								(setq layve (vlax-get-property objve 'Layer))
								(setq tipove (substr layve 1 2))
								(setq especve (substr layve 3 9))
								(setq dnve (distof (substr layve 3 3)))
								
									(if (> dnce dnve)
									(progn
										(setq condicao (strcat nome layce " " layve " " angulo))
									)(setq condicao (strcat nome layve " " layce " " angulo))
									)
									
								)
								)
								
								((/= (atoi angulo) 180)
								(progn
									
									;(setq condicao (strcat "curva " angulo))
									
									(setq objce (vlax-ename->vla-object enamece))
									(setq layce (vlax-get-property objce 'Layer))
									(setq tipoce (substr layce 1 2))
									(setq especce (substr layce 3 9))
									(setq dnce (distof (substr layce 3 3)))
									
									
									(setq objve (vlax-ename->vla-object enameve))
									(setq layve (vlax-get-property objve 'Layer))
									(setq tipove (substr layve 1 2))
									(setq especve (substr layve 3 9))
									(setq dnve (distof (substr layve 3 3)))
									
										(if (> dnce dnve)
										(progn
											(setq condicao (strcat nome layce " " angulo))
										)(setq condicao (strcat nome layve " " angulo))
										)
								

								
								
								
								)
								)
								
							)
							
							
						)
							;(sla)
							
							;(print condicao)
							
							;(print enamestart)
							;(print starts)
							;(print ends)
							;(print enamecomp)
							;(print startc)
							;(print endc)

					
					))
				
				))
				
				
				(setq contc (+ contc 1))
			
		)
		
		(print contre)
		
		(cond
			((= contre 1)
				(progn
					;(funcaodefinicao)
					(setq nome "reducao ")
					(sla)
					(texto)
				
				)
			)
			((= contre 2)
			(progn
				 
				(setq nome "te ")
				(sla)
				(texto)
			)
			
			)
		)
		
		
		(setq contv (+ contv 1))
	)
	
	
	
	
	(setq contadorderepeticoes 0)




	
		

(princ)
)

;(defun c:carr()
;(load "C:\\Users\\CALCULISTA4\\Desktop\\projeto_completo\\1\\copiadescript.lsp"))
;(defun c:carregadeleta()
;(load "C:\\Users\\CALCULISTA4\\Desktop\\projeto_completo\\1\\deleta.lsp"))