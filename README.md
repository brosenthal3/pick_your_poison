# pick_your_poison

This is a project made for the Human Computer Interaction and Information Visualization course (24/25) at Leiden University.

Pick Your Poison is a mushroom customizer app, that allows users to customize a dynamic mushroom template with 10+ different features and endless options.
Our ML algorithms predict the most similar real-life mushroom species and its toxicity: is your mushroom design poisonous or edible?

## TODO - software aspects:
* implement scrollable widget for mushroom options
* set up global state
* implement onClicked functions for all mushroom options to update global state
* make widget that dynamically creates mushroom based on global state (also design)

## TODO - design aspects:
* improve everything about the design (i made it ugly, sorry..)
* add all assets in a logical way
* integrate assets into dynamic mushroom design widget
* add loading screens and animations where might be needed

## TODO - AI integration:
* add asynch code to communicate with API during each global state change
* integrate all information from predictions dynamically into the prediction pages
* Include queries to more information about the species, or include data locally

# Mushroom features overview:
### Cap:
- Shape: bell (b), conical (C), convex (x), flat (f), sunken (s), spherical (p)
- Surface: fibrous (i), grooves (g), scaley (y), smooth (s), shiny (h), leathery (l), silky (k), sticky (t), wrinkled (w), fleshy (e)
- Color: black (k), brown (n), buff (b), cinnamon (o), grey (g), green (r), pink (p), purple (u), red (e), white (w), yellow (y), blue (l)

### Gill:
- Spacing: close (c), distant (d), none (f)
- Color: black (k), brown (n), buff (b), cinnamon (o), grey (g), green (r), pink (p), purple (u), red (e), white (w), yellow (y), blue (l)

### Stem: 
- Root: swollen (s), bulbous (b), club (c), cup (u), equal (e), rhizomorphous (z), rooted (r)
- color: black (k), brown (n), buff (b), cinnamon (o), grey (g), green (r), pink (p), purple (u), red (e), white (w), yellow (y), blue (l)
- Surface: fibrous (i), grooves (g), scaley (y), smooth (s), shiny (h), leathery (l), silky (k), sticky (t), wrinkled (w), fleshy (e)

### Other:
- Ring: none (f), cobwebby (c), evenescent (e), flaring (r), grooved (g), large (l), pendant (p), sheathing (s), zone (z), scaly (y), moveable (m)