<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--<jsp:include page="header.jsp" />-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 Not Found API</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="/Seng3011Client/resources/css/bootstrap.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/style.css" rel="stylesheet">
<link href="/Seng3011Client/resources/css/mega-menu.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Karla:400,400italic,700,700italic" rel="stylesheet" type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:400,300" rel="stylesheet" type='text/css'>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/Seng3011Client/resources/js/bootstrap.min.js"></script>
<script src="/Seng3011Client/resources/js/jquery.min.js"></script>
<script src="/Seng3011Client/resources/js/my.js"></script>
<script src="/Seng3011Client/resources/js/vector.js"></script>
<style>
.inside-align {
	padding: 20px;
}
.ver td:first-child {
	line-height: 85px;
}
.ver td:nth-child(2) {
	line-height: 85px;
}
.ver td:last-child {
	line-height: 85px;
}
</style>
</head>
<body>
<div id="container">
    <div id="output"></div>
</div>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">Version 2.0 Documentation</div>
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#one" data-toggle="tab">Details</a></li>
            <li><a href="#two" data-toggle="tab">General Information</a></li>
            <li><a href="#three" data-toggle="tab">Tutorial</a></li>
        </ul>
        <div id="myTabContent" class="tab-content pad">
            <div class="tab-pane fade in active inside-align" id="one"> <b>Date of Release</b><br>
                <br>
                13/04/17<br>
                <br>
                <b>Implementation in this version</b><br>
                <br>
                - The API is able to make request to the News API<br>
                - The API is able to return output JSON file with corresponding result<br>
                - The API website provides tutorial of using it on different platform<br>
                - The API website provides test data<br>
                - The API website provides detailed description of URL parameters<br>
                - The API website provides detailed description of output format<br>
                - The API website provides user-friendly URL generator<br>
                - The API is able to return XML file with corresponding result<br>
                - The API is able to keep multiple version<br>
                - The API has log file<br>
                - The API has error message<br>
                <br>
                <b>Differences with previous version</b><br>
                <br>
                - The API provides more detailed tutorial information, including the description of URL parameters, output format and error message<br>
                - New user-friendly URL generator, which provides users option that select or fill in version, date, instrument ID and topic codes with GUI and display returned data on the screen<br>
                - New XML return format supported by Java and Linux call<br>
                - Multiple version API used supported, users can use any released API version<br>
                - Log file supported, including developerTeam, moduleName, version, serverStat, endExecutionDate, elapsedTime, outPutFileName, topicCodes, instrumentIDs and startExecutionDate<br>
                - Error message supported<br>
                <br>
                <br>
                <b>Other Information</b><br>
                <br>
                More information about URL parameter description, output description, API running instruction, program call and test data, please check tutorial.<br>
            </div>
            <div class="tab-pane fade in inside-align" id="two"> <b>The API URL consists of 5 parameters:</b><br>
                <br>
                <table class="table table-striped">
                    <tr class="bold">
                        <td>Parameter</td>
                        <td>Format</td>
                        <td>Example</td>
                        <td>Empty</td>
                    </tr>
                    <tr>
                        <td>API Version</td>
                        <td>/apiv[0-9]+</td>
                        <td>/apiv2</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>Start Date</td>
                        <td>/start-date/yyyy-MM-ddTHH:mm:ssZ</td>
                        <td>/start-date/2015-10-01T00:00:00Z</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>End Date</td>
                        <td>/end-date/yyyy-MM-ddTHH:mm:ssZ</td>
                        <td>/end-date/2015-10-10T00:00:00Z</td>
                        <td>No</td>
                    </tr>
                    <tr class="ver">
                        <td>Instrument ID</td>
                        <td>/instrumentId/"Exchange Ticker code"."Exchange Identifier Code"</td>
                        <td>For single id:<br>
                            /instrumentId/BHP.AX/<br>
                            For multiple id: (seperate id by ",")<br>
                            /instrumentId/BHP.AX,BLT.L/</td>
                        <td>Yes</td>
                    </tr>
                    <tr class="ver">
                        <td>Topic ID</td>
                        <td>/topic-codes/"topic codes"</td>
                        <td>For single id:<br>
                            /topic-codes/AMERS<br>
                            For multiple id: (seperate id by ",")<br>
                            /topic-codes/AMERS,COM</td>
                        <td>Yes</td>
                    </tr>
                </table>
                - The "API Version" allows you to use any released version of API. But normally, the new versions are more powerful<br>
                - The "Start Date" and "End Date" are the time boundary of what you want to search<br>
                - The "Instrument ID" and "Topic ID" are a list of id of what you interested<br>
                - Multiple values are seperated by "," ("Instrument ID" and "Topic ID")<br>
                - "API Version", "Start Date" and "End Date" cannot be empty<br>
                - When "Topic ID" or "Instrument ID" is empty, nothing will be enterd for this field (See "Test Data" below)<br>
                - The returned data is in JSON format<br>
                - Parameters are entered in order<br>
                <br>
                The total URL format is:<br>
                159.203.160.38:8080/Seng3011/apiv[0-9]+/start-date/yyyy-MM-ddTHH:mm:ssZ/end-date/yyyy-MM-ddTHH:mm:ssZ/instrumentId/"Exchange Ticker code"."Exchange Identifier Code"/topic-codes/"topic codes"<br>
                <br>
                An example is:<br>
                159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM<br>
                <br>
                <br>
                <b>Extra Useful Information</b><br>
                <br>
                <b>Instrument ID Introduction</b><br>
                <br>
                <a href="https://www.sirca.org.au/2011/01/what-is-a-ric/">https://www.sirca.org.au/2011/01/what-is-a-ric/</a><br>
                <br>
                <b>Topic Code List</b><br>
                <br>
                <a href="https://customers.reuters.com/training/trainingCRMdata/promo_content/ReutersCodes.pdf">https://customers.reuters.com/training/trainingCRMdata/promo_content/ReutersCodes.pdf</a> </div>
            <div class="tab-pane fade in inside-align" id="three">
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Use with different languages</div>
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#two-java" data-toggle="tab">Java</a></li>
                        <li><a href="#two-linux" data-toggle="tab">Linux</a></li>
                        <li><a href="#two-web" data-toggle="tab">Web</a></li>
                    </ul>
                    <div id="myTabContent1" class="tab-content pad">
                        <div class="tab-pane fade in active inside-align" id="two-java"> String uri ="http://159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/COM";<br>
                            URL url = new URL(uri);<br>
                            HttpURLConnection connection =  (HttpURLConnection) url.openConnection();<br>
                            connection.setRequestMethod("GET");<br>
                            <br>
                            <b>//Get JSON output format</b><br>
                            connection.setRequestProperty("Accept", "application/json");<br>
                            <br>
                            <b>//Get XML output format</b><br>
                            connection.setRequestProperty("Accept", "application/xml");<br>
                            <br>
                            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream())); </div>
                        <div class="tab-pane fade inside-align" id="two-linux"> <b>//Get JSON output format</b><br>
                            curl -H "Accept: application/json" -H "Content-Type: application/json" "159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L"<br>
                            <br>
                            <b>//Get XML output format</b><br>
                            curl -H "Accept: application/xml" -H "Content-Type: application/xml" "159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L"<br>
                            <br>
                        </div>
                        <div class="tab-pane fade inside-align" id="two-web"> <b>Enter the following URL to web browser</b><br>
                            <br>
                            159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM </div>
                    </div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Test Data</div>
                    <div class="pad2 inside-align"> <b>1. Request all news</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z<br>
                        <br>
                        <b>2. Request with specific instrument ID and topic code (accept multiple value)</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM<br>
                        <br>
                        <b>3. Request with only instrument ID</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/<br>
                        <br>
                        <b>4. Request with only topic code</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/topic-codes/ASIA </div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Output Format & Example</div>
                    <div class="inside-align"> <b>Response Format:</b><br>
                        <br>
                        JSON, XML<br>
                        <br>
                        <b>Example Output URL (JSON):</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM<br>
                        <br>
                        <b>Response JSON:</b><br>
                        <br>
                        <pre style="max-height:300px;"><code class="json">
    {
      "logFileSuccess": {
        "developerTeam": "404 not found Team",
        "moduleName": "news api",
        "version": "v2",
        "serverStat": "200",
        "endExecutionDate": "2017/04/13 17:10:20",
        "elapsedTime": 0.26,
        "outPutFileName": 1492067420209,
        "topicCodes": "[AMERS, COM]",
        "instrumentIDs": "[RIC_BHP.AX, RIC_BLT.L]",
        "startExecutionDate": "2017/04/13 17:10:19"
      },
      "newsDataSet": [
        {
          "instrumentIDs": [
            "RIC_BLT.L",
            "RIC_BHP.AX"
          ],
          "topicCodes": [
            "N2:AMERS",
            "N2:COM"
          ],
          "timeStamp": "2015-10-01T18:35:46.961Z",
          "headline": "UPDATE 1-Peru copper output surges again in August on Antamina, new mines",
          "newsText": " (Adds August production data for certain mines)\n    LIMA, Oct 1 (Reuters) - Copper production in Peru, the\nworld's No. 3 producer of the red metal, surged 30 percent for a\nsecond straight month in August while gold, zinc and tin output\nall dropped, the Energy and Mines Ministry said on Thursday.\n    Rising output from new mines and a 20 percent jump at\nAntamina, a top producer, drove the copper surge in August.\nAntamina, whose 2014 output fell on weak grades, is owned by BHP\nBilliton <BHP.AX> <BLT.L> and Glencore PLC <GLEN.L>.\n    Chinalco Mining Corp's <3668.HK> Toromocho deposit, where\noutput has been ramping up, produced some 17,400 tonnes in\nAugust. Hudbay Minerals Inc's <HBM.TO> new Constancia mine\nchurched out 13,000 tonnes, official data showed.\n    Gold production was dragged down by an estimated drop in\nunregulated gold mining in Madre de Dios, the ministry said. The\ngovernment renewed a crackdown on illegal gold mines, which sell\nore into the legal supply chain, in July. [ID:nL2N0ZV11U]\n    Peru was the world's third biggest zinc, tin and silver\nproducer and seventh top gold producer last year, according to\nthe government.\n    The following are official mineral output figures for\nAugust:\n\n    METAL             AUGUST               PCT CHANGE\n    Copper            156,229 tonnes       +31.73\n    Gold              12,298,056 ounces     -3.52\n    Silver            11,246,128 ounces     +8.47\n    Zinc              122,646 tonnes        -9.42\n    Lead              25,810 tonnes         +4.64\n    Iron              668,730 tonnes       +87.46\n    Tin               1,693 tonnes          -5.70\n    \n\n (Reporting by Mitra Taj)\n ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters\nMessaging: mitra.taj.thomsonreuters.com@reuters.net))\n\nKeywords: PERU MINERALS/OUTPUT"
        },
        {
          "instrumentIDs": [
            "RIC_BLT.L",
            "RIC_BHP.AX"
          ],
          "topicCodes": [
            "N2:AMERS",
            "N2:COM"
          ],
          "timeStamp": "2015-10-02T06:56:03.968Z",
          "headline": "Total iron ore exports from Port Hedland hit record in Sept",
          "newsText": "    SYDNEY, Oct 2 (Reuters) - Australia's Port Hedland on Friday\nreported record monthly iron ore shipments of 39.3 million\ntonnes in September, an 8-percent rise from a year ago and\nslightly above the August level.\n    Most of the ore is shipped each month to steel mills and\nports in China, though figures on individual destinations were\nnot released by the Pilbara Ports Authority. \n    Iron ore has supplanted coal and gold as Australia's biggest\nsource of foreign income, despite the price plunging as low as\n$44.10 a tonne in July - less than half what it was a year\nearlier. Iron ore has since rebounded to stand at $54.40 a tonne\n<.IO62-CNI=SI>.\n    Port Hedland, which handles about a fifth of the world's\nseaborne iron ore trade, is used by BHP Billiton <BHP.AX>\n<BLT.L> and Fortescue Metals Group <FMG.AX>.\n    While global iron ore trade is forecast to increase by only\n1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of\ngrowth since 2001, supply from Australia is projected to\nincrease by 6 percent to 762 million tonnes, according to\nAustralia's Department of Industry and Science.\n    BHP is lifting output by 6 percent to 247 million tonnes by\nnext July, while Fortescue is running at an annual rate of\naround 165 million tonnes, making them the third and fourth\nlargest producers worldwide after Vale <VALE5.SA> and Rio Tinto\n<RIO.AX> <RIO.L>.\n\n (Reporting by James Regan; Editing by Joseph Radford)\n ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters\nMessaging: jim.regan.reuters.com@reuters.net))\n\nKeywords: HEDLAND AUSTRALIA/IRON"
        },
        {
          "instrumentIDs": [
            "RIC_BLT.L",
            "RIC_BHP.AX"
          ],
          "topicCodes": [
            "N2:AMERS"
          ],
          "timeStamp": "2015-10-05T04:02:15.701Z",
          "headline": "BUZZ-Asia materials extend gains on stability in China PMI",
          "newsText": "    ** Thomson Reuters Asia Pacific Basic Materials index\n<.TRXFLDAZPUMAT> up 2.1 pct; heads towards its second\nconsecutive session of gains\n    ** Signs of some stability in official China PMI coupled\nwith govt. quickening growth supportive actions evokes interest\nin the beaten down sector\n    ** China Sept. NBS manufacturing PMI 49.8 vs forecast 49.6,\nAug 49.7; Non-mfg PMI 53.4, same as Aug\n    ** A private survey by Caixin/Markit focusing on small\nfactories was little changed from August's 47.3\n    ** Improvement in production and new orders lead to slightly\nbetter headline PMI - BofA ML\n    ** \"We have been overweight on tech given its exposure to\nthe US, but we now wonder with the stabilisation in the official\nChina PMI whether investors should also look at materials where\nP/B is the lowest of 15 years,\" Credit Suisse analysts Sakthi\nSiva and Kin Nang Chik says\n    ** China quickens growth-supportive policy initiatives -\ncuts purchase tax by 50% for small autos; PBoC lowers minimum\ndown payment ratio to 25% from 30% for first home mortgage \n    ** Also, weak US jobs dampen prospects of near-term Fed hike\n[ID:nLNN2LEBGC]\n    ** Australia's BHP Billiton <BHP.AX> up 3.9% , Newcrest\n<NCM.AX> jumps 8.8% while Rio Tinto <RIO.AX> rises 2.3%\n    ** Japan's JFE Holdings <5411.T> advances 4.5 pct,\nMitsubishi Chemical Holding <4188.T> gains 4.2 pct, Nippon Paint\n<4612.T> jumps 6.4 pct\n\n\n\n\n (RM: abhishek.vishnoi.thomsonreuters.com@reuters.net)\n ((abhishek.vishnoi@thomsonreuters.com; +91 22 61807225))"
        },
        {
          "instrumentIDs": [
            "RIC_BLT.L",
            "RIC_BHP.AX"
          ],
          "topicCodes": [
            "N2:COM"
          ],
          "timeStamp": "2015-10-05T07:20:32.012Z",
          "headline": "Faltering Chinese demand keeps beating down coal prices ",
          "newsText": "    * Morgan Stanley cuts long-term coal price forecast\n    * Producers benefit from weaker currencies to lift\nproduction\n    * Coal most prominent victim of end of commodity\n\"super-cycle\"\n\n    By Jacob Gronholt-Pedersen and Henning Gloystein\n    SINGAPORE, Oct 5 (Reuters) - Slumping Chinese demand\ncontinues to batter thermal coal prices in the first week of the\nfourth quarter, with benchmark physical cargoes dropping to\ntheir lowest in more than eight years. \n    That has made coal, mostly used for power generation in\nemerging markets, the most prominent victim of what some say is\nthe end of a commodity \"super-cycle\" that followed the rapid\nindustrialisation of China after it opened up in the 1980s.\n[ID:nL5N1222IU]\n    Prompt cargo prices from Australia's Newcastle\n<GCLNWCPFBMc1> and from South Africa's Richards Bay\n<GCLRCBPFBMc1> terminals have both dropped to around $50 per\ntonne, close to levels last seen in the first half of 2007.\n[ID:nL5N11L02O] \n    Key coal futures prices <TRAPI2Yc1> last week settled below\n$50 per tonne for the first time since 2003, having fallen in\ntwelve of the last fourteen weeks.\n    \"Declining thermal coal prices reflects abatement in China's\nindustrial activity,\" said Tom Price, analyst at U.S. investment\nbank Morgan Stanley.\n    The bank on Monday cut its long-term price forecast by 11\npercent to $63 per tonne on a free-on-board basis (FOB), as\ndemand in China drops amid abundant supply.   \n    U.S. competitor Goldman Sachs said in September the resource\nwould never again gain enough traction to lift it out of its\nslump and warrant investment into the sector. [ID:nL5N11T014]\n    Coal is the main fuel for electricity in China, but power\noutput is now growing at only 4 percent per year, far below\nannual growth rates of around 10 percent since 2000, Morgan\nStanley noted.\n    China's coal imports have collapsed some 30 percent since\nthe beginning of the year, even as major producers China Shenhua\nEnergy <601088.SS> <1088.HK> and China Coal Energy <601898.SS>\n<601898.HK> cut domestic output.\n    Morgan Stanley expects a short-term recovery in coal prices\nover the next year, followed by a flat price outlook for an\nextended period.\n    The fall in coal prices, along with routs for other mined\nraw materials such as iron ore, has contributed to a clobbering\nof the shares of BHP Billiton <BHP.AX>, Rio Tinto <RIO.AX> and\nother mining giants, which have taken a bigger beating than\nthose of most energy firms. [ID:nL5N11Z1DK]\n    Weakening currencies of resource-rich producers such as\nAustralia, South Africa and Columbia has also added to the glut\nof coal and other mined commodities. \n    \"In the massive, highly competitive global thermal coal\ntrade, any favourable exchange rate move simply encourages\nexposed miners to lift or sustain production rates in order to\npreserve market share,\" Morgan Stanley's Price said.\n    A drop in oil prices have also helped miners lower\nproduction costs by 5 to 10 percent this year, he said.\n\n    <^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\nGRAPHIC-API2 coal futures:    http://link.reuters.com/rap75w\nGRAPHIC-Coal producer share prices:     http://link.reuters.com/tap75w\n    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^>\n (Editing by Tom Hogue)\n ((jacob.pedersen@thomsonreuters.com; +65 6417 4529; Reuters\nMessaging: jacob.pedersen.thomsonreuters.com@reuters.net))\n\nKeywords: CHINA COAL/PRICES"
        }
      ]
    }                              
                              </code>
                        </pre>
                        <br>
                        <br>
                        <b>Example Output using linux (XML):</b><br>
                        <br>
                        curl -H "Accept: application/xml" -H "Content-Type: application/xml" "159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/COM" <br>
                        <br>
                        <b>Response XML:</b><br>
                        <br>
                        <pre style="max-height:300px;"><code class="json">
&lt;NewsResponseSuccess&gt;
    &lt;logFileSuccess&gt;
        &lt;developerTeam&gt;404 not found Team&lt;/developerTeam&gt;
        &lt;moduleName&gt;news api&lt;/moduleName&gt;
        &lt;version&gt;v2&lt;/version&gt;
        &lt;serverStat&gt;200&lt;/serverStat&gt;
        &lt;endExecutionDate&gt;2017/04/14 17:52:50&lt;/endExecutionDate&gt;
        &lt;elapsedTime&gt;0.106&lt;/elapsedTime&gt;
        &lt;outPutFileName&gt;1.492156370514E12&lt;/outPutFileName&gt;
        &lt;topicCodes&gt;[COM]&lt;/topicCodes&gt;
        &lt;instrumentIDs&gt;[RIC_BHP.AX, RIC_BLT.L]&lt;/instrumentIDs&gt;
        &lt;startExecutionDate&gt;2017/04/14 17:52:50&lt;/startExecutionDate&gt;
    &lt;/logFileSuccess&gt;
    &lt;newsDataSet&gt;
        &lt;newsDataSet&gt;
            &lt;instrumentIDs&gt;
                &lt;instrumentIDs&gt;RIC_BLT.L&lt;/instrumentIDs&gt;
                &lt;instrumentIDs&gt;RIC_BHP.AX&lt;/instrumentIDs&gt;
            &lt;/instrumentIDs&gt;
            &lt;topicCodes&gt;
                &lt;topicCodes&gt;N2:COM&lt;/topicCodes&gt;
            &lt;/topicCodes&gt;
            &lt;timeStamp&gt;2015-10-01T18:35:46.961Z&lt;/timeStamp&gt;
            &lt;headline&gt;UPDATE 1-Peru copper output surges again in August on Antamina, new mines&lt;/headline&gt;
            &lt;newsText&gt; (Adds August production data for certain mines)
    LIMA, Oct 1 (Reuters) - Copper production in Peru, the
world's No. 3 producer of the red metal, surged 30 percent for a
second straight month in August while gold, zinc and tin output
all dropped, the Energy and Mines Ministry said on Thursday.
    Rising output from new mines and a 20 percent jump at
Antamina, a top producer, drove the copper surge in August.
Antamina, whose 2014 output fell on weak grades, is owned by BHP
Billiton &lt;BHP.AX&gt; &lt;BLT.L&gt; and Glencore PLC &lt;GLEN.L&gt;.
    Chinalco Mining Corp's &lt;3668.HK&gt; Toromocho deposit, where
output has been ramping up, produced some 17,400 tonnes in
August. Hudbay Minerals Inc's &lt;HBM.TO&gt; new Constancia mine
churched out 13,000 tonnes, official data showed.
    Gold production was dragged down by an estimated drop in
unregulated gold mining in Madre de Dios, the ministry said. The
government renewed a crackdown on illegal gold mines, which sell
ore into the legal supply chain, in July. [ID:nL2N0ZV11U]
    Peru was the world's third biggest zinc, tin and silver
producer and seventh top gold producer last year, according to
the government.
    The following are official mineral output figures for
August:

    METAL             AUGUST               PCT CHANGE
    Copper            156,229 tonnes       +31.73
    Gold              12,298,056 ounces     -3.52
    Silver            11,246,128 ounces     +8.47
    Zinc              122,646 tonnes        -9.42
    Lead              25,810 tonnes         +4.64
    Iron              668,730 tonnes       +87.46
    Tin               1,693 tonnes          -5.70
    

 (Reporting by Mitra Taj)
 ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters
Messaging: mitra.taj.thomsonreuters.com@reuters.net))

Keywords: PERU MINERALS/OUTPUT&lt;/newsText&gt;
        &lt;/newsDataSet&gt;
        &lt;newsDataSet&gt;
            &lt;instrumentIDs&gt;
                &lt;instrumentIDs&gt;RIC_BLT.L&lt;/instrumentIDs&gt;
                &lt;instrumentIDs&gt;RIC_BHP.AX&lt;/instrumentIDs&gt;
            &lt;/instrumentIDs&gt;
            &lt;topicCodes&gt;
                &lt;topicCodes&gt;N2:COM&lt;/topicCodes&gt;
            &lt;/topicCodes&gt;
            &lt;timeStamp&gt;2015-10-02T06:56:03.968Z&lt;/timeStamp&gt;
            &lt;headline&gt;Total iron ore exports from Port Hedland hit record in Sept&lt;/headline&gt;
            &lt;newsText&gt;    SYDNEY, Oct 2 (Reuters) - Australia's Port Hedland on Friday
reported record monthly iron ore shipments of 39.3 million
tonnes in September, an 8-percent rise from a year ago and
slightly above the August level.
    Most of the ore is shipped each month to steel mills and
ports in China, though figures on individual destinations were
not released by the Pilbara Ports Authority. 
    Iron ore has supplanted coal and gold as Australia's biggest
source of foreign income, despite the price plunging as low as
$44.10 a tonne in July - less than half what it was a year
earlier. Iron ore has since rebounded to stand at $54.40 a tonne
&lt;.IO62-CNI=SI&gt;.
    Port Hedland, which handles about a fifth of the world's
seaborne iron ore trade, is used by BHP Billiton &lt;BHP.AX&gt;
&lt;BLT.L&gt; and Fortescue Metals Group &lt;FMG.AX&gt;.
    While global iron ore trade is forecast to increase by only
1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of
growth since 2001, supply from Australia is projected to
increase by 6 percent to 762 million tonnes, according to
Australia's Department of Industry and Science.
    BHP is lifting output by 6 percent to 247 million tonnes by
next July, while Fortescue is running at an annual rate of
around 165 million tonnes, making them the third and fourth
largest producers worldwide after Vale &lt;VALE5.SA&gt; and Rio Tinto
&lt;RIO.AX&gt; &lt;RIO.L&gt;.

 (Reporting by James Regan; Editing by Joseph Radford)
 ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters
Messaging: jim.regan.reuters.com@reuters.net))

Keywords: HEDLAND AUSTRALIA/IRON&lt;/newsText&gt;
        &lt;/newsDataSet&gt;
        &lt;newsDataSet&gt;
            &lt;instrumentIDs&gt;
                &lt;instrumentIDs&gt;RIC_BLT.L&lt;/instrumentIDs&gt;
                &lt;instrumentIDs&gt;RIC_BHP.AX&lt;/instrumentIDs&gt;
            &lt;/instrumentIDs&gt;
            &lt;topicCodes&gt;
                &lt;topicCodes&gt;N2:COM&lt;/topicCodes&gt;
            &lt;/topicCodes&gt;
            &lt;timeStamp&gt;2015-10-05T07:20:32.012Z&lt;/timeStamp&gt;
            &lt;headline&gt;Faltering Chinese demand keeps beating down coal prices &lt;/headline&gt;
            &lt;newsText&gt;    * Morgan Stanley cuts long-term coal price forecast
    * Producers benefit from weaker currencies to lift
production
    * Coal most prominent victim of end of commodity
"super-cycle"

    By Jacob Gronholt-Pedersen and Henning Gloystein
    SINGAPORE, Oct 5 (Reuters) - Slumping Chinese demand
continues to batter thermal coal prices in the first week of the
fourth quarter, with benchmark physical cargoes dropping to
their lowest in more than eight years. 
    That has made coal, mostly used for power generation in
emerging markets, the most prominent victim of what some say is
the end of a commodity "super-cycle" that followed the rapid
industrialisation of China after it opened up in the 1980s.
[ID:nL5N1222IU]
    Prompt cargo prices from Australia's Newcastle
&lt;GCLNWCPFBMc1&gt; and from South Africa's Richards Bay
&lt;GCLRCBPFBMc1&gt; terminals have both dropped to around $50 per
tonne, close to levels last seen in the first half of 2007.
[ID:nL5N11L02O] 
    Key coal futures prices &lt;TRAPI2Yc1&gt; last week settled below
$50 per tonne for the first time since 2003, having fallen in
twelve of the last fourteen weeks.
    "Declining thermal coal prices reflects abatement in China's
industrial activity," said Tom Price, analyst at U.S. investment
bank Morgan Stanley.
    The bank on Monday cut its long-term price forecast by 11
percent to $63 per tonne on a free-on-board basis (FOB), as
demand in China drops amid abundant supply.   
    U.S. competitor Goldman Sachs said in September the resource
would never again gain enough traction to lift it out of its
slump and warrant investment into the sector. [ID:nL5N11T014]
    Coal is the main fuel for electricity in China, but power
output is now growing at only 4 percent per year, far below
annual growth rates of around 10 percent since 2000, Morgan
Stanley noted.
    China's coal imports have collapsed some 30 percent since
the beginning of the year, even as major producers China Shenhua
Energy &lt;601088.SS&gt; &lt;1088.HK&gt; and China Coal Energy &lt;601898.SS&gt;
&lt;601898.HK&gt; cut domestic output.
    Morgan Stanley expects a short-term recovery in coal prices
over the next year, followed by a flat price outlook for an
extended period.
    The fall in coal prices, along with routs for other mined
raw materials such as iron ore, has contributed to a clobbering
of the shares of BHP Billiton &lt;BHP.AX&gt;, Rio Tinto &lt;RIO.AX&gt; and
other mining giants, which have taken a bigger beating than
those of most energy firms. [ID:nL5N11Z1DK]
    Weakening currencies of resource-rich producers such as
Australia, South Africa and Columbia has also added to the glut
of coal and other mined commodities. 
    "In the massive, highly competitive global thermal coal
trade, any favourable exchange rate move simply encourages
exposed miners to lift or sustain production rates in order to
preserve market share," Morgan Stanley's Price said.
    A drop in oil prices have also helped miners lower
production costs by 5 to 10 percent this year, he said.

    &lt;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
GRAPHIC-API2 coal futures:    http://link.reuters.com/rap75w
GRAPHIC-Coal producer share prices:     http://link.reuters.com/tap75w
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^&gt;
 (Editing by Tom Hogue)
 ((jacob.pedersen@thomsonreuters.com; +65 6417 4529; Reuters
Messaging: jacob.pedersen.thomsonreuters.com@reuters.net))

Keywords: CHINA COAL/PRICES&lt;/newsText&gt;
        &lt;/newsDataSet&gt;
    &lt;/newsDataSet&gt;
&lt;/NewsResponseSuccess&gt;
                              </code>
                        </pre>
                        <br>
                        - Data returned with requested instrument ID and Topic Code<br>
                        - Each News in the newsList contains its instrument ID and Topic Code(s), time(yyyy-MM-ddThh:mm:ss:SSSZ), headline(Title) and newsBody(content)<br>
                        - Repeated News are eliminated<br>
                        - Log file supported<br>
                        - Error message supported, belows are error types<br>
                        <br>
                        <table class="table table-striped">
                            <tr class="bold">
                                <td>Error type</td>
                                <td>Message</td>
                                <td>Possible Cause</td>
                                <td>Example</td>
                            </tr>
                            <tr>
                                <td>404 Not Found</td>
                                <td>Url Not exist</td>
                                <td>Invalid URL</td>
                                <td>159.203.160.38:8080/Seng3011/apiv2/apple</td>
                            </tr>
                            <tr>
                                <td>204 News Not Found</td>
                                <td>News can not be found</td>
                                <td>1. Invalid instrument ID or topic codes<br>
                                    2. No relevant news found</td>
                                <td>159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/End-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/COS<br>
                                    <br>
                                    159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/End-date/2015-09-10T00:00:00Z/</td>
                            </tr>
                            <tr>
                                <td>204 Date Exception</td>
                                <td>1. End date is before start date<br>
                                    2. Date format is incorrect</td>
                                <td>Invalid date information</td>
                                <td>159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-9-10T00:00:00Z/instrumentId/BHP.AX,BLT.L<br>
                                    <br>
                                    159.203.160.38:8080/Seng3011/apiv2/start-date/2015-a10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L </td>
                            </tr>
                            <tr>
                                <td>204 RIC Exception</td>
                                <td>Instrument ID format is invalid</td>
                                <td>Invalid instrument ID format</td>
                                <td>159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/fd32f.L</td>
                            </tr>
                            <tr>
                                <td>204 TopicCodes Exception</td>
                                <td>TopicCode format is invalid.</td>
                                <td>Invalid topic codes format</td>
                                <td>159.203.160.38:8080/Seng3011/apiv2/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/2Af23fa</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr class="container">
    <footer class="container">
        <p>Design by 404 Not Found</p>
    </footer>
</div>

</body>
</html>