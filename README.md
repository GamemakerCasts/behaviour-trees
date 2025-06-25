# BehaviorTree-GML

**Smarter AI in GameMaker with just two node types.**  
A lightweight, modular behavior tree system for GameMaker using `DecisionNode` and `ActionNode`.

---

## 🧠 What is This?

This repo provides a reusable AI system built entirely with GML structs. You can create enemy or NPC behavior using a readable tree-like structure - no state machines, no bloat.

- 🔹 Only two node types: `DecisionNode` and `ActionNode`
- 🔄 Easily nest decisions and actions
- 🔧 Fully customizable with your own logic
- 📦 Drop-in ready for any GML project

---

## 📂 Files Included

- `BehaviorSystem.gml` – Core system (DecisionNode & ActionNode)
- `obj_Enemy` example – Uses the tree to decide between attacking, fleeing, or patrolling
- `README.md` – You're looking at it!

---

## 🚀 How to Use

### 1. **Include the BehaviorSystem**

Copy the `BehaviorSystem.gml` file into your GameMaker project as a script.

### 2. **Define Conditions and Actions**

In your enemy object’s Create Event:

```gml
hp = 100;

is_player_near = function() {
    return point_distance(x, y, obj_Player.x, obj_Player.y) < 100;
};

has_high_health = function() {
    return hp > 50;
};

attack_player = function() {
    show_debug_message("Attacking the player!");
};

flee = function() {
    show_debug_message("Fleeing!");
    var dir = point_direction(x, y, obj_Player.x, obj_Player.y) + 180;
    x += lengthdir_x(2, dir);
    y += lengthdir_y(2, dir);
};

patrol = function() {
    show_debug_message("Patrolling...");
    var dir = point_direction(x, y, obj_Player.x, obj_Player.y);
    x += lengthdir_x(1, dir);
    y += lengthdir_y(1, dir);
};

```
### 3. Build the Behavior Tree
```gml
var attackNode = new ActionNode(attack_player);
var fleeNode = new ActionNode(flee);
var patrolNode = new ActionNode(patrol);

var healthCheckNode = new DecisionNode(has_high_health, attackNode, fleeNode);

ai_tree = new DecisionNode(is_player_near, healthCheckNode, patrolNode);
```

### 4. Evaluate in the Step Event
```gml
ai_tree.evaluate();
```

## 📊 Example Tree Structure
```
           is_player_near?
              /       \
      has_high_health?  Patrol
         /        \
     Attack       Flee
```

## 🔧 Customize & Expand
You can nest DecisionNodes as deeply as you'd like and pass in any condition or action you want. Ideas for expansion:

Decorator nodes (invert, repeat)
Cooldown wrappers
Blackboard memory system
Debug overlays

## 💬 License
MIT – free to use in personal, commercial, or educational projects. Credit appreciated but not required.

## 📺 Related Tutorial
Check out the full video walkthrough on YouTube:
📹 [Watch the tutorial|https://youtu.be/UFkjGnWo_pk]

## ✨ Created by
GameMakerCasts – Tutorials, tools, and systems for making better games with GameMaker.
