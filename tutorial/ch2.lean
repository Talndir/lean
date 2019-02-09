namespace q1
    -- Setup
    def double : ℕ → ℕ := λ x, x + x
    def do_twice : (ℕ → ℕ) → ℕ → ℕ := λ f x, f (f x)

    -- Solution
    def Do_Twice : ((ℕ → ℕ) → (ℕ → ℕ)) → (ℕ → ℕ) → (ℕ → ℕ)
        := λ f g, f (f g)
    
    #reduce Do_Twice do_twice double 2
end q1

namespace q2
    -- Setup
    variables (α β γ : Type)
    variables (a : α) (b : β) (p : α × β)

    -- Solution
    def curry : (α × β → γ) → (α → β → γ)
        := λ f, λ a b, f (a, b)
    def uncurry : (α → β → γ) → (α × β → γ)
        := λ f, λ p, f p.1 p.2
end q2

namespace q3
    -- Setup
    universe u

    variable {α : Type u}
    variables {n m : ℕ}

    constant vec : Type u → ℕ → Type u

    variables (x : vec α n) {y : vec α m}

    constant empty : vec α 0
    constant cons : α → vec α n → vec α (n + 1)
    constant append : vec α m → vec α n → vec α (n + m)
    
    -- Solution
    constant vec_add : vec α n → vec α n → vec α n
    constant vec_reverse : vec α n → vec α n
end q3

namespace q4
    -- Setup
    open q3

    -- Solution
    universe u

    variable {α : Type u}
    variables {a b c : ℕ}

    constant matrix : Type u → ℕ → ℕ → Type u

    constant mat_add : matrix α a b → matrix α  a b → matrix α a b
    constant mat_mat_mul: matrix α a b → matrix α b c → matrix α a c
    constant mat_vec_mul: matrix α a b → vec α b → vec α a
end q4