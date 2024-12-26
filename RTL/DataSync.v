module DataSync #(
    parameter BusWidth = 8
)
(
    input  wire [BusWidth-1:0] UnsyncBus,
    input  wire                DestCLK,
    input  wire                DestRST,
    input  wire                EN,
    output reg  [BusWidth-1:0] SyncBus
);

    //I Dont wanna use any forgenerate statement
    Synchronizer      SyncBit0 
    (.UnsyncBit       (UnsyncBus[0]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[0])
    );
        
    Synchronizer      SyncBit1 
    (.UnsyncBit       (UnsyncBus[1]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[1])
    );
    
    Synchronizer      SyncBit2 
    (.UnsyncBit       (UnsyncBus[2]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[2])
    );

    Synchronizer      SyncBit3 
    (.UnsyncBit       (UnsyncBus[3]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[3])
    );

    Synchronizer      SyncBit4 
    (.UnsyncBit       (UnsyncBus[4]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[4])
    );

    Synchronizer      SyncBit5
    (.UnsyncBit       (UnsyncBus[5]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[5])
    );

    Synchronizer      SyncBit6
    (.UnsyncBit       (UnsyncBus[6]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[6])
    );

    Synchronizer      SyncBit7
    (.UnsyncBit       (UnsyncBus[7]),
     .CLK             (DestCLK),
     .RST             (DestRST),
     .EN              (EN),
     .SyncBit         (SyncBus[7])
    );
endmodule
