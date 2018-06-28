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

    public override void _Process(float delta)
    {
        EmitSignal(nameof(DealDamage));  // :-) no strings
    }

//    public override void _Process(float delta)
//    {
//        // Called every frame. Delta is time since last frame.
//        // Update game logic here.
//        
//    }
}
