(defun c:deleta()
	(setq TEXTOS (ssget "X" '((0 . "MTEXT"))))
	
	
	(setq LENGTH-TEXT (sslength TEXTOS))
	(setq i 0)
	(while (< i LENGTH-TEXT)
	
		(setq TEXTO (ssname TEXTOS i))
		
		(ENTDEL TEXTO)
		
		(setq i (+ i 1))
		
	)
)

;(defun c:carregadeleta()
;(load "D:\\HENRIQUE\\LISP\\EXERCICIOS_LISP\\EXERCICIO_2\\deleta.lsp")
;)