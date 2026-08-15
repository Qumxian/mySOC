#ifndef UE11_HCD_H
#define UE11_HCD_H

//-----------------------------------------------------------------
// Logging levels:
//-----------------------------------------------------------------
#define USBLOG_NONE     0
#define USBLOG_ERR      1
#define USBLOG_REQ      2
#define USBLOG_INFO     3
#define USBLOG_DATA     4

// Current USB_LOG level
#define USBLOG_LEVEL    USBLOG_ERR

#define USB_LOG(l,a)    do { if (l <= USBLOG_LEVEL) printk a; } while (0)

//-----------------------------------------------------------------
// Defines:
//-----------------------------------------------------------------
#define USB_CTRL          0x0
    #define USB_CTRL_TX_FLUSH                    8
    #define USB_CTRL_TX_FLUSH_SHIFT              8
    #define USB_CTRL_TX_FLUSH_MASK               0x1

    #define USB_CTRL_PHY_DMPULLDOWN              7
    #define USB_CTRL_PHY_DMPULLDOWN_SHIFT        7
    #define USB_CTRL_PHY_DMPULLDOWN_MASK         0x1

    #define USB_CTRL_PHY_DPPULLDOWN              6
    #define USB_CTRL_PHY_DPPULLDOWN_SHIFT        6
    #define USB_CTRL_PHY_DPPULLDOWN_MASK         0x1

    #define USB_CTRL_PHY_TERMSELECT              5
    #define USB_CTRL_PHY_TERMSELECT_SHIFT        5
    #define USB_CTRL_PHY_TERMSELECT_MASK         0x1

    #define USB_CTRL_PHY_XCVRSELECT_SHIFT        3
    #define USB_CTRL_PHY_XCVRSELECT_MASK         0x3

    #define USB_CTRL_PHY_OPMODE_SHIFT            1
    #define USB_CTRL_PHY_OPMODE_MASK             0x3

    #define USB_CTRL_ENABLE_SOF                  0
    #define USB_CTRL_ENABLE_SOF_SHIFT            0
    #define USB_CTRL_ENABLE_SOF_MASK             0x1

#define USB_STATUS        0x4
    #define USB_STATUS_SOF_TIME_SHIFT            16
    #define USB_STATUS_SOF_TIME_MASK             0xffff

    #define USB_STATUS_RX_ERROR                  2
    #define USB_STATUS_RX_ERROR_SHIFT            2
    #define USB_STATUS_RX_ERROR_MASK             0x1

    #define USB_STATUS_LINESTATE_BITS_SHIFT      0
    #define USB_STATUS_LINESTATE_BITS_MASK       0x3

#define USB_IRQ_ACK       0x8
    #define USB_IRQ_ACK_DEVICE_DETECT            3
    #define USB_IRQ_ACK_DEVICE_DETECT_SHIFT      3
    #define USB_IRQ_ACK_DEVICE_DETECT_MASK       0x1

    #define USB_IRQ_ACK_ERR                      2
    #define USB_IRQ_ACK_ERR_SHIFT                2
    #define USB_IRQ_ACK_ERR_MASK                 0x1

    #define USB_IRQ_ACK_DONE                     1
    #define USB_IRQ_ACK_DONE_SHIFT               1
    #define USB_IRQ_ACK_DONE_MASK                0x1

    #define USB_IRQ_ACK_SOF                      0
    #define USB_IRQ_ACK_SOF_SHIFT                0
    #define USB_IRQ_ACK_SOF_MASK                 0x1

#define USB_IRQ_STS       0xc
    #define USB_IRQ_STS_DEVICE_DETECT            3
    #define USB_IRQ_STS_DEVICE_DETECT_SHIFT      3
    #define USB_IRQ_STS_DEVICE_DETECT_MASK       0x1

    #define USB_IRQ_STS_ERR                      2
    #define USB_IRQ_STS_ERR_SHIFT                2
    #define USB_IRQ_STS_ERR_MASK                 0x1

    #define USB_IRQ_STS_DONE                     1
    #define USB_IRQ_STS_DONE_SHIFT               1
    #define USB_IRQ_STS_DONE_MASK                0x1

    #define USB_IRQ_STS_SOF                      0
    #define USB_IRQ_STS_SOF_SHIFT                0
    #define USB_IRQ_STS_SOF_MASK                 0x1

#define USB_IRQ_MASK      0x10
    #define USB_IRQ_MASK_DEVICE_DETECT           3
    #define USB_IRQ_MASK_DEVICE_DETECT_SHIFT     3
    #define USB_IRQ_MASK_DEVICE_DETECT_MASK      0x1

    #define USB_IRQ_MASK_ERR                     2
    #define USB_IRQ_MASK_ERR_SHIFT               2
    #define USB_IRQ_MASK_ERR_MASK                0x1

    #define USB_IRQ_MASK_DONE                    1
    #define USB_IRQ_MASK_DONE_SHIFT              1
    #define USB_IRQ_MASK_DONE_MASK               0x1

    #define USB_IRQ_MASK_SOF                     0
    #define USB_IRQ_MASK_SOF_SHIFT               0
    #define USB_IRQ_MASK_SOF_MASK                0x1

#define USB_XFER_DATA     0x14
    #define USB_XFER_DATA_TX_LEN_SHIFT           0
    #define USB_XFER_DATA_TX_LEN_MASK            0xffff

#define USB_XFER_TOKEN    0x18
    #define USB_XFER_TOKEN_START                 31
    #define USB_XFER_TOKEN_START_SHIFT           31
    #define USB_XFER_TOKEN_START_MASK            0x1

    #define USB_XFER_TOKEN_IN                    30
    #define USB_XFER_TOKEN_IN_SHIFT              30
    #define USB_XFER_TOKEN_IN_MASK               0x1

    #define USB_XFER_TOKEN_ACK                   29
    #define USB_XFER_TOKEN_ACK_SHIFT             29
    #define USB_XFER_TOKEN_ACK_MASK              0x1

    #define USB_XFER_TOKEN_PID_DATAX             28
    #define USB_XFER_TOKEN_PID_DATAX_SHIFT       28
    #define USB_XFER_TOKEN_PID_DATAX_MASK        0x1

    #define USB_XFER_TOKEN_PID_BITS_SHIFT        16
    #define USB_XFER_TOKEN_PID_BITS_MASK         0xff

    #define USB_XFER_TOKEN_DEV_ADDR_SHIFT        9
    #define USB_XFER_TOKEN_DEV_ADDR_MASK         0x7f

    #define USB_XFER_TOKEN_EP_ADDR_SHIFT         5
    #define USB_XFER_TOKEN_EP_ADDR_MASK          0xf

#define USB_RX_STAT       0x1c
    #define USB_RX_STAT_START_PEND               31
    #define USB_RX_STAT_START_PEND_SHIFT         31
    #define USB_RX_STAT_START_PEND_MASK          0x1

    #define USB_RX_STAT_CRC_ERR                  30
    #define USB_RX_STAT_CRC_ERR_SHIFT            30
    #define USB_RX_STAT_CRC_ERR_MASK             0x1

    #define USB_RX_STAT_RESP_TIMEOUT             29
    #define USB_RX_STAT_RESP_TIMEOUT_SHIFT       29
    #define USB_RX_STAT_RESP_TIMEOUT_MASK        0x1

    #define USB_RX_STAT_IDLE                     28
    #define USB_RX_STAT_IDLE_SHIFT               28
    #define USB_RX_STAT_IDLE_MASK                0x1

    #define USB_RX_STAT_RESP_BITS_SHIFT          16
    #define USB_RX_STAT_RESP_BITS_MASK           0xff

    #define USB_RX_STAT_COUNT_BITS_SHIFT         0
    #define USB_RX_STAT_COUNT_BITS_MASK          0xffff

#define USB_WR_DATA       0x20
    #define USB_WR_DATA_DATA_SHIFT               0
    #define USB_WR_DATA_DATA_MASK                0xff

#define USB_RD_DATA       0x20
    #define USB_RD_DATA_DATA_SHIFT               0
    #define USB_RD_DATA_DATA_MASK                0xff

//-----------------------------------------------------------------

#define LOG2_PERIODIC_SIZE  5   /* arbitrary; this matches OHCI */
#define PERIODIC_SIZE       (1 << LOG2_PERIODIC_SIZE)
#endif

