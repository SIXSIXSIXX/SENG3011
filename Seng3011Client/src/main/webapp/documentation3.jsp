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
        <div class="panel-heading bold size2">Version 3.0 Documentation</div>
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#one" data-toggle="tab">Update Log</a></li>
            <li><a href="#two" data-toggle="tab">General Information for News API</a></li>
            <li><a href="#three" data-toggle="tab">General Information for Stock API</a></li>
            <li><a href="#four" data-toggle="tab">News API Tutorial</a></li>
            <li><a href="#five" data-toggle="tab">Stock API Tutorial</a></li>
            <li><a href="#six" data-toggle="tab">Auto Stock-trading System Tutorial</a></li>
        </ul>
        <div id="myTabContent" class="tab-content pad">
            <div class="tab-pane fade in active inside-align" id="one"> <b>Date of Release</b><br>
                <br>
                24/05/17<br>
                <br>
                <b>Implementation in this version</b><br>
                <br>
                - The API is able to make request to the News API and return output JSON file with corresponding result<br>
                - The API is able to make request to the Stock API and return output JSON file with corresponding result (Company's stock information and its relevant news)<br>
                - The API website provides tutorial of using it with different programming languages<br>
                - The API website provides test data<br>
                - The API website provides detailed description of URL parameters<br>
                - The API website provides detailed description of output contents and format<br>
                - The API website provides user-friendly URL generator<br>
                - The API is able to keep multiple versions<br>
                - The API return has log file and error message<br>
                - The API has result cache<br>
                - The API has auto stock-trading system<br>
                - The API provides influence prediction of news on relevant company's stock<br>
                <br>
                <b>Differences with previous version</b><br>
                <br>
                - New result cache feature enables immediate response of same multiple calls, 1000 requests with same content at the same time can be done in 2 seconds<br>
                - New company's stock information API that can obtain all open, close, highest and lowest price and news at the day (if any) in given date<br>
                - New auto stock-trading function (with visual indication of when to buy and sell) based on strategy using given investment capital, company ID and date(provided by user)<br>
                - Influence prediction (positoin, negative or neutral) of news on company's stock by using IBM API<br>
                <br>
                <br>
                <b>Other Information</b><br>
                <br>
                More information about URL parameter, output, API running instruction and auto stock-trading system instruction, please check tutorial.<br>
            </div>
            <div class="tab-pane fade in inside-align" id="two"> <b>The API URL consists of 5 parameters:</b><br>
                <br>
                <table class="table table-striped">
                    <tr class="bold">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Format</td>
                        <td>Example</td>
                        <td>Empty</td>
                    </tr>
                    <tr>
                        <td>API Version</td>
                        <td>API version that you want to use</td>
                        <td>/apiv[0-9]+</td>
                        <td>/apiv3</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>Function</td>
                        <td>Function that you will use(News, Stock)</td>
                        <td>/news</td>
                        <td>/news</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>Start Date</td>
                        <td>Date that News start from</td>
                        <td>/start-date/yyyy-MM-ddTHH:mm:ssZ</td>
                        <td>/start-date/2015-10-01T00:00:00Z</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>End Date</td>
                        <td>Date that News end at</td>
                        <td>/end-date/yyyy-MM-ddTHH:mm:ssZ</td>
                        <td>/end-date/2015-10-10T00:00:00Z</td>
                        <td>No</td>
                    </tr>
                    <tr class="ver">
                        <td>Instrument ID</td>
                        <td>Reuters Instrument Code(s)</td>
                        <td>/instrumentId/[XXX].[XX]/</td>
                        <td>For single id:<br>
                            /instrumentId/BHP.AX/<br>
                            For multiple id: (seperate id by ",")<br>
                            /instrumentId/BHP.AX,BLT.L/</td>
                        <td>Yes</td>
                    </tr>
                    <tr class="ver">
                        <td>Topic ID</td>
                        <td>Reuters Topic Code(s)</td>
                        <td>/topic-codes/[XXX]</td>
                        <td>For single id:<br>
                            /topic-codes/AMERS<br>
                            For multiple id: (seperate id by ",")<br>
                            /topic-codes/AMERS,COM</td>
                        <td>Yes</td>
                    </tr>
                </table>
                - Multiple values are seperated by "," ("Instrument IDs" and "Topic Codes")<br>
                - "Function", "API Version", "Start Date" and "End Date" cannot be empty<br>
                - When "Topic ID" or "Instrument ID" is empty, nothing will be enterd for this field (See "Test Data" below)<br>
                - The returned data is in JSON format<br>
                - Parameters are entered in order<br>
                <br>
                The total URL format is:<br>
                159.203.160.38:8080/Seng3011/apiv[0-9]+/news/start-date/yyyy-MM-ddTHH:mm:ssZ/end-date/yyyy-MM-ddTHH:mm:ssZ/instrumentId/[XXX].[XX]/topic-codes/[XXX]<br>
                <br>
                An example is:<br>
                159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM<br>
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
            <div class="tab-pane fade in inside-align" id="three"> <b>The API URL consists of 5 parameters:</b><br>
                <br>
                <table class="table table-striped">
                    <tr class="bold">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Format</td>
                        <td>Example</td>
                        <td>Empty</td>
                    </tr>
                    <tr>
                        <td>API Version</td>
                        <td>API version that you want to use</td>
                        <td>/apiv[0-9]+</td>
                        <td>/apiv3</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>Function</td>
                        <td>Function that you will use(News, Stock)</td>
                        <td>/newsAndStock</td>
                        <td>/newsAndStock</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>Start Date</td>
                        <td>Date that News start from</td>
                        <td>/start-date/yyyy-MM-ddTHH:mm:ssZ</td>
                        <td>/start-date/2015-10-01T00:00:00Z</td>
                        <td>No</td>
                    </tr>
                    <tr>
                        <td>End Date</td>
                        <td>Date that News end at</td>
                        <td>/end-date/yyyy-MM-ddTHH:mm:ssZ</td>
                        <td>/end-date/2015-10-10T00:00:00Z</td>
                        <td>No</td>
                    </tr>
                    <tr class="ver">
                        <td>Instrument ID</td>
                        <td>Single Reuters Instrument Code</td>
                        <td>/instrumentId/[XXX].[XX]/</td>
                        <td>/instrumentId/BHP.AX/</td>
                        <td>No</td>
                    </tr>
                    <tr class="ver">
                        <td>Topic ID</td>
                        <td>Reuters Topic Code(s)</td>
                        <td>/topic-codes/[XXX]</td>
                        <td>For single id:<br>
                            /topic-codes/AMERS<br>
                            For multiple id: (seperate id by ",")<br>
                            /topic-codes/AMERS,COM</td>
                        <td>Yes</td>
                    </tr>
                </table>
                - Multiple values are seperated by "," ("Topic Codes")<br>
                - "Function", "API Version", "Start Date", "End Date" and "InstrumentID" cannot be empty<br>
                - When "Topic ID" is empty, nothing will be enterd for this field (See "Test Data" below)<br>
                - The returned data is in JSON format<br>
                - Parameters are entered in order<br>
                <br>
                The total URL format is:<br>
                159.203.160.38:8080/Seng3011/apiv[0-9]+/newsAndStock/start-date/yyyy-MM-ddTHH:mm:ssZ/end-date/yyyy-MM-ddTHH:mm:ssZ/instrumentId/[XXX].[XX]/topic-codes/[XXX]<br>
                <br>
                An example is:<br>
                159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AMERS,COM<br>
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
            <div class="tab-pane fade in inside-align" id="four">
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Use with different languages</div>
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#four-java" data-toggle="tab">Java</a></li>
                        <li><a href="#four-curl" data-toggle="tab">Curl</a></li>
                    </ul>
                    <div id="myTabContent1" class="tab-content pad">
                        <div class="tab-pane fade in active inside-align" id="four-java"> String uri ="http://159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM";<br>
                            URL url = new URL(uri);<br>
                            HttpURLConnection connection =  (HttpURLConnection) url.openConnection();<br>
                            <br>
                            connection.setRequestMethod("GET");<br>
                            <br>
                            connection.setRequestProperty("Accept", "application/json");<br>
                            <br>
                            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream())); </div>
                        <div class="tab-pane fade inside-align" id="four-curl">curl -H "Accept: application/json" -H "Content-Type: application/json" "159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM"<br>
                        </div>
                    </div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Test Data</div>
                    <div class="pad2 inside-align"> <b>1. Request all news</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/<br>
                        <br>
                        <b>2. Request with specific instrument ID and topic code (accept multiple value)</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM<br>
                        <br>
                        <b>3. Request with only instrument ID</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/<br>
                        <br>
                        <b>4. Request with only topic code</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/topic-codes/ASIA</div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Output Format & Example</div>
                    <div class="inside-align"> <b>Response Format:</b><br>
                        <br>
                        JSON<br>
                        <br>
                        <b>Example Output URL (JSON):</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX,BLT.L/topic-codes/AMERS,COM<br>
                        <br>
                        <b>Response JSON:</b><br>
                        <br>
                        <pre style="max-height:300px;"><code class="json">
{
    "logFileSuccess": {
        "developerTeam": "404 not found Team",
        "moduleName": "news api",
        "version": "v3",
        "serverStat": "200",
        "endExecutionDate": "2017/05/09 19:01:03",
        "elapsedTime": 0,
        "outPutFileName": 1494356463015,
        "instrumentIDs": "[BHP.AX]",
        "topicCodes": "[AMERS, COM]",
        "startExecutionDate": "2017/05/09 19:01:03"
    },
    "newsDataSet": {
        "2015-10-01": {
            "open": 22.32,
            "high": 22.89,
            "low": 22.24,
            "close": 22.68,
            "news": [
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:AMERS",
                        "N2:COM"
                    ],
                    "timeStamp": "2015-10-01T18:35:46.961Z",
                    "headline": "UPDATE 1-Peru copper output surges again in August on Antamina, new mines",
                    "newsText": " (Adds August production data for certain mines)\n    LIMA, Oct 1 (Reuters) - Copper production in Peru, the\nworld`s No. 3 producer of the red metal, surged 30 percent for a\nsecond straight month in August while gold, zinc and tin output\nall dropped, the Energy and Mines Ministry said on Thursday.\n    Rising output from new mines and a 20 percent jump at\nAntamina, a top producer, drove the copper surge in August.\nAntamina, whose 2014 output fell on weak grades, is owned by BHP\nBilliton <BHP.AX> <BLT.L> and Glencore PLC <GLEN.L>.\n    Chinalco Mining Corp`s <3668.HK> Toromocho deposit, where\noutput has been ramping up, produced some 17,400 tonnes in\nAugust. Hudbay Minerals Inc`s <HBM.TO> new Constancia mine\nchurched out 13,000 tonnes, official data showed.\n    Gold production was dragged down by an estimated drop in\nunregulated gold mining in Madre de Dios, the ministry said. The\ngovernment renewed a crackdown on illegal gold mines, which sell\nore into the legal supply chain, in July. [ID:nL2N0ZV11U]\n    Peru was the world`s third biggest zinc, tin and silver\nproducer and seventh top gold producer last year, according to\nthe government.\n    The following are official mineral output figures for\nAugust:\n\n    METAL             AUGUST               PCT CHANGE\n    Copper            156,229 tonnes       +31.73\n    Gold              12,298,056 ounces     -3.52\n    Silver            11,246,128 ounces     +8.47\n    Zinc              122,646 tonnes        -9.42\n    Lead              25,810 tonnes         +4.64\n    Iron              668,730 tonnes       +87.46\n    Tin               1,693 tonnes          -5.70\n    \n\n (Reporting by Mitra Taj)\n ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters\nMessaging: mitra.taj.thomsonreuters.com@reuters.net))\n\nKeywords: PERU MINERALS/OUTPUT",
                    "type": "Neutral"
                }
            ]
        },
        "2015-10-02": {
            "open": 22.46,
            "high": 22.79,
            "low": 22.34,
            "close": 22.6,
            "news": [
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:AMERS",
                        "N2:COM"
                    ],
                    "timeStamp": "2015-10-02T06:56:03.968Z",
                    "headline": "Total iron ore exports from Port Hedland hit record in Sept",
                    "newsText": "    SYDNEY, Oct 2 (Reuters) - Australia`s Port Hedland on Friday\nreported record monthly iron ore shipments of 39.3 million\ntonnes in September, an 8-percent rise from a year ago and\nslightly above the August level.\n    Most of the ore is shipped each month to steel mills and\nports in China, though figures on individual destinations were\nnot released by the Pilbara Ports Authority. \n    Iron ore has supplanted coal and gold as Australia`s biggest\nsource of foreign income, despite the price plunging as low as\n$44.10 a tonne in July - less than half what it was a year\nearlier. Iron ore has since rebounded to stand at $54.40 a tonne\n<.IO62-CNI=SI>.\n    Port Hedland, which handles about a fifth of the world`s\nseaborne iron ore trade, is used by BHP Billiton <BHP.AX>\n<BLT.L> and Fortescue Metals Group <FMG.AX>.\n    While global iron ore trade is forecast to increase by only\n1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of\ngrowth since 2001, supply from Australia is projected to\nincrease by 6 percent to 762 million tonnes, according to\nAustralia`s Department of Industry and Science.\n    BHP is lifting output by 6 percent to 247 million tonnes by\nnext July, while Fortescue is running at an annual rate of\naround 165 million tonnes, making them the third and fourth\nlargest producers worldwide after Vale <VALE5.SA> and Rio Tinto\n<RIO.AX> <RIO.L>.\n\n (Reporting by James Regan; Editing by Joseph Radford)\n ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters\nMessaging: jim.regan.reuters.com@reuters.net))\n\nKeywords: HEDLAND AUSTRALIA/IRON",
                    "type": "Neutral"
                }
            ]
        },
        "2015-10-05": {
            "open": 23.38,
            "high": 23.59,
            "low": 23.35,
            "close": 23.5,
            "news": [
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:AMERS"
                    ],
                    "timeStamp": "2015-10-05T04:02:15.701Z",
                    "headline": "BUZZ-Asia materials extend gains on stability in China PMI",
                    "newsText": "    ** Thomson Reuters Asia Pacific Basic Materials index\n<.TRXFLDAZPUMAT> up 2.1 pct; heads towards its second\nconsecutive session of gains\n    ** Signs of some stability in official China PMI coupled\nwith govt. quickening growth supportive actions evokes interest\nin the beaten down sector\n    ** China Sept. NBS manufacturing PMI 49.8 vs forecast 49.6,\nAug 49.7; Non-mfg PMI 53.4, same as Aug\n    ** A private survey by Caixin/Markit focusing on small\nfactories was little changed from August`s 47.3\n    ** Improvement in production and new orders lead to slightly\nbetter headline PMI - BofA ML\n    ** \"We have been overweight on tech given its exposure to\nthe US, but we now wonder with the stabilisation in the official\nChina PMI whether investors should also look at materials where\nP/B is the lowest of 15 years,\" Credit Suisse analysts Sakthi\nSiva and Kin Nang Chik says\n    ** China quickens growth-supportive policy initiatives -\ncuts purchase tax by 50% for small autos; PBoC lowers minimum\ndown payment ratio to 25% from 30% for first home mortgage \n    ** Also, weak US jobs dampen prospects of near-term Fed hike\n[ID:nLNN2LEBGC]\n    ** Australia`s BHP Billiton <BHP.AX> up 3.9% , Newcrest\n<NCM.AX> jumps 8.8% while Rio Tinto <RIO.AX> rises 2.3%\n    ** Japan`s JFE Holdings <5411.T> advances 4.5 pct,\nMitsubishi Chemical Holding <4188.T> gains 4.2 pct, Nippon Paint\n<4612.T> jumps 6.4 pct\n\n\n\n\n (RM: abhishek.vishnoi.thomsonreuters.com@reuters.net)\n ((abhishek.vishnoi@thomsonreuters.com; +91 22 61807225))",
                    "type": "Positive"
                },
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:COM"
                    ],
                    "timeStamp": "2015-10-05T07:20:32.012Z",
                    "headline": "Faltering Chinese demand keeps beating down coal prices ",
                    "newsText": "    * Morgan Stanley cuts long-term coal price forecast\n    * Producers benefit from weaker currencies to lift\nproduction\n    * Coal most prominent victim of end of commodity\n\"super-cycle\"\n\n    By Jacob Gronholt-Pedersen and Henning Gloystein\n    SINGAPORE, Oct 5 (Reuters) - Slumping Chinese demand\ncontinues to batter thermal coal prices in the first week of the\nfourth quarter, with benchmark physical cargoes dropping to\ntheir lowest in more than eight years. \n    That has made coal, mostly used for power generation in\nemerging markets, the most prominent victim of what some say is\nthe end of a commodity \"super-cycle\" that followed the rapid\nindustrialisation of China after it opened up in the 1980s.\n[ID:nL5N1222IU]\n    Prompt cargo prices from Australia`s Newcastle\n<GCLNWCPFBMc1> and from South Africa`s Richards Bay\n<GCLRCBPFBMc1> terminals have both dropped to around $50 per\ntonne, close to levels last seen in the first half of 2007.\n[ID:nL5N11L02O] \n    Key coal futures prices <TRAPI2Yc1> last week settled below\n$50 per tonne for the first time since 2003, having fallen in\ntwelve of the last fourteen weeks.\n    \"Declining thermal coal prices reflects abatement in China`s\nindustrial activity,\" said Tom Price, analyst at U.S. investment\nbank Morgan Stanley.\n    The bank on Monday cut its long-term price forecast by 11\npercent to $63 per tonne on a free-on-board basis (FOB), as\ndemand in China drops amid abundant supply.   \n    U.S. competitor Goldman Sachs said in September the resource\nwould never again gain enough traction to lift it out of its\nslump and warrant investment into the sector. [ID:nL5N11T014]\n    Coal is the main fuel for electricity in China, but power\noutput is now growing at only 4 percent per year, far below\nannual growth rates of around 10 percent since 2000, Morgan\nStanley noted.\n    China`s coal imports have collapsed some 30 percent since\nthe beginning of the year, even as major producers China Shenhua\nEnergy <601088.SS> <1088.HK> and China Coal Energy <601898.SS>\n<601898.HK> cut domestic output.\n    Morgan Stanley expects a short-term recovery in coal prices\nover the next year, followed by a flat price outlook for an\nextended period.\n    The fall in coal prices, along with routs for other mined\nraw materials such as iron ore, has contributed to a clobbering\nof the shares of BHP Billiton <BHP.AX>, Rio Tinto <RIO.AX> and\nother mining giants, which have taken a bigger beating than\nthose of most energy firms. [ID:nL5N11Z1DK]\n    Weakening currencies of resource-rich producers such as\nAustralia, South Africa and Columbia has also added to the glut\nof coal and other mined commodities. \n    \"In the massive, highly competitive global thermal coal\ntrade, any favourable exchange rate move simply encourages\nexposed miners to lift or sustain production rates in order to\npreserve market share,\" Morgan Stanley`s Price said.\n    A drop in oil prices have also helped miners lower\nproduction costs by 5 to 10 percent this year, he said.\n\n    <^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\nGRAPHIC-API2 coal futures:    http://link.reuters.com/rap75w\nGRAPHIC-Coal producer share prices:     http://link.reuters.com/tap75w\n    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^>\n (Editing by Tom Hogue)\n ((jacob.pedersen@thomsonreuters.com; +65 6417 4529; Reuters\nMessaging: jacob.pedersen.thomsonreuters.com@reuters.net))\n\nKeywords: CHINA COAL/PRICES",
                    "type": "Negative"
                }
            ]
        },
        "2015-10-06": {
            "open": 23.88,
            "high": 24.28,
            "low": 23.7,
            "close": 23.88,
            "news": []
        },
        "2015-10-07": {
            "open": 23.84,
            "high": 24.36,
            "low": 23.65,
            "close": 24.26,
            "news": []
        },
        "2015-10-08": {
            "open": 24.91,
            "high": 25.19,
            "low": 24.85,
            "close": 25,
            "news": []
        },
        "2015-10-09": {
            "open": 25.65,
            "high": 25.77,
            "low": 25.42,
            "close": 25.6,
            "news": []
        }
    }   
                        </code>
                        </pre>
                        <br>
                        <b>Response Output Description:</b><br>
                        <br>
                        <table class="table table-striped">
                            <tr class="bold">
                                <td>Output Field</td>
                                <td>Description</td>
                                <td>Belongs to</td>
                            </tr>
                            <tr>
                                <td>ErrorType</td>
                                <td>The type of error that currently meets. Only appears when the URL is incorrect</td>
                                <td>N/A</td>
                            </tr>
                            <tr>
                                <td>logFileSuccess/logFile</td>
                                <td>Log file field that stores status informaiton</td>
                                <td>N/A</td>
                            </tr>
                            <tr>
                                <td>developerTeam</td>
                                <td>Team name of API's designers</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>moduleName</td>
                                <td>Name of module</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>version</td>
                                <td>API version that used for this request</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>serverStat</td>
                                <td>Response code of the server</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>endExecutionDate</td>
                                <td>The time that server finished this request</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>elapsedTime</td>
                                <td>The time used for this request</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>outPutFileName</td>
                                <td>The name of output file</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>topicCodes</td>
                                <td>Topic code(s) that request for</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>instrumentIDs</td>
                                <td>InstrumentID(s) that request for</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>startExecutionDate</td>
                                <td>The time that server starts to handle this request</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>newsDataSet</td>
                                <td>A set that includes all news information</td>
                                <td>N/A</td>
                            </tr>
                            <tr>
                                <td>instrumentIDs</td>
                                <td>InstrumentID(s) that related to the following news</td>
                                <td>newsDataSet</td>
                            </tr>
                            <tr>
                                <td>topicCodes</td>
                                <td>Topic code(s) that related to the following news</td>
                                <td>newsDataSet</td>
                            </tr>
                            <tr>
                                <td>timeStamp</td>
                                <td>Time that the following news published</td>
                                <td>newsDataSet</td>
                            </tr>
                            <tr>
                                <td>headline</td>
                                <td>Title of the following news</td>
                                <td>newsDataSet</td>
                            </tr>
                            <tr>
                                <td>newsText</td>
                                <td>News contents</td>
                                <td>newsDataSet</td>
                            </tr>
                        </table>
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
                                <td>400 Bad Request</td>
                                <td>RIC Exception</td>
                                <td>instrumentID with incorrect format</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP).AX/topic-codes/AMERS,COM</td>
                            </tr>
                            <tr>
                                <td>400 Bad Request</td>
                                <td>TopicCodes Exception</td>
                                <td>Topic code with incorrect format</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AME)RS,COM</td>
                            </tr>
                            <tr>
                                <td>400 Bad Request</td>
                                <td>Date Exception</td>
                                <td>End date before start date</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/news/start-date/2015-10-01T00:00:00Z/end-date/2014-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AMERS,COM</td>
                            </tr>
                            <tr>
                                <td>400 Bad Request</td>
                                <td>Url not exist</td>
                                <td>Invalid URL</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/news/apple</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in inside-align" id="five">
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Use with different languages</div>
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#five-java" data-toggle="tab">Java</a></li>
                        <li><a href="#five-curl" data-toggle="tab">Curl</a></li>
                    </ul>
                    <div id="myTabContent1" class="tab-content pad">
                        <div class="tab-pane fade in active inside-align" id="five-java"> String uri ="159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AMERS,COM";<br>
                            URL url = new URL(uri);<br>
                            HttpURLConnection connection =  (HttpURLConnection) url.openConnection();<br>
                            <br>
                            connection.setRequestMethod("GET");<br>
                            <br>
                            connection.setRequestProperty("Accept", "application/json");<br>
                            <br>
                            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream())); </div>
                        <div class="tab-pane fade inside-align" id="five-curl"> curl -H "Accept: application/json" -H "Content-Type: application/json" "159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AMERS,COM"<br>
                        </div>
                    </div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Test Data</div>
                    <div class="pad2 inside-align"> <b>1. Request all news</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z<br>
                        <br>
                        <b>2. Request with specific instrument ID and topic code (accept multiple value for topic codes)</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AMERS,COM<br>
                        <br>
                        <b>3. Request with only instrument ID</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/</div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Output Format & Example</div>
                    <div class="inside-align"> <b>Response Format:</b><br>
                        <br>
                        JSON<br>
                        <br>
                        <b>Example Output URL (JSON):</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AMERS,COM<br>
                        <br>
                        <b>Response JSON:</b><br>
                        <br>
                        <pre style="max-height:300px;"><code class="json">
{
    "logFileSuccess": {
        "developerTeam": "404 not found Team",
        "moduleName": "news api",
        "version": "v3",
        "serverStat": "200",
        "endExecutionDate": "2017/05/09 19:55:01",
        "elapsedTime": 0.001,
        "outPutFileName": 1494359701475,
        "instrumentIDs": "[BHP.AX]",
        "topicCodes": "[AMERS, COM]",
        "startExecutionDate": "2017/05/09 19:55:01"
    },
    "newsDataSet": {
        "2015-10-01": {
            "open": 22.32,
            "high": 22.89,
            "low": 22.24,
            "close": 22.68,
            "news": [
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:AMERS",
                        "N2:COM"
                    ],
                    "timeStamp": "2015-10-01T18:35:46.961Z",
                    "headline": "UPDATE 1-Peru copper output surges again in August on Antamina, new mines",
                    "newsText": " (Adds August production data for certain mines)\n    LIMA, Oct 1 (Reuters) - Copper production in Peru, the\nworld`s No. 3 producer of the red metal, surged 30 percent for a\nsecond straight month in August while gold, zinc and tin output\nall dropped, the Energy and Mines Ministry said on Thursday.\n    Rising output from new mines and a 20 percent jump at\nAntamina, a top producer, drove the copper surge in August.\nAntamina, whose 2014 output fell on weak grades, is owned by BHP\nBilliton <BHP.AX> <BLT.L> and Glencore PLC <GLEN.L>.\n    Chinalco Mining Corp`s <3668.HK> Toromocho deposit, where\noutput has been ramping up, produced some 17,400 tonnes in\nAugust. Hudbay Minerals Inc`s <HBM.TO> new Constancia mine\nchurched out 13,000 tonnes, official data showed.\n    Gold production was dragged down by an estimated drop in\nunregulated gold mining in Madre de Dios, the ministry said. The\ngovernment renewed a crackdown on illegal gold mines, which sell\nore into the legal supply chain, in July. [ID:nL2N0ZV11U]\n    Peru was the world`s third biggest zinc, tin and silver\nproducer and seventh top gold producer last year, according to\nthe government.\n    The following are official mineral output figures for\nAugust:\n\n    METAL             AUGUST               PCT CHANGE\n    Copper            156,229 tonnes       +31.73\n    Gold              12,298,056 ounces     -3.52\n    Silver            11,246,128 ounces     +8.47\n    Zinc              122,646 tonnes        -9.42\n    Lead              25,810 tonnes         +4.64\n    Iron              668,730 tonnes       +87.46\n    Tin               1,693 tonnes          -5.70\n    \n\n (Reporting by Mitra Taj)\n ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters\nMessaging: mitra.taj.thomsonreuters.com@reuters.net))\n\nKeywords: PERU MINERALS/OUTPUT",
                    "type": "Neutral"
                }
            ]
        },
        "2015-10-02": {
            "open": 22.46,
            "high": 22.79,
            "low": 22.34,
            "close": 22.6,
            "news": [
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:AMERS",
                        "N2:COM"
                    ],
                    "timeStamp": "2015-10-02T06:56:03.968Z",
                    "headline": "Total iron ore exports from Port Hedland hit record in Sept",
                    "newsText": "    SYDNEY, Oct 2 (Reuters) - Australia`s Port Hedland on Friday\nreported record monthly iron ore shipments of 39.3 million\ntonnes in September, an 8-percent rise from a year ago and\nslightly above the August level.\n    Most of the ore is shipped each month to steel mills and\nports in China, though figures on individual destinations were\nnot released by the Pilbara Ports Authority. \n    Iron ore has supplanted coal and gold as Australia`s biggest\nsource of foreign income, despite the price plunging as low as\n$44.10 a tonne in July - less than half what it was a year\nearlier. Iron ore has since rebounded to stand at $54.40 a tonne\n<.IO62-CNI=SI>.\n    Port Hedland, which handles about a fifth of the world`s\nseaborne iron ore trade, is used by BHP Billiton <BHP.AX>\n<BLT.L> and Fortescue Metals Group <FMG.AX>.\n    While global iron ore trade is forecast to increase by only\n1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of\ngrowth since 2001, supply from Australia is projected to\nincrease by 6 percent to 762 million tonnes, according to\nAustralia`s Department of Industry and Science.\n    BHP is lifting output by 6 percent to 247 million tonnes by\nnext July, while Fortescue is running at an annual rate of\naround 165 million tonnes, making them the third and fourth\nlargest producers worldwide after Vale <VALE5.SA> and Rio Tinto\n<RIO.AX> <RIO.L>.\n\n (Reporting by James Regan; Editing by Joseph Radford)\n ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters\nMessaging: jim.regan.reuters.com@reuters.net))\n\nKeywords: HEDLAND AUSTRALIA/IRON",
                    "type": "Neutral"
                }
            ]
        },
        "2015-10-05": {
            "open": 23.38,
            "high": 23.59,
            "low": 23.35,
            "close": 23.5,
            "news": [
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:AMERS"
                    ],
                    "timeStamp": "2015-10-05T04:02:15.701Z",
                    "headline": "BUZZ-Asia materials extend gains on stability in China PMI",
                    "newsText": "    ** Thomson Reuters Asia Pacific Basic Materials index\n<.TRXFLDAZPUMAT> up 2.1 pct; heads towards its second\nconsecutive session of gains\n    ** Signs of some stability in official China PMI coupled\nwith govt. quickening growth supportive actions evokes interest\nin the beaten down sector\n    ** China Sept. NBS manufacturing PMI 49.8 vs forecast 49.6,\nAug 49.7; Non-mfg PMI 53.4, same as Aug\n    ** A private survey by Caixin/Markit focusing on small\nfactories was little changed from August`s 47.3\n    ** Improvement in production and new orders lead to slightly\nbetter headline PMI - BofA ML\n    ** \"We have been overweight on tech given its exposure to\nthe US, but we now wonder with the stabilisation in the official\nChina PMI whether investors should also look at materials where\nP/B is the lowest of 15 years,\" Credit Suisse analysts Sakthi\nSiva and Kin Nang Chik says\n    ** China quickens growth-supportive policy initiatives -\ncuts purchase tax by 50% for small autos; PBoC lowers minimum\ndown payment ratio to 25% from 30% for first home mortgage \n    ** Also, weak US jobs dampen prospects of near-term Fed hike\n[ID:nLNN2LEBGC]\n    ** Australia`s BHP Billiton <BHP.AX> up 3.9% , Newcrest\n<NCM.AX> jumps 8.8% while Rio Tinto <RIO.AX> rises 2.3%\n    ** Japan`s JFE Holdings <5411.T> advances 4.5 pct,\nMitsubishi Chemical Holding <4188.T> gains 4.2 pct, Nippon Paint\n<4612.T> jumps 6.4 pct\n\n\n\n\n (RM: abhishek.vishnoi.thomsonreuters.com@reuters.net)\n ((abhishek.vishnoi@thomsonreuters.com; +91 22 61807225))",
                    "type": "Positive"
                },
                {
                    "instrumentIDs": [
                        "RIC_BHP.AX"
                    ],
                    "topicCodes": [
                        "N2:COM"
                    ],
                    "timeStamp": "2015-10-05T07:20:32.012Z",
                    "headline": "Faltering Chinese demand keeps beating down coal prices ",
                    "newsText": "    * Morgan Stanley cuts long-term coal price forecast\n    * Producers benefit from weaker currencies to lift\nproduction\n    * Coal most prominent victim of end of commodity\n\"super-cycle\"\n\n    By Jacob Gronholt-Pedersen and Henning Gloystein\n    SINGAPORE, Oct 5 (Reuters) - Slumping Chinese demand\ncontinues to batter thermal coal prices in the first week of the\nfourth quarter, with benchmark physical cargoes dropping to\ntheir lowest in more than eight years. \n    That has made coal, mostly used for power generation in\nemerging markets, the most prominent victim of what some say is\nthe end of a commodity \"super-cycle\" that followed the rapid\nindustrialisation of China after it opened up in the 1980s.\n[ID:nL5N1222IU]\n    Prompt cargo prices from Australia`s Newcastle\n<GCLNWCPFBMc1> and from South Africa`s Richards Bay\n<GCLRCBPFBMc1> terminals have both dropped to around $50 per\ntonne, close to levels last seen in the first half of 2007.\n[ID:nL5N11L02O] \n    Key coal futures prices <TRAPI2Yc1> last week settled below\n$50 per tonne for the first time since 2003, having fallen in\ntwelve of the last fourteen weeks.\n    \"Declining thermal coal prices reflects abatement in China`s\nindustrial activity,\" said Tom Price, analyst at U.S. investment\nbank Morgan Stanley.\n    The bank on Monday cut its long-term price forecast by 11\npercent to $63 per tonne on a free-on-board basis (FOB), as\ndemand in China drops amid abundant supply.   \n    U.S. competitor Goldman Sachs said in September the resource\nwould never again gain enough traction to lift it out of its\nslump and warrant investment into the sector. [ID:nL5N11T014]\n    Coal is the main fuel for electricity in China, but power\noutput is now growing at only 4 percent per year, far below\nannual growth rates of around 10 percent since 2000, Morgan\nStanley noted.\n    China`s coal imports have collapsed some 30 percent since\nthe beginning of the year, even as major producers China Shenhua\nEnergy <601088.SS> <1088.HK> and China Coal Energy <601898.SS>\n<601898.HK> cut domestic output.\n    Morgan Stanley expects a short-term recovery in coal prices\nover the next year, followed by a flat price outlook for an\nextended period.\n    The fall in coal prices, along with routs for other mined\nraw materials such as iron ore, has contributed to a clobbering\nof the shares of BHP Billiton <BHP.AX>, Rio Tinto <RIO.AX> and\nother mining giants, which have taken a bigger beating than\nthose of most energy firms. [ID:nL5N11Z1DK]\n    Weakening currencies of resource-rich producers such as\nAustralia, South Africa and Columbia has also added to the glut\nof coal and other mined commodities. \n    \"In the massive, highly competitive global thermal coal\ntrade, any favourable exchange rate move simply encourages\nexposed miners to lift or sustain production rates in order to\npreserve market share,\" Morgan Stanley`s Price said.\n    A drop in oil prices have also helped miners lower\nproduction costs by 5 to 10 percent this year, he said.\n\n    <^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\nGRAPHIC-API2 coal futures:    http://link.reuters.com/rap75w\nGRAPHIC-Coal producer share prices:     http://link.reuters.com/tap75w\n    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^>\n (Editing by Tom Hogue)\n ((jacob.pedersen@thomsonreuters.com; +65 6417 4529; Reuters\nMessaging: jacob.pedersen.thomsonreuters.com@reuters.net))\n\nKeywords: CHINA COAL/PRICES",
                    "type": "Negative"
                }
            ]
        },
        "2015-10-06": {
            "open": 23.88,
            "high": 24.28,
            "low": 23.7,
            "close": 23.88,
            "news": []
        },
        "2015-10-07": {
            "open": 23.84,
            "high": 24.36,
            "low": 23.65,
            "close": 24.26,
            "news": []
        },
        "2015-10-08": {
            "open": 24.91,
            "high": 25.19,
            "low": 24.85,
            "close": 25,
            "news": []
        },
        "2015-10-09": {
            "open": 25.65,
            "high": 25.77,
            "low": 25.42,
            "close": 25.6,
            "news": []
        }
    }
}                              
                              </code>
                        </pre>
                        <br>
                        <b>Response Output Description:</b><br>
                        <br>
                        <table class="table table-striped">
                            <tr class="bold">
                                <td>Output Field</td>
                                <td>Description</td>
                                <td>Belongs to</td>
                            </tr>
                            <tr>
                                <td>ErrorType</td>
                                <td>The type of error that currently meets. Only appears when the URL is incorrect</td>
                                <td>N/A</td>
                            </tr>
                            <tr>
                                <td>logFileSuccess/logFile</td>
                                <td>Log file field that stores status informaiton</td>
                                <td>N/A</td>
                            </tr>
                            <tr>
                                <td>developerTeam</td>
                                <td>Team name of API's designers</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>moduleName</td>
                                <td>Name of module</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>version</td>
                                <td>API version that used for this request</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>serverStat</td>
                                <td>Response code of the server</td>
                                <td>logFileSuccess/logFile</td>
                            </tr>
                            <tr>
                                <td>endExecutionDate</td>
                                <td>The time that server finished this request</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>elapsedTime</td>
                                <td>The time used for this request</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>outPutFileName</td>
                                <td>The name of output file</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>topicCodes</td>
                                <td>Topic code(s) that request for</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>instrumentIDs</td>
                                <td>InstrumentID(s) that request for</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>startExecutionDate</td>
                                <td>The time that server starts to handle this request</td>
                                <td>logFileSuccess</td>
                            </tr>
                            <tr>
                                <td>newsDataSet</td>
                                <td>A set that includes all stock and news information</td>
                                <td>N/A</td>
                            </tr>
                            <tr>
                                <td>yyyy-MM-dd</td>
                                <td>One day in given date range</td>
                                <td>newsDataSet</td>
                            </tr>
                            <tr>
                                <td>open</td>
                                <td>Open stock price of current company in a specific day</td>
                                <td>yyyy-MM-dd</td>
                            </tr>
                            <tr>
                                <td>high</td>
                                <td>Highest stock price of current company in a specific day</td>
                                <td>yyyy-MM-dd</td>
                            </tr>
                            <tr>
                                <td>low</td>
                                <td>Lowest stock price of current company in a specific day</td>
                                <td>yyyy-MM-dd</td>
                            </tr>
                            <tr>
                                <td>close</td>
                                <td>Close stock price of current company in a specific day</td>
                                <td>yyyy-MM-dd</td>
                            </tr>
                            <tr>
                                <td>news</td>
                                <td>News that related to the company in a specific day</td>
                                <td>yyyy-MM-dd</td>
                            </tr>
                            <tr>
                                <td>instrumentIDs</td>
                                <td>InstrumentID(s) that related to the following news</td>
                                <td>news</td>
                            </tr>
                            <tr>
                                <td>topicCodes</td>
                                <td>Topic code(s) that related to the following news</td>
                                <td>news</td>
                            </tr>
                            <tr>
                                <td>timeStamp</td>
                                <td>Time that the following news published</td>
                                <td>news</td>
                            </tr>
                            <tr>
                                <td>headline</td>
                                <td>Title of the following news</td>
                                <td>news</td>
                            </tr>
                            <tr>
                                <td>newsText</td>
                                <td>News contents</td>
                                <td>news</td>
                            </tr>
                            <tr>
                                <td>type</td>
                                <td>Influence of the news to the stock (positive, negative or neutral)</td>
                                <td>news</td>
                            </tr>
                        </table>
                        - It is possible that no related news found <br>
                        <br>
                        <table class="table table-striped">
                            <tr class="bold">
                                <td>Error type</td>
                                <td>Message</td>
                                <td>Possible Cause</td>
                                <td>Example</td>
                            </tr>
                            <tr>
                                <td>400 Bad Request</td>
                                <td>RIC Exception</td>
                                <td>instrumentID with incorrect format</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP).AX/topic-codes/AMERS,COM</td>
                            </tr>
                            <tr>
                                <td>400 Bad Request</td>
                                <td>TopicCodes Exception</td>
                                <td>Topic code with incorrect format</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AME)RS,COM</td>
                            </tr>
                            <tr>
                                <td>400 Bad Request</td>
                                <td>Date Exception</td>
                                <td>End date before start date</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/newsAndStock/start-date/2015-10-01T00:00:00Z/end-date/2014-10-10T00:00:00Z/instrumentId/BHP.AX/topic-codes/AMERS,COM</td>
                            </tr>
                            <tr>
                                <td>400 Bad Request</td>
                                <td>Url not exist</td>
                                <td>Invalid URL</td>
                                <td>159.203.160.38:8080/Seng3011/apiv3/news/apple</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade in inside-align" id="six"> <b>What is it?</b><br>
                <br>
                An auto stock-trading function (with visual indication of when to buy and sell stock in graph) based on strategy using given affordable investment capital, company ID and date. The graph also includes relevant important news (that might have influence on the strategy) on given days.
                <br>
                <br>
                <b>How it works?</b><br>
                <br>
                The auto stock-trading system is at the home page. Here are input field descriptions:<br><br>
                <table class="table table-striped">
                    <tr class="bold">
                        <td>Input Field</td>
                        <td>Description</td>
                        <td>Comment</td>
                    </tr>
                    <tr>
                        <td>Affordable Investment Capital</td>
                        <td>Money that you are able to invest</td>
                        <td>Investment capital is given in range, like: $2000-$4000. Selecting different range will result in different stock-trading strategy</td>
                    </tr>
                    <tr>
                        <td>Company's instrumentID</td>
                        <td>List of instrumentIDs of the company that you want to apply stock strategy for</td>
                        <td>A number of suitable company IDs will be displayed for given investment (companies are suitbale for different investment amount)</td>
                    </tr>
                    <tr>
                        <td>Start Date</td>
                        <td>Date that stock trading starts from</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>End Date</td>
                        <td>Date that stock trading ends at</td>
                        <td>-</td>
                    </tr>
                </table>
                - All fields must be filled in<br><br>
                <b>Example Input</b><br><br>
                Investment Capital: $8000-$15000<br>
                Company ID: FMG.AX<br>
                Start Date: 2015-08-01<br>
                End Date: 2016-05-01<br><br>
                <b>Example Output</b><br><br>
                <img src="/Seng3011Client/resources/img/graph.png" style="width:1050px;"></img><br><br>
                <b>Output Field Description:</b><br><br>
                <table class="table table-striped">
                    <tr class="bold">
                        <td>Output Field</td>
                        <td>Description</td>
                        <td>Comment</td>
                    </tr>
                    <tr>
                        <td>column bar</td>
                        <td>MACD column bar</td>
                        <td>Contains information of open, close, high and low prices for the time</td>
                    </tr>
                    <tr>
                        <td>buy</td>
                        <td>Suggestion of buy stock at the time</td>
                        <td>Usually appear when the stock price is falling or has good news. It also contains information of dealPrice, singleProfit (for the current operation), totalProfit, investment etc</td>
                    </tr>
                    <tr>
                        <td>sell</td>
                        <td>Suggestion of sell stock at the time</td>
                        <td>Usually appear when the stock price is raising or has bad news. It also contains information of dealPrice, singleProfit (for the current operation), totalProfit, investment etc</td>
                    </tr>
                    <tr>
                        <td>news</td>
                        <td>Important news that happened at the day</td>
                        <td>By clicking on it, news details can be displayed in the following panel</td>
                    </tr>
                    <tr>
                        <td>Company</td>
                        <td>Company ID that current strategy is applying for</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>TotalProfit</td>
                        <td>Total money (in dollar) earned at the time</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>MaxDrownDown</td>
                        <td>Maximum investment that the strategy used</td>
                        <td>The value will not go over the maximum value of your selected investment capital range</td>
                    </tr>
                </table> 
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