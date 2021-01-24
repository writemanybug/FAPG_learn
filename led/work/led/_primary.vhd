library verilog;
use verilog.vl_types.all;
entity led is
    port(
        key1            : in     vl_logic;
        key2            : in     vl_logic;
        key3            : in     vl_logic;
        key4            : in     vl_logic;
        led1            : out    vl_logic;
        led2            : out    vl_logic;
        led3            : out    vl_logic;
        led4            : out    vl_logic
    );
end led;
