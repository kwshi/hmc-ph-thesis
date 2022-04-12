# last time recap

# circuits recap

three types of gates: NOT AND OR.

# graph colorings recap

3-coloring: assign colors to each vertex.

proper: for each edge (u,v): u and v have different colors.

# goal from last time: convert a circuit to a graph.

what does this mean? represent boolean values by colors; construct graph
"gadgets" whose values exactly match the output of gates.

example: NOT gate.

# last time: my wrong conversion

fake OR-gate. last time I said this was an OR gate, ryan said this was wrong. i
said no it's OK, but I was wrong. this is wrong. let's see why.

OR truth table, truth table of this thing. have: output _can_ be true iff x OR y;
want output _must_ be true iff x OR y.

all is not lost. we can actually use this property to build a good OR gate.

to start, consider these two examples:
z fakeOR ¬x = true.

as noted above, under any proper coloring, z OR ¬x must be true.

it
comes down to this equivalence:

z = x OR y ⟺ (¬z OR x OR y) = true, (z OR ¬x) = true, and (z OR ¬y) = true

z=xy ⟺ (¬z∨xy)(¬x∨¬y∨z)

¬(z(¬x∨¬y))=¬(z¬x∨z¬y)
