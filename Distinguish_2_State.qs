namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;

    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            H(qs[0]);
            H(qs[1]);
            
            let res0 = Measure([PauliZ], [qs[0]]);
            let res1 = Measure([PauliZ], [qs[1]]);
            
            if (res0 == Zero) { if (res1 == Zero)  { return 0; }}
            if (res0 == Zero) { if (res1 == One)  { return 1; }}
            if (res0 == One) { if (res1 == Zero)  { return 2; }}
            if (res0 == One) { if (res1 == One)  { return 3; }}
            return 0; }
    
}
}