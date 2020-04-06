man(tom).
man(peter).
man(mike).
man(ron).
man(charles).
man(michael).
man(mark).
man(adam).

woman(sandra).
woman(joanne).
woman(helen).
woman(isabelle).
woman(daphne).
woman(vanessa).

parent(tom, peter).
parent(tom, helen).
parent(tom, daphne).
parent(sandra, peter).
parent(sandra, helen).
parent(sandra, daphne).
parent(peter, ron).
parent(peter, isabelle).
parent(joanne, ron).
parent(joanne, isabelle).
parent(helen, charles).
parent(helen, michael).
parent(mike, charles).
parent(mike, michael).
parent(daphne, adam).
parent(daphne, vanessa).
parent(mark, adam).
parent(mark, vanessa).

/* male_cousin(X, Y) rules:
1. X should be male.
2. X and Y are not be sibling(have same parent).
3. X and Y should be on same level of family tree.
4. Ancestor of X and Y should be related */
%

/* X and Y are sibling or not */
is_silbling(X, Y) :- parent(W, X), parent(W, Y).
/* Parent of X and Y is sibling or not */
is_silbling(X, Y) :- parent(A, X), parent(B, Y), is_silbling(A, B).
/* X and Y is cousing or not */
is_cousin(X, Y) :- parent(A, X), parent(B, Y), A \= B, is_silbling(A, B).
/* X and Y are cousin and X is male. */
male_cousin(X, Y) :- man(X), X \= Y, is_cousin(X, Y).

/* X is mother_in_law of Y */
mother_in_law(X, Y) :- woman(X), parent(X, Z), parent(Z, A), parent(Y, A), not(Z = Y).