(defun c:q()

	(setq conex (ssget "X" '((8 . "cn"))))
	
	(setq conexlength (sslength conex))
	(setq i 0)
	(setq grupocurvas (list))
	(setq grupotes (list))
	(setq gruporeducoes (list))
	
	(while (< i conexlength)
	
		(setq ent (ssname conex i))
		
		(setq texto (getpropertyvalue ent "Text"))
		
		(setq 
		
		(cond
			((= texto "reducao")
				
			)
			
			((= texto "reducao")
			
			)
			
			((= texto "reducao")
			
			
			)
		
		)
		
		(setq i (+ i 1))
		
	)
)

)