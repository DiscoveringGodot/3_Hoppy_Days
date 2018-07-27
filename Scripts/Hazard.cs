using Godot;
using System;

public class Hazard : Area2D
{
    void OnBodyEntered(Godot.Object body)
    {
        GD.Print("Hazard body entered");
        (GetNode("/root/GameState/Player") as Player).Hurt();
    }
}
