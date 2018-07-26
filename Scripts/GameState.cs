using Godot;
using System;

public class GameState : Node2D
{
    [Export] int startingLives = 3;
    int lives;

    public void Hurt()
    {
        GD.Print("GameState Hurt() called");
	    lives -= 1;
	    //(GetNode("Player") as Player).Hurt(); // todo architecture?
	// update_GUI()
	// animate_GUI("Hurt")
	// Global.pain_sfx.play()
	// if lives < 0:
	// 	end_game()
    }

    public override void _Ready()
    {
        lives = startingLives;
    }
}
