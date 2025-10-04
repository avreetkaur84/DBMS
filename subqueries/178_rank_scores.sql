-- Question Link: https://leetcode.com/problems/rank-scores/

/* Write your T-SQL query statement below */
/*
    Goal: calculate score rank
    Rank column needs to be created by me on basis of score. 
    Have to do the comparison with score rows to calculate the rank. 
    Barrier:
        1. I think I should sort the score table on basis of scores, then start provinng the ranks simultaneouly. 
        2. If person has similar score to the previous highest scores he gets same rank else his rank is increased by 1.
    -- this is the logic that I can think, but I have no idea how I ca wite it in MYSQLSERVER language
    Solution:
        1. For making the comparison with rows we use subquery or joins, preferred one is subquery. So, Subquery can be used, but assigning the rank simulataneouly with comparison, how?
        2. And, according to my logic, table needs to sorted before hand, whihc I don't know how as ORDER BY is used to sort the values when they are being displayed
    ---------------------------------------------------------------------
    Rank column will be assigned by subquery
*/

SELECT s.score, (
    1+ (SELECT COUNT(DISTINCT d.score) 
        FROM Scores as d
        WHERE d.score > s.score)
) as rank
FROM Scores as s
ORDER BY s.score DESC;