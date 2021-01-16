# Install CentOS7 on Oracle VirtualBox

1. Download and install Oracle VM VirtualBox <br>
Go to VirtualBox [website](https://www.virtualbox.org) to download the binary for your current operating system

2. Download the minimal version of Centos 7 ISO (no GUI)  <br>
You can download x86_64 version from one of the [mirror site](http://isoredirect.centos.org/centos/7/isos/x86_64)

3. Create virtual machine <br>
VM configuration <br>
Name   : lunchbox <br>
Type   : Linux <br>
Version : Red-hat (64-bit) <br> 
RAM : 4096 MB <br>
Storage On Physical Disk: Fixed size <br>
Size &nbsp; : 64 GB

4. Set processor to 2 CPU (recommended 4 CPU) <br>
Setting --> System --> Processor --> set number of CPU

5. Enable remote display <br>
Setting --> Display --> Remote display --> Enable remote display

6. Add network adapter 'Host-only Adapter' <br>
Setting --> Network --> Adapter 2 --> Enable Adapter --> Set attach to : Host-only Adapter


