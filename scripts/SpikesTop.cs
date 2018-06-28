using Godot;
using System;
//using System.Reflection;

public class SpikesTop : Area2D
{
    Player player;

    [Signal]
    delegate void Hurt();

    public override void _Ready()
    {
        player = GetNode("/root/Level1/Player") as Player;  // string-reference spit
        this.Connect(nameof(Hurt), player, nameof(player.TakeDamage));
    }

    public override void _Process(float delta)
    {
        EmitSignal(nameof(Hurt));  // :-) no strings
    }

//    public override void _Process(float delta)
//    {
//        // Called every frame. Delta is time since last frame.
//        // Update game logic here.
//        
//    }
}
