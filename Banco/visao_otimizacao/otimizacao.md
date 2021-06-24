## "Teorema dos três joins de menor custo"

Dado três relações A, B, C com cardinalidades $|A|$, $|B|$ e $|C|$ tal que $|A|$ < $|B|$ < $|C|$. A coluna A faz join com B e B faz join C. A sequênciaS de joins de menor custo são:

$$ 
    (A \bowtie B) \bowtie C \\
    (B \bowtie A) \bowtie C
$$

Com as outras opções, mais custosas, sendo:

$$ 
    (C \bowtie B) \bowtie A \\
    (B \bowtie C) \bowtie A
$$

Note que para quaiqueres duas tabelas X ou Y, a complexidade no pior caso é ao produto da cardinaldiade de cada relação, cada tupla em X deve ser comparada em cada tupla em Y. A complexidade então fica como $O(|X|)O(|Y|)$. Sendo assim, o número de tuplas retornado em cada join interno é de $|A||C|$ e $|B||C|$ respectivamente. Para o segundo join, o pior caso depende dessas quantidades retornadas no primeiro join e da quantidade na relação que sobrou. Logo as complexidades desse ultimo join ficam iguais, como $O(|A|)O(|B|)O(|C|)$ e $O(|C|)(|B|)O(|A|)$ e as complexidades finais são a soma das complexidades do primero e segundo join, $O(|A|)O(|B|) + O(|A|)O(|B|)O(|C|)$ e $O(|C|)O(|B|) + O(|A|)O(|B|)O(|C|)$ Como $|A| < |C]$, a complexidade das sequências de joins cujo primeiro join involve a menor relação A é a menor dentre as possibilidades.

