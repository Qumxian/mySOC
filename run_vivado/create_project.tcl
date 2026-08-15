set project_name system_run
set project_part xc7a200tfbg676-2

set script_dir   [file dirname [file normalize [info script]]]
set root_dir     [file normalize [file join $script_dir ..]]
set project_path [file normalize [file join $script_dir project]]
set rtl_dir      [file join $root_dir rtl]
set ip_dir       [file join $rtl_dir IP]
set soc_dir      [file join $rtl_dir soc_demo]
set usb_dir      [file join $rtl_dir usb core_usb_host]
set constr_dir   [file join $root_dir constraints]

# The attached XPR itself does not contain myCPU files. Keep this enabled to
# preserve the "Add myCPU" behavior of the template. Set it to 0 for a literal
# recreation of only the files recorded in system_run.xpr.
set include_mycpu 1

# The XPR was written by Vivado 2023.2. With another Vivado release, upgrading
# an IP can modify its XCI/XCIX metadata. Set this to 0 when exact source-file
# reproducibility is more important than upgrading locked IP.
set upgrade_ips 1

# -----------------------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------------------

proc require_files {description paths} {
    set missing [list]

    foreach path $paths {
        if {![file exists $path]} {
            lappend missing $path
        }
    }

    if {[llength $missing] != 0} {
        puts stderr "ERROR: Missing $description:"

        foreach path $missing {
            puts stderr "  $path"
        }

        error "Project creation stopped because required files are missing"
    }
}

proc get_project_file {path} {
    set obj [get_files -quiet [file normalize $path]]

    if {[llength $obj] == 0} {
        set obj [get_files -quiet [file tail $path]]
    }

    return $obj
}

# -----------------------------------------------------------------------------
# Files recorded in system_run.xpr, remapped to the new rtl/ directory
# -----------------------------------------------------------------------------

set design_files [list \
    [file join $soc_dir config.h] \
    [file join $ip_dir APB_DEV apb_dev_top_with_nand.v] \
    [file join $ip_dir APB_DEV apb_mux2.v] \
    [file join $ip_dir AMBA axi2apb.v] \
    [file join $ip_dir AMBA axi_mux_syn.v] \
    [file join $ip_dir MAC utility.v] \
    [file join $ip_dir MAC bd.v] \
    [file join $ip_dir CONFREG confreg_syn.v] \
    [file join $ip_dir MAC csr.v] \
    [file join $ip_dir DEBUG debug_sram.v] \
    [file join $ip_dir DEBUG debug_top.v] \
    [file join $ip_dir DMA dma.v] \
    [file join $ip_dir MAC dma.v] \
    [file join $ip_dir MAC ethernet_top.v] \
    [file join $ip_dir SPI godson_sbridge_spi.v] \
    [file join $ip_dir MAC mac.v] \
    [file join $ip_dir MAC mac2axi.v] \
    [file join $ip_dir MAC mac_axi.v] \
    [file join $ip_dir MAC mac_top.v] \
    [file join $ip_dir MAC maccsr2axi.v] \
    [file join $ip_dir MAC macdata2axi.v] \
    [file join $ip_dir APB_DEV NAND nand.v] \
    [file join $ip_dir APB_DEV nand_module.v] \
    [file join $ip_dir APB_DEV URT raminfr.v] \
    [file join $ip_dir MAC rc.v] \
    [file join $ip_dir MAC rfifo.v] \
    [file join $ip_dir MAC rlsm.v] \
    [file join $ip_dir MAC rstc.v] \
    [file join $ip_dir MAC tc.v] \
    [file join $ip_dir MAC tfifo.v] \
    [file join $ip_dir MAC tlsm.v] \
    [file join $ip_dir APB_DEV URT uart_defines.h] \
    [file join $ip_dir APB_DEV URT uart_receiver.v] \
    [file join $ip_dir APB_DEV URT uart_regs.v] \
    [file join $ip_dir APB_DEV URT uart_rfifo.v] \
    [file join $ip_dir APB_DEV URT uart_sync_flops.v] \
    [file join $ip_dir APB_DEV URT uart_tfifo.v] \
    [file join $ip_dir APB_DEV URT uart_top.v] \
    [file join $ip_dir APB_DEV URT uart_transmitter.v] \
    [file join $usb_dir usbh_crc16.v] \
    [file join $usb_dir usbh_crc5.v] \
    [file join $usb_dir usbh_fifo.v] \
    [file join $usb_dir usbh_host.v] \
    [file join $usb_dir usbh_host_defs.v] \
    [file join $usb_dir usbh_sie.v] \
    [file join $soc_dir soc_top.v] \
]

set xilinx_ip_dir [file join $ip_dir xilinx_ip 2023.2]

# Primary IP containers required by the current SoC design. For IP packaged as
# core containers, adding the XCIX also exposes its internal XCI to the project.
set active_ip_files [list \
    [file join $xilinx_ip_dir mig_axi_32_loongson mig_axi_32.xci] \
    [file join $xilinx_ip_dir axi_interconnect_0 axi_interconnect_0.xci] \
    [file join $xilinx_ip_dir clk_wiz_0_loongson clk_wiz_0.xci] \
    [file join $xilinx_ip_dir clk_pll_33 clk_pll_33.xci] \
    [file join $xilinx_ip_dir dpram_512x32 dpram_512x32.xci] \
    [file join $xilinx_ip_dir axi_clock_converter_0 axi_clock_converter_0.xcix] \
    [file join $xilinx_ip_dir axi_2x1_mux axi_2x1_mux.xci] \
    [file join $xilinx_ip_dir axi_crossbar_0 axi_crossbar_0.xcix] \
    [file join $xilinx_ip_dir axi_protocol_converter_0 axi_protocol_converter_0.xcix] \
    [file join $xilinx_ip_dir axi_vdma_0 axi_vdma_0.xcix] \
    [file join $xilinx_ip_dir clk_wiz_vga clk_wiz_vga.xcix] \
    [file join $xilinx_ip_dir v_axi4s_vid_out_0 v_axi4s_vid_out_0.xcix] \
    [file join $xilinx_ip_dir v_tc_0 v_tc_0.xcix] \
]

# These four files occur in the XPR with AutoDisabled=1. They are still added
# to reproduce its source set, then explicitly disabled below.
set disabled_ip_files [list \
    [file join $xilinx_ip_dir sram_32x52bit sram_32x52bit.xci] \
    [file join $xilinx_ip_dir sram_128x22 sram_128x22.xci] \
    [file join $xilinx_ip_dir sram_128x32 sram_128x32.xci] \
    [file join $xilinx_ip_dir sram_128x64 sram_128x64.xci] \
]

set mig_prj [file join $xilinx_ip_dir mig_axi_32_loongson mig_a.prj]
set constraint_file [file join $constr_dir soc_up.xdc]

# Validate all XPR-recorded inputs before deleting an existing generated project.
require_files "RTL source files" $design_files
require_files "Xilinx IP files" [concat $active_ip_files $disabled_ip_files]
require_files "MIG project file" [list $mig_prj]
require_files "constraint file" [list $constraint_file]

# -----------------------------------------------------------------------------
# Create project
# -----------------------------------------------------------------------------

file delete -force $project_path
create_project -force $project_name $project_path -part $project_part

# Match the XPR project settings relevant to source handling.
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]
set_property target_simulator XSim [current_project]
set_property coreContainer.enable 1 [current_project]

# Add conventional sources without recursively importing unrelated RTL that was
# not present in the XPR.
add_files -fileset sources_1 -norecurse $design_files

# Add the IP customization/container files.
add_files -fileset sources_1 -norecurse -quiet $active_ip_files
add_files -fileset sources_1 -norecurse -quiet $disabled_ip_files

foreach path $disabled_ip_files {
    set obj [get_project_file $path]

    if {[llength $obj] != 0} {
        set_property IS_ENABLED false $obj
    }
}

# The MIG XCI normally discovers mig_a.prj. Add it only if Vivado did not do so
# automatically, then reproduce the XPR's synthesis-only cell scope.
set mig_prj_obj [get_project_file $mig_prj]

if {[llength $mig_prj_obj] == 0} {
    add_files -fileset sources_1 -norecurse $mig_prj
    set mig_prj_obj [get_project_file $mig_prj]
}

set_property USED_IN {synthesis} $mig_prj_obj
set_property SCOPED_TO_CELLS {mig_axi_32} $mig_prj_obj

# Preserve the CPU-source behavior from the supplied template. This block is
# deliberately separate because these files were not listed in system_run.xpr.
if {$include_mycpu} {
    set cpu_rtl_dir [file join $ip_dir myCPU FPGA]

    if {![file isdirectory $cpu_rtl_dir]} {
        error "include_mycpu=1, but the CPU RTL directory does not exist: $cpu_rtl_dir"
    }

    add_files -fileset sources_1 -scan_for_includes $cpu_rtl_dir

    set cpu_xilinx_ip_dir [file join $ip_dir myCPU xilinx_ip]

    if {[file isdirectory $cpu_xilinx_ip_dir]} {
        set cpu_ip_files [concat \
            [glob -nocomplain [file join $cpu_xilinx_ip_dir * *.xci]] \
            [glob -nocomplain [file join $cpu_xilinx_ip_dir * *.xcix]] \
        ]

        if {[llength $cpu_ip_files] != 0} {
            add_files -fileset sources_1 -norecurse -quiet $cpu_ip_files
        }
    }
}

# Add the XDC to the constraint fileset.
add_files -fileset constrs_1 -norecurse $constraint_file

# Match the XPR: both design and simulation use soc_top, and there are no
# independent testbench sources in sim_1.
set_property top soc_top [get_filesets sources_1]
set_property top soc_top [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]

# The XPR uses the default synthesis and implementation strategies, not the two
# performance strategies from the older template.
set_property strategy {Vivado Synthesis Defaults} [get_runs synth_1]
set_property strategy {Vivado Implementation Defaults} [get_runs impl_1]

if {$upgrade_ips} {
    set ips [get_ips -quiet]

    if {[llength $ips] != 0} {
        upgrade_ip -quiet $ips
    }
}

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "Created Vivado project: [file join $project_path ${project_name}.xpr]"
