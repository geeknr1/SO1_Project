# Exemplu: Gasirea tuturor fisierelor mai mari de 100 MB într-un director si mutarea acestora într-un alt director.

# find /data -type f -size +100M | xargs -I {} mv {} /backup/large_files

# find /downloads -regex '.*\.jpeg$' -exec mv {} /images \;



