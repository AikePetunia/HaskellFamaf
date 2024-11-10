type Nombre = String 
type TamañoAlto = Int 
type TamañoDiametro = Int 
type Aprecicaciones = Int 
data Estado = Seco | EnFlor | Verde | ConFrutos deriving (Show, Eq, Ord)

data ArbolesNativos = NoHayMasDelArbol 
                    | EvolucionDelArbol Nombre Estado TamañoAlto TamañoDiametro Aprecicaciones ArbolesNativos deriving (Show, Eq, Ord)

esVendible :: ArbolesNativos -> Bool 
esVendible NoHayMasDelArbol = False 
esVendible (EvolucionDelArbol _ estado tamañoAlto tamañoDiametro apreciaciones arbolesNativos) | estado == ConFrutos = True 
                                                                                                    | estado == EnFlor && tamañoDiametro > 7 || tamañoAlto > 7 && apreciaciones >= 8 = True 
                                                                                                    | estado == Verde && tamañoDiametro > 9 && tamañoAlto > 9  && apreciaciones == 9 = True 
                                                                                                    | otherwise =  esVendible arbolesNativos
paraVender :: ArbolesNativos -> String -> Bool 
paraVender NoHayMasDelArbol s = False 
paraVender (EvolucionDelArbol nombre estado tamañoAlto tamañoDiametro apreciaciones arbolesNativos) s | nombre == s = esVendible (EvolucionDelArbol nombre estado tamañoAlto tamañoDiametro apreciaciones arbolesNativos)
                                                                                                      | otherwise = paraVender arbolesNativos s 

devolverAltura :: ArbolesNativos -> String -> Maybe Int 
devolverAltura NoHayMasDelArbol s = Nothing
devolverAltura (EvolucionDelArbol nombre _ tamañoAlto _ _ arbolesNativos) s | s == nombre = Just tamañoAlto
                                                                            | otherwise = devolverAltura arbolesNativos s 

ejemplo1 :: ArbolesNativos
ejemplo1 = EvolucionDelArbol "Roble" ConFrutos 10 8 7 (EvolucionDelArbol "Pino" EnFlor 5 8 8 (EvolucionDelArbol "Sauce" Verde 10 10 9 (EvolucionDelArbol "Abedul" Seco 5 6 5 (EvolucionDelArbol "Cedro" EnFlor 6 6 6 NoHayMasDelArbol))))


{-
ghci> paraVender ejemplo1 "Roble"
True
ghci> paraVender ejemplo1 "Abedul"
False
-}
{-
ghci> devolverAltura ejemplo1 "Abedul"
Just 5
ghci> devolverAltura ejemplo1 "Roble"
Just 10
-}