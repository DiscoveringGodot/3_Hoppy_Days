using Godot;
using System;

public class Coin : AnimatedSprite
{
    bool taken = false;

    void OnArea2DBodyEntered(Godot.Object body)
    {
        taken = true;
		// Global.GameState.coin_up()
        (FindNode("AnimationPlayer") as AnimationPlayer).Play("die");
        (FindNode("AudioStreamPlayer") as AudioStreamPlayer).Play();
    }
}
