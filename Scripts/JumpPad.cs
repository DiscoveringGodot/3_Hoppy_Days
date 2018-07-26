using Godot;
using System;

public class JumpPad : Area2D
{
    // CACHE - e.g. references for readability
    AnimatedSprite animatedSprite;

    public override void _Ready()
    {
        // Called every time the node is added to the scene.
        animatedSprite = FindNode("AnimatedSprite") as AnimatedSprite;
    }

    void OnJumpPadBodyEntered(Godot.Object body)
    {
        animatedSprite.Play("spring");
        (FindNode("Timer") as Timer).Start();
        // TODO Boost Player
    }

    void OnTimerTimeout()
    {
        animatedSprite.Play("idle");
    }
}
