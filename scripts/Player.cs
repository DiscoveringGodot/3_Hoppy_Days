using Godot;
using System;

public class Player : KinematicBody2D
{
    // constants
    float SPEED = 750f;
    float GRAVITY = 3600;
    float JUMP_SPEED = -1750f;
    float JUMP_BOOST = 2f;
    Vector2 FLOOR_DIRECTION = new Vector2(0, -1);
    int LEVEL_HEIGHT = 2500;  // in pixels
    float FRICTION = 0.2f;

    // configuration parameters, consider SO
     
    // private instance variables for state
    Vector2 motion = new Vector2();
    int coinCount;

    // cached references for readability

    // messages, then public methods, then private methods...
    public override void _Ready()
    {
        
    }

    public override void _PhysicsProcess(float delta)
    {
        Fall(delta);  // fall to floor first, frame-rate independent
        Run();
        Jump();
        MoveAndSlide(motion, FLOOR_DIRECTION);
    }

    [Signal]
    delegate void LifeUp();

    [Signal]
    delegate void LifeDown();

    [Signal]
    delegate void CoinUp();

    public void OnCoinPickup()
    {
        coinCount += 1;
        // $Coin_sfx.play()
        EmitSignal(nameof(CoinUp));  // note is refactorable with nameof
    }

    private void Fall(float delta)
    {
        if (IsOnFloor())
        {
            motion.y = 0f;
        }
        else
        {
            motion.y += GRAVITY * delta;  // note accelerate down
        }
    }

    private void Jump()
    {
        if (IsOnFloor() && Input.IsActionPressed("ui_up"))
        {
            GD.Print("Jump");
            motion.y = JUMP_SPEED;
            // TODO play SFX 
        }
    }

    private void Run()
    {
        if (Input.IsActionPressed("ui_right") && !Input.IsActionPressed("ui_left"))
        {
            motion.x = SPEED;
        }
        else if (Input.IsActionPressed("ui_left") && !Input.IsActionPressed("ui_right"))
        {
            motion.x = -SPEED;
        }
        else
        {
            motion.x = Mathf.Lerp(motion.x, 0f, FRICTION);
        }
    }
	
	private void TakeDamage(int bodyID, Godot.Object body, int bodyShape, int areaShape)
	{
	    GD.Print("Spikes impact ouchies");
	}
}



