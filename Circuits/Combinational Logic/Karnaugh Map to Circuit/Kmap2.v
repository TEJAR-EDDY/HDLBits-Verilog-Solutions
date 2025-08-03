module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    //assign out=(~a&~b)|(a&~b&~c)|(c&d&b)|(a&b&c)|(~c&~a&~b);
  assign out = (~b & ~c) | (~a & ~d) | (~a & b & c) | (a & c & d);
endmodule
