library verilog;
use verilog.vl_types.all;
entity encoder8_3 is
    port(
        ina             : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end encoder8_3;
