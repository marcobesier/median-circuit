pragma circom 2.1.8;
include "./node_modules/circomlib/circuits/comparators.circom";

template Median() {
    signal input in[5];
    signal input k;

    // Prove that the list is sorted
    component le[4];
    for (var i = 0; i < 4; i++) {
        le[i] = LessEqThan(252);
        le[i].in[0] <== in[i];
        le[i].in[1] <== in[i+1];
        le[i].out === 1;
    }

    // Prove that k is the median
    in[2] === k;
}

component main {public [k]} = Median();
