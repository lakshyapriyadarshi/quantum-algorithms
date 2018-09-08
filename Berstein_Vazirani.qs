namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]    {
        body {
            mutable resultArray = new Result[N];
	    mutable x = new Int[N];
	    using(qubits = Qubit[N + 1]) {
            
            X(qubits[N]);
            ApplyToEach(H, qubits);
            Uf(qubits[0 .. N-1] , qubits[N]);
            ApplyToEach(H, qubits[0..(N - 1)]); 

            for (i in 0..(N-1)) {
            set resultArray[i] = MResetZ(qubits[i]);
            if (resultArray[i] == One) { set x[i] = 1;}
	    if (resultArray[i] == Zero) { set x[i] = 0;}

            }

            Reset(qubits[N]);							
            }	
            return x;
         }
    }}