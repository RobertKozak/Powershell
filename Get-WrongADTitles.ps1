A d d - P S S n a p i n   Q u e s t . A c t i v e R o l e s . A D M a n a g e m e n t   - W a r n i n g A c t i o n   S i l e n t l y C o n t i n u e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 #   S e t u p   E m a i l   f i e l d s  
 $ S M T P   =   N e w - O b j e c t   N e t . M a i l . S M T P C l i e n t  
 $ S M T P . H o s t   =   " m a i l . i n s - l u a . c o m "  
 $ S M T P . T a r g e t N a m e   =   " m a i l . i n s - l u a . c o m "  
 $ E m a i l F r o m   =   " I T T e c h s @ i n s - l u a . c o m "  
 $ E m a i l T O   =   " I T T e c h s @ i n s - l u a . c o m "  
 $ S u b j e c t   =   " W r o n g   A D   T i t l e   o r   M a n a g e r   L o c a t e d   -   $ E n v : C O M P U T E R N A M E "  
 #   S t a r t   c r a f t i n g   t h e   m e s s a g e .  
 $ M e s s a g e   =   N e w - O b j e c t   S y s t e m . N e t . M a i l . M a i l M e s s a g e   $ E m a i l F r o m ,   $ E m a i l T O  
 $ M e s s a g e . S u b j e c t   =   $ S u b j e c t  
 $ M e s s a g e . I s B o d y H T M L   =   $ t r u e  
 #   C S S   S t y l e   f o r   E m a i l .  
 $ S t y l e   =   " < s t y l e > B O D Y { f o n t - f a m i l y :   A r i a l ;   f o n t - s i z e :   1 0 p t ; } "  
 $ S t y l e   =   $ S t y l e   +   " T A B L E { b o r d e r :   1 p x   s o l i d   b l a c k ;   b o r d e r - c o l l a p s e :   c o l l a p s e ; } "  
 $ S t y l e   =   $ S t y l e   +   " T H { b o r d e r :   1 p x   s o l i d   b l a c k ;   b a c k g r o u n d :   # d d d d d d ;   p a d d i n g :   5 p x ; } "  
 $ S t y l e   =   $ S t y l e   +   " T D { b o r d e r :   1 p x   s o l i d   b l a c k ;   p a d d i n g :   5 p x ; } "  
 $ S t y l e   =   $ S t y l e   +   " < / s t y l e > "  
 $ B o d y   =   @ ( )  
 G e t - Q A D U s e r   - S i z e L i m i t   1 0 0 0 0 0   |   F o r E a c h - O b j e c t   {  
 	 $ U s e r   =   $ _  
 	 I F   ( ( ( $ U s e r . T i t l e   - i n e   $ U s e r . D e s c r i p t i o n )   - o r   ( $ U s e r . M a n a g e r   - i e q   $ n u l l )   - o r   ( ( $ U s e r . M a n a g e r   |   G e t - Q A D M e m b e r O f )   - m a t c h   " D i s a b l e d   U s e r s " ) )   - a n d   ( $ U s e r . P a r e n t C o n t a i n e r   - e q   " i n s - l u a . c o m / U s e r s   -   U S " ) ) {  
 	 	 $ U s e r N a m e   =   $ U s e r . N a m e  
 	 	 $ T i t l e   =   $ U s e r . T i t l e  
 	 	 I F   ( $ U s e r . M a n a g e r   - i e q   $ n u l l )   { $ M a n a g e r   =   " N o   M a n a g e r " }  
 	 	 E L S E   { $ M a n a g e r   =   ( G e t - Q A D U s e r   - I d e n t i t y   $ U s e r . M a n a g e r ) . N a m e }  
 	 	 $ D e s c r i p t i o n   =   $ U s e r . D e s c r i p t i o n  
 	 	 $ L o g   =     N e w - O b j e c t   P S O b j e c t  
 	 	 A d d - M e m b e r   - M e m b e r T y p e   N o t e P r o p e r t y   - I n p u t O b j e c t   $ L o g   - N a m e   " U s e r   N a m e "   - V a l u e   $ U s e r N a m e   - F o r c e  
 	 	 A d d - M e m b e r   - M e m b e r T y p e   N o t e P r o p e r t y   - I n p u t O b j e c t   $ L o g   - N a m e   " M a n a g e r "   - V a l u e   $ M a n a g e r   - F o r c e  
 	 	 A d d - M e m b e r   - M e m b e r T y p e   N o t e P r o p e r t y   - I n p u t O b j e c t   $ L o g   - N a m e   " T i t l e "   - V a l u e   $ T i t l e   - F o r c e  
 	 	 A d d - M e m b e r   - M e m b e r T y p e   N o t e P r o p e r t y   - I n p u t O b j e c t   $ L o g   - N a m e   " D e s c r i p t i o n "   - V a l u e   $ D e s c r i p t i o n   - F o r c e  
 	 	 $ B o d y   + =   $ L o g  
 	 	 }  
 	 }  
 #   C o n v e r t   C o n t e n t   t o   H T M L   a n d   e m a i l   r e p o r t .  
 $ m e s s a g e . B o d y   =   $ B o d y   |   C o n v e r t T o - H t m l   - H e a d   $ S t y l e  
 $ S M T P . S e n d ( $ M e s s a g e )  
 #   S E N D   E M A I L   T O   P A U L  
 $ E m a i l T O   =   " p j p @ i n s - l u a . c o m "  
 $ M e s s a g e   =   N e w - O b j e c t   S y s t e m . N e t . M a i l . M a i l M e s s a g e   $ E m a i l F r o m ,   $ E m a i l T O  
 $ M e s s a g e . S u b j e c t   =   $ S u b j e c t  
 $ M e s s a g e . I s B o d y H T M L   =   $ t r u e  
 $ m e s s a g e . B o d y   =   $ B o d y   |   C o n v e r t T o - H t m l   - H e a d   $ S t y l e  
 $ S M T P . S e n d ( $ M e s s a g e ) 
