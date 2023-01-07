pragma circom 2.0.0;


include "../../node_modules/circomlib/circuits/comparators.circom";


template bandwidthproof() {
    // Public inputs
    signal input bandwidth;

    // Private inputs
    signal input privbandwidth;

    // Output
    signal output out;


    // constraint to check the bandwidth buffer
    component low = LessEqThan(32);
    component high = GreaterEqThan(32);

    low.in[0] <== bandwidth;
    low.in[1] <== privbandwidth-50;

    high.in[0] <== bandwidth;
    high.in[1] <== privbandwidth+50;

    out <== high.out*low.out;
    
 }

 component main {public [bandwidth]} = bandwidthproof();
