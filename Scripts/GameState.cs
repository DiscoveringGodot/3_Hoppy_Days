using Godot;
using System;

public class GameState : Node2D
{
    [Export] int startingLives = 3;
    int lives;

    public override void _Ready()
    {
        lives = startingLives;
    }

    public void PlayerHurt()
    {
	    lives -= 1;
        GD.Print("GameState PlayerHurt() called, lives = " + lives);

        // update_GUI()
        // animate_GUI("PlayerHurt")
        if (lives < 0)
        {
            EndGame();
        }
    }

    public void EndGame()
    {
        GetTree().ChangeScene("res://Scenes/Levels/GameOver.tscn");
    }

    private void UpdateGUI(){

    }

}
