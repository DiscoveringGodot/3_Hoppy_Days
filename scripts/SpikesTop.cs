using Godot;
using System;
//using System.Reflection;

public class SpikesTop : Area2D
{
    Player player;

    [Signal]
    delegate void DealDamage();

    public override void _Ready()
    {
        player = GetNode("/root/Level1/Player") as Player;  // string-reference - spit
        this.Connect(nameof(DealDamage), player, nameof(player.RequestDamage));  // no strings - smile
    }

    public override void _PhysicsProcess(float delta)
    {
        // if it's the player
        var bodies = GetOverlappingBodies();
        foreach (Godot.Object body in bodies)
        {
            if (body as Player != null)  // we've hit a Player
            {
                EmitSignal(nameof(DealDamage));  // :-) no strings
            }
        }
    }
}
