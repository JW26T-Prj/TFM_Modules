 t f m . e x e c . d i s a b l e A u t o N e w G a m e ( t r u e )  
 t f m . e x e c . d i s a b l e A u t o S h a m a n ( t r u e )  
 t f m . e x e c . d i s a b l e A f k D e a t h ( t r u e )  
 t f m . e x e c . d i s a b l e P h y s i c a l C o n s u m a b l e s ( t r u e )  
 t f m . e x e c . d i s a b l e D e b u g C o m m a n d ( t r u e )  
 t f m . e x e c . n e w G a m e ( " @ 7 6 0 1 7 6 8 " )  
 x m l 2 = ' '  
 r u n _ t i m e = 0  
 f u n c t i o n   e v e n t N e w P l a y e r ( n a m e )  
 	 t f m . e x e c . r e s p a w n P l a y e r ( n a m e )  
 	 u i . s e t M a p N a m e ( " < f o n t   c o l o r = ' # 1 4 A C E E ' > < f o n t   s i z e = ' 1 2 ' > T h e   M a s t e r   P o o l   5 . 2   -   A d v a n c e d   L U A   M a p   m a d e   b y   < b > A u r e l i a n l u a # 0 0 0 0 < / b > < " )  
 e n d  
 f u n c t i o n   e v e n t P l a y e r D i e d ( n a m e )  
 	 e v e n t N e w P l a y e r ( n a m e )  
 e n d  
 f u n c t i o n   e v e n t N e w G a m e ( )  
 	 x m l 2 = t f m . g e t . r o o m . x m l M a p I n f o . x m l  
 e n d  
 f u n c t i o n   e v e n t L o o p ( )  
 	 i f   r u n _ t i m e   < =   3 . 5   t h e n  
 	 	 r u n _ t i m e = r u n _ t i m e + 0 . 5  
 	 	 i f   r u n _ t i m e   > =   4   t h e n  
 	 	 	 t f m . e x e c . n e w G a m e ( x m l 2 )  
 	 	 	 u i . s e t M a p N a m e ( " < f o n t   c o l o r = ' # 1 4 A C E E ' > < f o n t   s i z e = ' 1 2 ' > T h e   M a s t e r   P o o l   5 . 2   -   A d v a n c e d   L U A   M a p   m a d e   b y   < b > A u r e l i a n l u a # 0 0 0 0 < / b > < " )  
 	 	 e n d  
 	 e n d  
 	 f o r   n a m e , p l a y e r   i n   p a i r s ( t f m . g e t . r o o m . p l a y e r L i s t )   d o  
 	 	 i f   t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . y   >   8 0 0   t h e n  
 	 	 	 	 t f m . e x e c . d i s p l a y P a r t i c l e ( 1 4 , t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . x + 1 6 , t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . y - 1 5 , 0 , - 0 . 6 , 0 , - 0 . 0 5 , n i l )  
 	 	 e n d  
 	 	 i f   t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . y   >   8 5 0   t h e n  
 	 	 	 	 t f m . e x e c . d i s p l a y P a r t i c l e ( 1 4 , t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . x + 1 6 , t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . y - 2 8 , 0 , - 0 . 6 , 0 , - 0 . 0 5 , n i l )  
 	 	 e n d  
 	 	 i f   t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . y   >   9 0 0   t h e n  
 	 	 	 	 t f m . e x e c . d i s p l a y P a r t i c l e ( 1 4 , t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . x + 1 6 , t f m . g e t . r o o m . p l a y e r L i s t [ n a m e ] . y - 4 1 , 0 , - 0 . 6 , 0 , - 0 . 0 5 , n i l )  
 	 	 e n d  
 	 e n d  
 e n d