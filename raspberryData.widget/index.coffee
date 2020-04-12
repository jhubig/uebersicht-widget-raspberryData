#-----------------------------------------------------------------------#
# raspberryData for Übersicht
# Created April 2020 by Johannes Hubig

# THEME OPTIONS: dark or light	(default is dark)

theme		= 'dark'

# Position of the widget on your screen
pos_top		= '180px'
pos_left	= '330px'

#-----------------------------------------------------------------------#

if theme == 'dark'
  titleColor	= '#999999'
  infoColor		= '#CCCCCC'
  dataColor		= '#FFFFFF'
  lineColor		= '#b50039'
  barColor    = '#777777'
  bkground		= 'rgba(#000, 0.5)'

else if theme == 'light'
  titleColor	= '#71FF71'
  infoColor		= '#71FF71'
  dataColor		= '#FFFFFF'
  lineColor		= '#b50039'
  barColor    = '#AAAAAA'
  bkground		= 'rgba(#999, 0.5)'

else
  titleColor	= '#999999'
  infoColor		= '#CCCCCC'
  dataColor		= '#FFFFFF'
  lineColor		= '#b50039'
  barColor    = '#777777'
  bkground		= 'rgba(#000, 0.5)'

command: "raspberryData.widget/raspberryData.sh 2>/dev/null"

# Update every 60 seconds
refreshFrequency: 60000

style: """
  top:	#{pos_top}
  left:	#{pos_left}
  font-family: Avenir Next

  div.top
    border: 1px solid #{lineColor}
    border-radius 5px
    text-shadow: 0 0 1px #{bkground}
    background: #{bkground}
    font-size: 16px
    font-weight: 500
    width: 280px
    height: auto
    position: relative
    padding-bottom: 5px

  table.title
    font-size: 27px
    margin-left: 10px
    margin-top: 3px
    width: 95%
    color: #{titleColor}
    text-shadow: 2px 2px 5px #000
    border-spacing: 0

  tr.raspInfo
    font-size: 12px
    max-width: 100%
    color: #{infoColor}
    margin-left: 5px

  table.raspData
    margin-top: 0px
    margin-left: 5px
    font-size: 12px
    font-weight: 400
    width: 96%
    color: #{dataColor}
    text-shadow: 2px 2px 5px #000

  td.description
    text-align: left

  td.value
    text-align: right

  td.sectionTitle
    font-weight: 700

  hr
    margin-left: 5px
    margin-right: 5px

  .progressbar
    width: 100%
    position: absolute
    height: 16px
    background: #{barColor}
    border-radius: 3px
    margin-top: 0px
    max-width: 265px

  .progressbar div
    background: #64B5F6
    border-radius: 3px
    position: absolute
    left: 0
    top: 0
    bottom: 0

  h1
    overflow: hidden
    text-align: center
    font-weight: 600
    font-size: 12px
    color: #{dataColor}
    text-shadow: 2px 2px 5px #000
    margin-left: 5px
    margin-right: 5px
    margin-top: 2px
    margin-bottom: 2px

  h1:before, h1:after
    background-color: #FFF
    content: ""
    display: inline-block
    height: 1px
    position: relative
    vertical-align: middle
    width: 50%

  h1:before
    right: 0.5em
    margin-left: -50%

  h1:after
    left: 0.5em
    margin-right: -50%




"""

render: -> """
  <div class='top'>
    <table class='title'>
      <tbody>
      <tr>
        <td rowspan="2"><img style='vertical-align:middle; margin-top: 5px; margin-right:5px' src='raspberryData.widget/RPi-Logo-SCREEN.png' height=45px/></td>
        <td >My Raspberry Pi</td>
      </tr>
      <tr class='raspInfo'>
        <td><span id='model'>N/A</span></td>
      </tr>
      </tbody>
    </table>
    <h1 id='systemSection'>S Y S T E M</h1>
    <table class='raspData' id='systemSection'>
      <tbody>
      <tr>
        <td class='description'>OS</td>
        <td class='value'><span id='version'>N/A</span></td>
      </tr>
      <tr>
        <td class='description'>Kernel</td>
        <td class='value'><span id='kernelVersion'>N/A</span></td>
      </tr>
      <tr>
        <td class='description'>IP Address</td>
        <td class='value'><span id='ipAddress'>N/A</span></td>
      </tr>
      <tr>
        <td class='description'>Uptime</td>
        <td class='value'><span id='uptime'>N/A</span></td>
      </tr>
      </tbody>
    </table>
    <h1 id='cpuSection'>C P U</h1>
    <table class='raspData' id='cpuSection'>
      <tbody>
      <tr>
        <td class='description'>Model</td>
        <td class='value'><span id='cpuModel'>N/A</span></td>
      </tr>
      <tr>
        <td class='description'>Type</td>
        <td class='value'><span id='cpuType'>N/A</span></td>
      </tr>
      <tr>
        <td class='description'>Revision</td>
        <td class='value'><span id='cpuRevision'>N/A</span></td>
      </tr>
      <tr>
        <td class='description'>Temp</td>
        <td class='value'><span id='CoreTemp'>N/A</span></td>
      </tr>
      </tbody>
    </table>
    <h1 id='usageSection'>U S A G E</h1>
    <table class='raspData' id='usageSection'>
      <tbody>
      <tr>
        <td class='description'>Running processes</td>
        <td class='value'><span id='runningProcs'>N/A</span></td>
      </tr>
      <tr>
        <td>
          <div class="progressbar">
            <div id="barFillingMemory" style="width: 0%;"></div>
            <div style="width: 100%; background-color: transparent; text-align: right;" id='memory'>N/A</div>
            <div style="width: 100%; background-color: transparent; text-align: left;">&nbsp;Memory</div>
          </div>&nbsp;
        </td>
      </tr>
      <tr>
        <td>
          <div class="progressbar">
            <div id="barFillingDisk" style="width: 0%;"></div>
            <div style="width: 100%; background-color: transparent; text-align: right;" id='diskUsage'>N/A</div>
            <div style="width: 100%; background-color: transparent; text-align: left;">&nbsp;Disk Usage</div>
          </div>&nbsp;
        </td>
      </tr>
      </tbody>
    </table>
    <table class='raspData' id='errorSection'>
      <tbody>
      <tr>
        <td class='sectionTitle'>E R R O R</td>
      </tr>
      <tr>
        <td class='description'><span id='errorLog'>N/A</span></td>
      </tr>
      </tbody>
    </table>
  </div>
"""

update: (output,domEl) ->
  values	= output.split("\n")
  div			= $(domEl)

  div.find('#systemSection').css("display", "block")
  div.find('#cpuSection').css("display", "block")
  div.find('#usageSection').css("display", "block")
  div.find('#CoreTemp').html("N/A")

  if values[0].includes("host not found")
    div.find('#systemSection').css("display", "none")
    div.find('#cpuSection').css("display", "none")
    div.find('#usageSection').css("display", "none")
    div.find('#errorLog').html("Host <span style='font-style: italic;'>" + values[1] + "</span> cannot be found.
    Please check the raspberryData.sh for correct hostname/ip.")

  else if values[0].includes("no ssh")
    div.find('#systemSection').css("display", "none")
    div.find('#cpuSection').css("display", "none")
    div.find('#usageSection').css("display", "none")
    div.find('#errorLog').html("The host <span style='font-style: italic;'>" + values[2] + "</span> doesn' support ssh
    or user <span style='font-style: italic;'>" + values[1] + "</span> is not existing or ssh-keys are not existing. Check readme.")

  else
    div.find('#errorSection').css("display", "none")

    div.find('#CoreTemp').html(values[0] + " °C")

    div.find('#version').html(values[1])
    div.find('#model').html(values[2])
    div.find('#uptime').html(values[3])

    div.find('#memory').html(parseInt(values[4]) + " of " + parseInt(values[5]) + " MB free&nbsp;")
    div.find('#barFillingMemory').width(values[4]/values[5]*100*2.5)

    div.find('#ipAddress').html(values[6])
    div.find('#kernelVersion').html("Linux " + values[7])

    # Split disk usage output
    diskvalues	= values[8].split(" ")
    div.find('#diskUsage').html(diskvalues[3] + " of " + diskvalues[1] + " GB free&nbsp;")
    div.find('#barFillingDisk').width((diskvalues[1]-diskvalues[3])/diskvalues[1]*100*2.5)

    div.find('#runningProcs').html(values[9])
    div.find('#cpuType').html(values[10])
    div.find('#cpuRevision').html(values[11])
    div.find('#cpuModel').html(values[12])

    #div.find('#debug').html(values[15])
