- summary: hard games with finitely many turns

- jump into example. first, prelude: basics of circuits.

- 0-turn game: circuit value. win if lightbulb turns on, lose if not. what
  makes this 0-turn, intuitively, is that you don't do any strategizing-- you're
  handed a game board, and fate automatically decides whether you won.

  - other examples of 0-turn games:

    - a tic-tac-toe game that has already ended--you win in the 3-in-a-row is
      yours, or autolose otherwise.
    - a finished Sudoku grid, all numbers already filled in--you auto win/lose
      if you've filled in the numbers correctly.
    - healthcare--if you're born into america, you automatically lose. if
      you're born into taiwan, you automatically win.

- let's keep going. 1-turn game is where you actually do something. again,
  focus on circuits. instead of having your win/lose fate auto-decided for you,
  you decide what all the inputs should be set to (that's your one "turn"). win
  iff lightbulb ends up turning on.

  - other examples of 1-turn games:

    - actual sudoku--you pick the numbers that go in the grid.

    - someone gives you a positive integer--if you can find a smaller integer
      that divides it, you win.

- 2-turn games: two players play against each other. start w/ a circuit, the
  inputs are labeled into two groups. you assign all of yours, then the other
  player assigns all of theirs. you win iff lightbulb lights up; other player
  wins if they can force your lightbulb off.

- talk some generalizations about computational difficulty of games.

  - 0-turn games are easy: require no strategization, or guessing. if you give
    a game board to a computer, the computer has to be able to determine
    efficiently (precisely: in polynomial time) whether you've won. if it can't
    do it--e.g., it needs to brute force a bunch of cases/guesses
    exponentially-many times, then that's not easy.

    class of 0-turn games is P. also called Σ₀P, 0 stands for 0-turn.

  - 1-turn games: requires one turn of strategizing/guessing. you make a move;
    after your move, the remaining setup is a 0-turn game which decides whether 
    your move was a "good" one. but coming up with a good move is hard.

    class of 1-turn games is NP. also called Σ₁P, 1 stands for 1-turn.

- huge million dollar question: is 𝚺₀𝐏=𝚺₁𝐏? (aka: 𝐏=𝐍𝐏?) in other words, are
  1-turn games (where you have to be "smart" and strategize about how to play
  your 1 turn) secretly just as easy to play as 0-turn games (where winnability
  is polynomial-time-decidable)?

  - no conclusive answers for 70 years (million dollar question), but many think
    P≠NP: that 1-turn games are actually genuinely harder, in general, there's
    basically no shortcut to winning other than brute-forcing everything.

- if P-vs-NP is such a big question, why not keep going? what about 1 vs 2, 2 vs
  3, etc.? each one of these is an open question, and P-vs-NP gets a lot of
  attention, but the rest don't, but this is why I think they're interesting.

- anyway, back to circuits. circuits are super useful because you can encode
  everything using circuits. all modern computers are built using circuits.
  consequently, every algorithm can be encoded in terms of circuits, which means
  _every_ k-turn game is actually a special case of circuitₖ. this property is
  known as being 𝚺ₖ𝐏-complete. this result is known as the "cook-levin"
  theorem: circuitk is sigmakp-complete.

- finally, new substance in my thesis work. motivating question-- are there
  other skp-complete games? obviously, yes; how do we find them? i looked at a
  collection of games called graph 3-coloring games; here's how those games
  work.

  say you are given a graph, and each vertex in the graph is assigned one of 3
  colors. call this coloring "proper" if no neighbors share the same color.
  here's how you play the game: the vertices of the graph are split into k
  groups & labeled so; two players take turns coloring groups of verts at a time;
  if either player causes the coloring to become improper, they immediately
  lose. otherwise at the end the last player wins.

  theorem: k-turn graph coloring game is sigmakp-complete. the main reason is
  that you can take any circuit and "embed" it in graph colorings, e.g., have
  red mean 1, blue mean 0; properness forces colors to match up with behavior of
  logic gates.
