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
<div id="container"><div id="output"></div></div>
<div class="panel-body middle-align" style="padding-bottom:0px;">
    <div class="panel panel-black">
        <div class="panel-heading bold size2">Version 1.0 Documentation</div>
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#one" data-toggle="tab">Details</a></li>
            <li><a href="#two" data-toggle="tab">General Information</a></li>
            <li><a href="#three" data-toggle="tab">Tutorial</a></li>
        </ul>
        <div id="myTabContent" class="tab-content pad">
            <div class="tab-pane fade in active inside-align" id="one"> <b>Date of Release</b><br>
                <br>
                30/03/17<br>
                <br>
                <b>Implementation in this version</b><br>
                <br>
                - The API is able to make request to the News API<br>
                - The API is able to return output JSON file with corresponding result<br>
                - The API website provides tutorial of using it on different platform<br>
                - The API website provides test data<br>
                <br>
                <b>Differences with previous version</b><br>
                <br>
                N/A, this is the first release.<br>
                <br>
                <b>Other Information</b><br>
                <br>
                More informaiton about API running instruction, program call and test data, please check tutorial.<br>
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
                        <td>/apiv1</td>
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
                            /instrumentId/RIC_BHP.AX<br>
                            For multiple id: (seperate id by ",")<br>
                            /instrumentId/RIC_BHP.AX,RIC_BLT.L</td>
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
                159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM<br>
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
                        <li class="active"><a href="#one-java" data-toggle="tab">Java</a></li>
                        <li><a href="#one-linux" data-toggle="tab">Linux</a></li>
                        <li><a href="#one-web" data-toggle="tab">Web</a></li>
                    </ul>
                    <div id="myTabContent1" class="tab-content pad">
                        <div class="tab-pane fade in active inside-align" id="one-java"> String url = "http://159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM"; <br>
                            <br>
                            URL fUrl = new URL(url); <br>
                            <br>
                            HttpURLConnection con = (HttpURLConnection) fUrl.openConnection(); <br>
                            <br>
                            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream())); </div>
                        <div class="tab-pane fade inside-align" id="one-linux"> <b>Run the following command in the terminal</b><br>
                            <br>
                            curl http://159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM </div>
                        <div class="tab-pane fade inside-align" id="one-web"> <b>Enter the following URL to web browser</b><br>
                            <br>
                            159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM </div>
                    </div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Test Data</div>
                    <div class="pad2 inside-align"> <b>1. Request all news</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z<br>
                        <br>
                        <b>2. Request with specific instrument ID and topic code (accept multiple value)</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM<br>
                        <br>
                        <b>3. Request with only instrument ID</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L<br>
                        <br>
                        <b>4. Request with only topic code</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/topic-codes/ASIA </div>
                </div>
                <div class="panel panel-black">
                    <div class="panel-heading bold size2">Output Format & Example</div>
                    <div class="inside-align"> <b>Response Format:</b><br>
                        <br>
                        JSON<br>
                        <br>
                        <b>Example Output URL:</b><br>
                        <br>
                        159.203.160.38:8080/Seng3011/apiv1/start-date/2015-10-01T00:00:00Z/end-date/2015-10-10T00:00:00Z/instrumentId/RIC_BHP.AX,RIC_BLT.L/topic-codes/AMERS,COM<br>
                        <br>
                        <b>Response JSON:</b><br>
                        <br>
                        <pre style="max-height:300px;"><code class="json">
    {
      "instrumentId": [
        "RIC_BHP.AX",
        "RIC_BLT.L"
      ],
      "topicCode": [
        "AMERS",
        "COM"
      ],
      "newsList": [
        {
          "time": "2015-10-01T18:35:46.961Z",
          "headline": "UPDATE 1-Peru copper output surges again in August on Antamina, new mines",
          "newsBody": " (Adds August production data for certain mines)\n    LIMA, Oct 1 (Reuters) - Copper production in Peru, the\nworld's No. 3 producer of the red metal, surged 30 percent for a\nsecond straight month in August while gold, zinc and tin output\nall dropped, the Energy and Mines Ministry said on Thursday.\n    Rising output from new mines and a 20 percent jump at\nAntamina, a top producer, drove the copper surge in August.\nAntamina, whose 2014 output fell on weak grades, is owned by BHP\nBilliton <BHP.AX> <BLT.L> and Glencore PLC <GLEN.L>.\n    Chinalco Mining Corp's <3668.HK> Toromocho deposit, where\noutput has been ramping up, produced some 17,400 tonnes in\nAugust. Hudbay Minerals Inc's <HBM.TO> new Constancia mine\nchurched out 13,000 tonnes, official data showed.\n    Gold production was dragged down by an estimated drop in\nunregulated gold mining in Madre de Dios, the ministry said. The\ngovernment renewed a crackdown on illegal gold mines, which sell\nore into the legal supply chain, in July. [ID:nL2N0ZV11U]\n    Peru was the world's third biggest zinc, tin and silver\nproducer and seventh top gold producer last year, according to\nthe government.\n    The following are official mineral output figures for\nAugust:\n\n    METAL             AUGUST               PCT CHANGE\n    Copper            156,229 tonnes       +31.73\n    Gold              12,298,056 ounces     -3.52\n    Silver            11,246,128 ounces     +8.47\n    Zinc              122,646 tonnes        -9.42\n    Lead              25,810 tonnes         +4.64\n    Iron              668,730 tonnes       +87.46\n    Tin               1,693 tonnes          -5.70\n    \n\n (Reporting by Mitra Taj)\n ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters\nMessaging: mitra.taj.thomsonreuters.com@reuters.net))\n\nKeywords: PERU MINERALS/OUTPUT"
        },
        {
          "time": "2015-10-01T18:35:46.961Z",
          "headline": "UPDATE 1-Peru copper output surges again in August on Antamina, new mines",
          "newsBody": " (Adds August production data for certain mines)\n    LIMA, Oct 1 (Reuters) - Copper production in Peru, the\nworld's No. 3 producer of the red metal, surged 30 percent for a\nsecond straight month in August while gold, zinc and tin output\nall dropped, the Energy and Mines Ministry said on Thursday.\n    Rising output from new mines and a 20 percent jump at\nAntamina, a top producer, drove the copper surge in August.\nAntamina, whose 2014 output fell on weak grades, is owned by BHP\nBilliton <BHP.AX> <BLT.L> and Glencore PLC <GLEN.L>.\n    Chinalco Mining Corp's <3668.HK> Toromocho deposit, where\noutput has been ramping up, produced some 17,400 tonnes in\nAugust. Hudbay Minerals Inc's <HBM.TO> new Constancia mine\nchurched out 13,000 tonnes, official data showed.\n    Gold production was dragged down by an estimated drop in\nunregulated gold mining in Madre de Dios, the ministry said. The\ngovernment renewed a crackdown on illegal gold mines, which sell\nore into the legal supply chain, in July. [ID:nL2N0ZV11U]\n    Peru was the world's third biggest zinc, tin and silver\nproducer and seventh top gold producer last year, according to\nthe government.\n    The following are official mineral output figures for\nAugust:\n\n    METAL             AUGUST               PCT CHANGE\n    Copper            156,229 tonnes       +31.73\n    Gold              12,298,056 ounces     -3.52\n    Silver            11,246,128 ounces     +8.47\n    Zinc              122,646 tonnes        -9.42\n    Lead              25,810 tonnes         +4.64\n    Iron              668,730 tonnes       +87.46\n    Tin               1,693 tonnes          -5.70\n    \n\n (Reporting by Mitra Taj)\n ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters\nMessaging: mitra.taj.thomsonreuters.com@reuters.net))\n\nKeywords: PERU MINERALS/OUTPUT"
        },
        {
          "time": "2015-10-01T18:35:46.961Z",
          "headline": "UPDATE 1-Peru copper output surges again in August on Antamina, new mines",
          "newsBody": " (Adds August production data for certain mines)\n    LIMA, Oct 1 (Reuters) - Copper production in Peru, the\nworld's No. 3 producer of the red metal, surged 30 percent for a\nsecond straight month in August while gold, zinc and tin output\nall dropped, the Energy and Mines Ministry said on Thursday.\n    Rising output from new mines and a 20 percent jump at\nAntamina, a top producer, drove the copper surge in August.\nAntamina, whose 2014 output fell on weak grades, is owned by BHP\nBilliton <BHP.AX> <BLT.L> and Glencore PLC <GLEN.L>.\n    Chinalco Mining Corp's <3668.HK> Toromocho deposit, where\noutput has been ramping up, produced some 17,400 tonnes in\nAugust. Hudbay Minerals Inc's <HBM.TO> new Constancia mine\nchurched out 13,000 tonnes, official data showed.\n    Gold production was dragged down by an estimated drop in\nunregulated gold mining in Madre de Dios, the ministry said. The\ngovernment renewed a crackdown on illegal gold mines, which sell\nore into the legal supply chain, in July. [ID:nL2N0ZV11U]\n    Peru was the world's third biggest zinc, tin and silver\nproducer and seventh top gold producer last year, according to\nthe government.\n    The following are official mineral output figures for\nAugust:\n\n    METAL             AUGUST               PCT CHANGE\n    Copper            156,229 tonnes       +31.73\n    Gold              12,298,056 ounces     -3.52\n    Silver            11,246,128 ounces     +8.47\n    Zinc              122,646 tonnes        -9.42\n    Lead              25,810 tonnes         +4.64\n    Iron              668,730 tonnes       +87.46\n    Tin               1,693 tonnes          -5.70\n    \n\n (Reporting by Mitra Taj)\n ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters\nMessaging: mitra.taj.thomsonreuters.com@reuters.net))\n\nKeywords: PERU MINERALS/OUTPUT"
        },
        {
          "time": "2015-10-01T18:35:46.961Z",
          "headline": "UPDATE 1-Peru copper output surges again in August on Antamina, new mines",
          "newsBody": " (Adds August production data for certain mines)\n    LIMA, Oct 1 (Reuters) - Copper production in Peru, the\nworld's No. 3 producer of the red metal, surged 30 percent for a\nsecond straight month in August while gold, zinc and tin output\nall dropped, the Energy and Mines Ministry said on Thursday.\n    Rising output from new mines and a 20 percent jump at\nAntamina, a top producer, drove the copper surge in August.\nAntamina, whose 2014 output fell on weak grades, is owned by BHP\nBilliton <BHP.AX> <BLT.L> and Glencore PLC <GLEN.L>.\n    Chinalco Mining Corp's <3668.HK> Toromocho deposit, where\noutput has been ramping up, produced some 17,400 tonnes in\nAugust. Hudbay Minerals Inc's <HBM.TO> new Constancia mine\nchurched out 13,000 tonnes, official data showed.\n    Gold production was dragged down by an estimated drop in\nunregulated gold mining in Madre de Dios, the ministry said. The\ngovernment renewed a crackdown on illegal gold mines, which sell\nore into the legal supply chain, in July. [ID:nL2N0ZV11U]\n    Peru was the world's third biggest zinc, tin and silver\nproducer and seventh top gold producer last year, according to\nthe government.\n    The following are official mineral output figures for\nAugust:\n\n    METAL             AUGUST               PCT CHANGE\n    Copper            156,229 tonnes       +31.73\n    Gold              12,298,056 ounces     -3.52\n    Silver            11,246,128 ounces     +8.47\n    Zinc              122,646 tonnes        -9.42\n    Lead              25,810 tonnes         +4.64\n    Iron              668,730 tonnes       +87.46\n    Tin               1,693 tonnes          -5.70\n    \n\n (Reporting by Mitra Taj)\n ((mitra.taj@thomsonreuters.com; +51-1-221-2130; Reuters\nMessaging: mitra.taj.thomsonreuters.com@reuters.net))\n\nKeywords: PERU MINERALS/OUTPUT"
        },
        {
          "time": "2015-10-02T06:56:03.968Z",
          "headline": "Total iron ore exports from Port Hedland hit record in Sept",
          "newsBody": "    SYDNEY, Oct 2 (Reuters) - Australia's Port Hedland on Friday\nreported record monthly iron ore shipments of 39.3 million\ntonnes in September, an 8-percent rise from a year ago and\nslightly above the August level.\n    Most of the ore is shipped each month to steel mills and\nports in China, though figures on individual destinations were\nnot released by the Pilbara Ports Authority. \n    Iron ore has supplanted coal and gold as Australia's biggest\nsource of foreign income, despite the price plunging as low as\n$44.10 a tonne in July - less than half what it was a year\nearlier. Iron ore has since rebounded to stand at $54.40 a tonne\n<.IO62-CNI=SI>.\n    Port Hedland, which handles about a fifth of the world's\nseaborne iron ore trade, is used by BHP Billiton <BHP.AX>\n<BLT.L> and Fortescue Metals Group <FMG.AX>.\n    While global iron ore trade is forecast to increase by only\n1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of\ngrowth since 2001, supply from Australia is projected to\nincrease by 6 percent to 762 million tonnes, according to\nAustralia's Department of Industry and Science.\n    BHP is lifting output by 6 percent to 247 million tonnes by\nnext July, while Fortescue is running at an annual rate of\naround 165 million tonnes, making them the third and fourth\nlargest producers worldwide after Vale <VALE5.SA> and Rio Tinto\n<RIO.AX> <RIO.L>.\n\n (Reporting by James Regan; Editing by Joseph Radford)\n ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters\nMessaging: jim.regan.reuters.com@reuters.net))\n\nKeywords: HEDLAND AUSTRALIA/IRON"
        },
        {
          "time": "2015-10-02T06:56:03.968Z",
          "headline": "Total iron ore exports from Port Hedland hit record in Sept",
          "newsBody": "    SYDNEY, Oct 2 (Reuters) - Australia's Port Hedland on Friday\nreported record monthly iron ore shipments of 39.3 million\ntonnes in September, an 8-percent rise from a year ago and\nslightly above the August level.\n    Most of the ore is shipped each month to steel mills and\nports in China, though figures on individual destinations were\nnot released by the Pilbara Ports Authority. \n    Iron ore has supplanted coal and gold as Australia's biggest\nsource of foreign income, despite the price plunging as low as\n$44.10 a tonne in July - less than half what it was a year\nearlier. Iron ore has since rebounded to stand at $54.40 a tonne\n<.IO62-CNI=SI>.\n    Port Hedland, which handles about a fifth of the world's\nseaborne iron ore trade, is used by BHP Billiton <BHP.AX>\n<BLT.L> and Fortescue Metals Group <FMG.AX>.\n    While global iron ore trade is forecast to increase by only\n1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of\ngrowth since 2001, supply from Australia is projected to\nincrease by 6 percent to 762 million tonnes, according to\nAustralia's Department of Industry and Science.\n    BHP is lifting output by 6 percent to 247 million tonnes by\nnext July, while Fortescue is running at an annual rate of\naround 165 million tonnes, making them the third and fourth\nlargest producers worldwide after Vale <VALE5.SA> and Rio Tinto\n<RIO.AX> <RIO.L>.\n\n (Reporting by James Regan; Editing by Joseph Radford)\n ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters\nMessaging: jim.regan.reuters.com@reuters.net))\n\nKeywords: HEDLAND AUSTRALIA/IRON"
        },
        {
          "time": "2015-10-02T06:56:03.968Z",
          "headline": "Total iron ore exports from Port Hedland hit record in Sept",
          "newsBody": "    SYDNEY, Oct 2 (Reuters) - Australia's Port Hedland on Friday\nreported record monthly iron ore shipments of 39.3 million\ntonnes in September, an 8-percent rise from a year ago and\nslightly above the August level.\n    Most of the ore is shipped each month to steel mills and\nports in China, though figures on individual destinations were\nnot released by the Pilbara Ports Authority. \n    Iron ore has supplanted coal and gold as Australia's biggest\nsource of foreign income, despite the price plunging as low as\n$44.10 a tonne in July - less than half what it was a year\nearlier. Iron ore has since rebounded to stand at $54.40 a tonne\n<.IO62-CNI=SI>.\n    Port Hedland, which handles about a fifth of the world's\nseaborne iron ore trade, is used by BHP Billiton <BHP.AX>\n<BLT.L> and Fortescue Metals Group <FMG.AX>.\n    While global iron ore trade is forecast to increase by only\n1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of\ngrowth since 2001, supply from Australia is projected to\nincrease by 6 percent to 762 million tonnes, according to\nAustralia's Department of Industry and Science.\n    BHP is lifting output by 6 percent to 247 million tonnes by\nnext July, while Fortescue is running at an annual rate of\naround 165 million tonnes, making them the third and fourth\nlargest producers worldwide after Vale <VALE5.SA> and Rio Tinto\n<RIO.AX> <RIO.L>.\n\n (Reporting by James Regan; Editing by Joseph Radford)\n ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters\nMessaging: jim.regan.reuters.com@reuters.net))\n\nKeywords: HEDLAND AUSTRALIA/IRON"
        },
        {
          "time": "2015-10-02T06:56:03.968Z",
          "headline": "Total iron ore exports from Port Hedland hit record in Sept",
          "newsBody": "    SYDNEY, Oct 2 (Reuters) - Australia's Port Hedland on Friday\nreported record monthly iron ore shipments of 39.3 million\ntonnes in September, an 8-percent rise from a year ago and\nslightly above the August level.\n    Most of the ore is shipped each month to steel mills and\nports in China, though figures on individual destinations were\nnot released by the Pilbara Ports Authority. \n    Iron ore has supplanted coal and gold as Australia's biggest\nsource of foreign income, despite the price plunging as low as\n$44.10 a tonne in July - less than half what it was a year\nearlier. Iron ore has since rebounded to stand at $54.40 a tonne\n<.IO62-CNI=SI>.\n    Port Hedland, which handles about a fifth of the world's\nseaborne iron ore trade, is used by BHP Billiton <BHP.AX>\n<BLT.L> and Fortescue Metals Group <FMG.AX>.\n    While global iron ore trade is forecast to increase by only\n1.5 percent in 2015 to 1.4 billion tonnes, the lowest rate of\ngrowth since 2001, supply from Australia is projected to\nincrease by 6 percent to 762 million tonnes, according to\nAustralia's Department of Industry and Science.\n    BHP is lifting output by 6 percent to 247 million tonnes by\nnext July, while Fortescue is running at an annual rate of\naround 165 million tonnes, making them the third and fourth\nlargest producers worldwide after Vale <VALE5.SA> and Rio Tinto\n<RIO.AX> <RIO.L>.\n\n (Reporting by James Regan; Editing by Joseph Radford)\n ((jim.regan@thomsonreuters.com; +612 9373-1814; Reuters\nMessaging: jim.regan.reuters.com@reuters.net))\n\nKeywords: HEDLAND AUSTRALIA/IRON"
        },
        {
          "time": "2015-10-05T04:02:15.701Z",
          "headline": "BUZZ-Asia materials extend gains on stability in China PMI",
          "newsBody": "    ** Thomson Reuters Asia Pacific Basic Materials index\n<.TRXFLDAZPUMAT> up 2.1 pct; heads towards its second\nconsecutive session of gains\n    ** Signs of some stability in official China PMI coupled\nwith govt. quickening growth supportive actions evokes interest\nin the beaten down sector\n    ** China Sept. NBS manufacturing PMI 49.8 vs forecast 49.6,\nAug 49.7; Non-mfg PMI 53.4, same as Aug\n    ** A private survey by Caixin/Markit focusing on small\nfactories was little changed from August's 47.3\n    ** Improvement in production and new orders lead to slightly\nbetter headline PMI - BofA ML\n    ** \"We have been overweight on tech given its exposure to\nthe US, but we now wonder with the stabilisation in the official\nChina PMI whether investors should also look at materials where\nP/B is the lowest of 15 years,\" Credit Suisse analysts Sakthi\nSiva and Kin Nang Chik says\n    ** China quickens growth-supportive policy initiatives -\ncuts purchase tax by 50% for small autos; PBoC lowers minimum\ndown payment ratio to 25% from 30% for first home mortgage \n    ** Also, weak US jobs dampen prospects of near-term Fed hike\n[ID:nLNN2LEBGC]\n    ** Australia's BHP Billiton <BHP.AX> up 3.9% , Newcrest\n<NCM.AX> jumps 8.8% while Rio Tinto <RIO.AX> rises 2.3%\n    ** Japan's JFE Holdings <5411.T> advances 4.5 pct,\nMitsubishi Chemical Holding <4188.T> gains 4.2 pct, Nippon Paint\n<4612.T> jumps 6.4 pct\n\n\n\n\n (RM: abhishek.vishnoi.thomsonreuters.com@reuters.net)\n ((abhishek.vishnoi@thomsonreuters.com; +91 22 61807225))"
        },
        {
          "time": "2015-10-05T04:02:15.701Z",
          "headline": "BUZZ-Asia materials extend gains on stability in China PMI",
          "newsBody": "    ** Thomson Reuters Asia Pacific Basic Materials index\n<.TRXFLDAZPUMAT> up 2.1 pct; heads towards its second\nconsecutive session of gains\n    ** Signs of some stability in official China PMI coupled\nwith govt. quickening growth supportive actions evokes interest\nin the beaten down sector\n    ** China Sept. NBS manufacturing PMI 49.8 vs forecast 49.6,\nAug 49.7; Non-mfg PMI 53.4, same as Aug\n    ** A private survey by Caixin/Markit focusing on small\nfactories was little changed from August's 47.3\n    ** Improvement in production and new orders lead to slightly\nbetter headline PMI - BofA ML\n    ** \"We have been overweight on tech given its exposure to\nthe US, but we now wonder with the stabilisation in the official\nChina PMI whether investors should also look at materials where\nP/B is the lowest of 15 years,\" Credit Suisse analysts Sakthi\nSiva and Kin Nang Chik says\n    ** China quickens growth-supportive policy initiatives -\ncuts purchase tax by 50% for small autos; PBoC lowers minimum\ndown payment ratio to 25% from 30% for first home mortgage \n    ** Also, weak US jobs dampen prospects of near-term Fed hike\n[ID:nLNN2LEBGC]\n    ** Australia's BHP Billiton <BHP.AX> up 3.9% , Newcrest\n<NCM.AX> jumps 8.8% while Rio Tinto <RIO.AX> rises 2.3%\n    ** Japan's JFE Holdings <5411.T> advances 4.5 pct,\nMitsubishi Chemical Holding <4188.T> gains 4.2 pct, Nippon Paint\n<4612.T> jumps 6.4 pct\n\n\n\n\n (RM: abhishek.vishnoi.thomsonreuters.com@reuters.net)\n ((abhishek.vishnoi@thomsonreuters.com; +91 22 61807225))"
        },
        {
          "time": "2015-10-05T07:20:32.012Z",
          "headline": "Faltering Chinese demand keeps beating down coal prices ",
          "newsBody": "    * Morgan Stanley cuts long-term coal price forecast\n    * Producers benefit from weaker currencies to lift\nproduction\n    * Coal most prominent victim of end of commodity\n\"super-cycle\"\n\n    By Jacob Gronholt-Pedersen and Henning Gloystein\n    SINGAPORE, Oct 5 (Reuters) - Slumping Chinese demand\ncontinues to batter thermal coal prices in the first week of the\nfourth quarter, with benchmark physical cargoes dropping to\ntheir lowest in more than eight years. \n    That has made coal, mostly used for power generation in\nemerging markets, the most prominent victim of what some say is\nthe end of a commodity \"super-cycle\" that followed the rapid\nindustrialisation of China after it opened up in the 1980s.\n[ID:nL5N1222IU]\n    Prompt cargo prices from Australia's Newcastle\n<GCLNWCPFBMc1> and from South Africa's Richards Bay\n<GCLRCBPFBMc1> terminals have both dropped to around $50 per\ntonne, close to levels last seen in the first half of 2007.\n[ID:nL5N11L02O] \n    Key coal futures prices <TRAPI2Yc1> last week settled below\n$50 per tonne for the first time since 2003, having fallen in\ntwelve of the last fourteen weeks.\n    \"Declining thermal coal prices reflects abatement in China's\nindustrial activity,\" said Tom Price, analyst at U.S. investment\nbank Morgan Stanley.\n    The bank on Monday cut its long-term price forecast by 11\npercent to $63 per tonne on a free-on-board basis (FOB), as\ndemand in China drops amid abundant supply.   \n    U.S. competitor Goldman Sachs said in September the resource\nwould never again gain enough traction to lift it out of its\nslump and warrant investment into the sector. [ID:nL5N11T014]\n    Coal is the main fuel for electricity in China, but power\noutput is now growing at only 4 percent per year, far below\nannual growth rates of around 10 percent since 2000, Morgan\nStanley noted.\n    China's coal imports have collapsed some 30 percent since\nthe beginning of the year, even as major producers China Shenhua\nEnergy <601088.SS> <1088.HK> and China Coal Energy <601898.SS>\n<601898.HK> cut domestic output.\n    Morgan Stanley expects a short-term recovery in coal prices\nover the next year, followed by a flat price outlook for an\nextended period.\n    The fall in coal prices, along with routs for other mined\nraw materials such as iron ore, has contributed to a clobbering\nof the shares of BHP Billiton <BHP.AX>, Rio Tinto <RIO.AX> and\nother mining giants, which have taken a bigger beating than\nthose of most energy firms. [ID:nL5N11Z1DK]\n    Weakening currencies of resource-rich producers such as\nAustralia, South Africa and Columbia has also added to the glut\nof coal and other mined commodities. \n    \"In the massive, highly competitive global thermal coal\ntrade, any favourable exchange rate move simply encourages\nexposed miners to lift or sustain production rates in order to\npreserve market share,\" Morgan Stanley's Price said.\n    A drop in oil prices have also helped miners lower\nproduction costs by 5 to 10 percent this year, he said.\n\n    <^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\nGRAPHIC-API2 coal futures:    http://link.reuters.com/rap75w\nGRAPHIC-Coal producer share prices:     http://link.reuters.com/tap75w\n    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^>\n (Editing by Tom Hogue)\n ((jacob.pedersen@thomsonreuters.com; +65 6417 4529; Reuters\nMessaging: jacob.pedersen.thomsonreuters.com@reuters.net))\n\nKeywords: CHINA COAL/PRICES"
        },
        {
          "time": "2015-10-05T07:20:32.012Z",
          "headline": "Faltering Chinese demand keeps beating down coal prices ",
          "newsBody": "    * Morgan Stanley cuts long-term coal price forecast\n    * Producers benefit from weaker currencies to lift\nproduction\n    * Coal most prominent victim of end of commodity\n\"super-cycle\"\n\n    By Jacob Gronholt-Pedersen and Henning Gloystein\n    SINGAPORE, Oct 5 (Reuters) - Slumping Chinese demand\ncontinues to batter thermal coal prices in the first week of the\nfourth quarter, with benchmark physical cargoes dropping to\ntheir lowest in more than eight years. \n    That has made coal, mostly used for power generation in\nemerging markets, the most prominent victim of what some say is\nthe end of a commodity \"super-cycle\" that followed the rapid\nindustrialisation of China after it opened up in the 1980s.\n[ID:nL5N1222IU]\n    Prompt cargo prices from Australia's Newcastle\n<GCLNWCPFBMc1> and from South Africa's Richards Bay\n<GCLRCBPFBMc1> terminals have both dropped to around $50 per\ntonne, close to levels last seen in the first half of 2007.\n[ID:nL5N11L02O] \n    Key coal futures prices <TRAPI2Yc1> last week settled below\n$50 per tonne for the first time since 2003, having fallen in\ntwelve of the last fourteen weeks.\n    \"Declining thermal coal prices reflects abatement in China's\nindustrial activity,\" said Tom Price, analyst at U.S. investment\nbank Morgan Stanley.\n    The bank on Monday cut its long-term price forecast by 11\npercent to $63 per tonne on a free-on-board basis (FOB), as\ndemand in China drops amid abundant supply.   \n    U.S. competitor Goldman Sachs said in September the resource\nwould never again gain enough traction to lift it out of its\nslump and warrant investment into the sector. [ID:nL5N11T014]\n    Coal is the main fuel for electricity in China, but power\noutput is now growing at only 4 percent per year, far below\nannual growth rates of around 10 percent since 2000, Morgan\nStanley noted.\n    China's coal imports have collapsed some 30 percent since\nthe beginning of the year, even as major producers China Shenhua\nEnergy <601088.SS> <1088.HK> and China Coal Energy <601898.SS>\n<601898.HK> cut domestic output.\n    Morgan Stanley expects a short-term recovery in coal prices\nover the next year, followed by a flat price outlook for an\nextended period.\n    The fall in coal prices, along with routs for other mined\nraw materials such as iron ore, has contributed to a clobbering\nof the shares of BHP Billiton <BHP.AX>, Rio Tinto <RIO.AX> and\nother mining giants, which have taken a bigger beating than\nthose of most energy firms. [ID:nL5N11Z1DK]\n    Weakening currencies of resource-rich producers such as\nAustralia, South Africa and Columbia has also added to the glut\nof coal and other mined commodities. \n    \"In the massive, highly competitive global thermal coal\ntrade, any favourable exchange rate move simply encourages\nexposed miners to lift or sustain production rates in order to\npreserve market share,\" Morgan Stanley's Price said.\n    A drop in oil prices have also helped miners lower\nproduction costs by 5 to 10 percent this year, he said.\n\n    <^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\nGRAPHIC-API2 coal futures:    http://link.reuters.com/rap75w\nGRAPHIC-Coal producer share prices:     http://link.reuters.com/tap75w\n    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^>\n (Editing by Tom Hogue)\n ((jacob.pedersen@thomsonreuters.com; +65 6417 4529; Reuters\nMessaging: jacob.pedersen.thomsonreuters.com@reuters.net))\n\nKeywords: CHINA COAL/PRICES"
        }
      ]
    }                          </code>
                        </pre>
                        <br>
                        - Data returned with requested instrument ID and Topic Codes<br>
                        - Each News in the newsList contains time(yyyy-MM-ddThh:mm:ss:SSSZ), headline(Title) and newsBody(content) </div>
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