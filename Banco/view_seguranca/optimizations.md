## "Shortest Join Sequence Theorem"

Given three relations (tables) A, B, C with cardinalities $|A|$, $|B|$ and $|C|$ such that $|C|$ < $|B|$. Both B and C have one or more attributes (columns) that must be joined with the table A to generate the final table, so there are two ways of achieving such result:

$$ 
    (A \bowtie B) \bowtie C \;\; \\
    (A \bowtie C) \bowtie B \;\;
$$

Notice that for any two tables, the worst case number of comparisons is proportional to the product of the size of each table. That is, each tuple in X must compared with each tuple in Y, so the complexity is $O(|X|)O(|Y|) \;=\;O(XY)$. Now, the number of rows returned in each internal join (first join) are $O(|A|)O(|B|)$ and $O(|A|)O(|C|)$ respectively. For the second join, the worst case costs depends on the number of tuples returned by the first join and the number of tuples in the remaining relation. So $O(|A||B|)O(|C|)$ and $O(|A||C|)O(|B|)$. Thus, the final complexities are:

$$
    O(|A||B|) + O(|A||B||C|) > O(|A||C|) + O(|A||C||B|) \\
    O(|A||B|) > O(|A||C|) \\
    O(|B|) > O(|C|)
$$

Thus in this scenario, choosing the smallest relation for the fist join will result in a smaller time complexity. The gain of going from the slowest to the fastest is:

$$ 
    \frac{O(|A||B|) + O(|A||B||C|) - O(|A||C|) - O(|A||C||B|)}{O(|A||B|) + O(|A||C||B|)} \\\;\\
    \frac{O(|A|)O(|B|-|C|)}{O(|A|)O(|B|)(1+|C|)} \\\;\\
    \boxed{\frac{O(|B|-|C|)}{O(|B|)(1+|C|)}}
$$

Now for a n-relations generalization. Say we have a number of relations $\{R_{0},\;R_{1},\;...,\;R_{n}\}$ with cardinalities $\{r_{0},\;r_{1},\;...,\;r_{n}\}$ such that $r_{n-1} < r_{n} \; \forall i$ and we want to find a sequence $\{S_{0},\;S_{1},\;...,\;S_{n}\}$ that minimizes the worst case complexity for n joins with the relation A, that is 

$$ ((...(A\bowtie S_{0})\bowtie...)\bowtie S_{n-1})\bowtie S_{n} $$

An auxiliary vector containing each consecutive resulting set of a join will be defined as $\{J_{0},\;J_{1},\;...,\;J_{n}\}$. Now, looking at the last two joins:

$$ (J_{n-1}\bowtie S_{n-1}) \bowtie S_{n} $$

Notice that this falls into the case with only three relations and we know from that theorem that for the lowest worst case complexity the condition $|S_{n-1}| < |S_{n}|$ must be true. Since the total complexity depends on all the joins, that is f($J_{0}) + f(J_{1}) + ... + f(J_{n})$ then each join must also the best possible. That way we have:

$$ 
    J_{i} = (J_{i-1}\bowtie S_{i-1}) \bowtie S_{i} \;\; \forall i \; : \; S_{i-1} < S_{i}
$$

Therefore, $S_{i} = r_{i} \; \forall i$, meaning that the order of joins must be started from the relation of the smallest to the greatest cardinality. The final complexity would then be:

$$
    O(|A|)O(r_{0}) + O(|A|)O(r_{0})O(r_{1}) + ... + O(|A|)...O(r_{n}) = O(|A|)\sum_{i=0}^{n}\prod_{k=0}^{i}O(r_{k})
$$