Solver for Algorithm Experiment - Adaptive 2 of my CSIntro course.

Description of the problem:
==================================================
Adaptive Game 2
Rule: 2 mice, 1 poisoned bottle, you can feed a mouse in 1 step with some bottles. Mouse will die immediately when drinks the poisoned bottle(counted as 1 step).
Target: Use the least steps.
Introduction:

Try to find the only poisoned bottle with the least steps. If your strategy covers all the situations, you win , otherwise, you lose. The average results will be counted.
You and your partners must use up all 5 chances to submit totally, otherwise you won't get a score. 
==================================================

Hints:
1. The least expectation of steps
2. Grouping, Mice 1 testing which group, Mice 2 testing which one in the group
3. The last group and the last one of a group do not cost more steps than the second last one.
4. Let N be the total number of bottles, n be the number of groups and x(i) be the number of bottles in the i'th group. Therefore sum(x(i))=N.
5. Sum of steps: y=sum(x(i)^2/2+i*x(i))+N/2-n-x(n), where the expectation of steps is y/N.
6. It can be proved that y is minimal implies x(i)<=x(i+1).
7. For each n from 1 to N, enumerate all senqunces x(i) which meet the conditions above, calculate the corresponding y, and fine the least one.
