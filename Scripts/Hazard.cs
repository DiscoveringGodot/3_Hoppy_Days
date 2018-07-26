using Godot;
using System;

public class Hazard : Area2D
{
    void OnBodyEntered(Godot.Object body)
    {
        GD.Print("Hazard body entered");
        (GetNode("/root/Level1") as GameState).Hurt();  // TODO fix naming & finding
    }
}
