# Data Transfer Tool

___
___
This tool has been developed for transferring data between locations on the Azimuth computing platform, or between external machines and the Azimuth computing platform in a self-consistent way. It records data transfer metrics and stores them for analysis. Please use this when transferring data to Azimuth so that the UKSRC can do statistical analysis on data transfer rates.
___
___
# Description

___
___
The data transfer tool is a script which uses rsync and tee to transfer data transfer information from rsync output and store it inside two .txt files. The first text flie contains the start and end times of the data transfer. The second file contains the output of the rsync commands. The data transfer script itself contains a line where the user can input their data transfer locations, and commented examples for transferring data within Azimuth, or between external machines and Azimuth.

## Component details
___
The user-facing component of this repository is a single script:

- `data_transfer_script.sh`

which can be modified and then used to transfer data between Azimuth and external machines while simultaneously recording data transfer metrics for analysis (e.g. for [TEAL-605](https://jira.skatelescope.org/browse/TEAL-605))
___
## In and outputs
___
### Inputs
To use this tool, the user must modify the line underneath the comment `WRITE YOUR TRANSFER LINE HERE` with the location of the data they wish to transfer, and the location they wish to transfer it to. If the transfer is between an external machine and Azimuth, the external machine address must also be included. The user can use the commented examples in the script as a template.

### Outputs
The outputs of the code are two .txt files, which will appear in the same directory as the data transfer script:
-`transfer_stats_01.txt`
-`transfer_stats_02.txt`

The first output file, `transfer_stats_01.txt` will contain the start and end times of the data transfer. The second output file, `transfer_stats_02.txt` will contain the rsync output from the data transfer. Using this information and the file size transferred, data transfer rates can be calculated for a given transfer. Note: if using this script twice in the same folder, previous output files will be overwritten, so make sure to move or rename them before running the data transfer script for a second time.

___
## Example usage
___

<details>
<summary>Detailed example</summary>

- It is highly recommended to activate `screen` before running the code so that long transfers continue even when you close your terminal, e.g.: `> screen -S your_session_name`.
- Open `data_transfer_script.sh` for modification using e.g. `> vi data_transfer_script.sh`.
- Edit line under `WRITE YOUR TRANSFER LINE HERE` using the commented examples as a template.
- Save your changes.
- Make sure code is executable using, e.g., `> chmod g+rwx data_transfer_script.sh`.
- Run code using `> . data_transfer_script.sh`.
- The code will create two files.
- If you created a screen before running the code and exited the terminal, you can rejoin the screen in a new terminal at any point using `> screen -r your_session_name`.

</details>

___
## Software requirements
___

<details>
<summary>Non-python Requirements</summary>

- [rsync](http://github.com/RsyncProject/rsync)
- [screen^]()

^recommended but not required to run code.
</details>

___
## Hardware requirements
___
As of now, no minimum Hardware requirements are known.
___
## Directory structure
___

<details>
<summary>File structure diagram</summary>

```md
data_transfer_tool
|--data_transfer_script.sh
|--Readme.md
|--.gitignore
```
</details>

Everything is contained in the base directory.

___
___
# To Do
___
___
Future improvements to this code could include:

- Better naming of output files so they do not overwrite past files if code is run multiple times.
- Containerising code.
- Automated calculation of data transfer rates
- Refining the rsync output which is stored
___
___
# Links to internal work

<details>
<summary>UKSRC GitHub development</summary>

- UKSRC GitHub development epic: [TEAL-606](https://jira.skatelescope.org/browse/TEAL-606)
- UKSRC GitHub development ticket: [TEAL-631](https://jira.skatelescope.org/browse/TEAL-631)
</details>

<details>
<summary>UKSRC data transfers</summary>

- Azimuth data transfer speed logs: [TEAL-605](https://jira.skatelescope.org/browse/TEAL-605)
- CSD3-Azimuth data transfer work: [Confluence](https://confluence.skatelescope.org/display/SRCSC/Transferring+SKA+Dataset+to+Azimuth+from+CSD3), [TEAL-521](https://jira.skatelescope.org/browse/TEAL-521)
- NRAO-Azimuth data transfer work: [Confluence](https://confluence.skatelescope.org/display/SRCSC/Transferring+data+from+NRAO+to+Azimuth), [TEAL-662](https://jira.skatelescope.org/browse/TEAL-662) 
</details>

# Developers and Contributors

- Walker, C.R.H. (UKSRC, University of Cambridge)
- Ye, H. (UKSRC, University of Cambridge)
- Burba, J. (UKSRC, University of Manchester)
___
