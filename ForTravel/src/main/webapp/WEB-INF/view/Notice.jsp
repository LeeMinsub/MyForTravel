<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/mainSerch.css" rel="stylesheet">
   <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <!-- <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
   <!-- jQuery -->
    
        <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
  <style type="text/css">
    .noticetable{
    	width: 10%;
    	text-align: center;	
    }
     #map {
     	padding:0px;
        height: 90%;
        width: 100%;
        position:absolute; 
        overflow: auto; 
      }
      #MapMapping{
       	margin:auto;
       	padding:0px;
		height:700px;
      	position: relative;
      }
      .displaytoggle{
      	display: none;
      }
      .displayblock{
      	display:block;
      }
    </style>
    <script type="text/javascript">
var nation = '{"nations":['+

'{"code":"AF", "nation":"Afghanistan", "lat":33.00, "lng":65.00, "lvl":6},'+

'{"code":"AL", "nation":"Albania", "lat":41.00, "lng":20.00, "lvl":8},'+

'{"code":"DZ", "nation":"Algeria", "lat":28.00, "lng":3.00, "lvl":5},'+

'{"code":"AS", "nation":"American Samoa", "lat":-14.30, "lng":-170.65, "lvl":10},'+

'{"code":"AD", "nation":"Andorra", "lat":42.55, "lng":1.60, "lvl":11},'+

'{"code":"AO", "nation":"Angola", "lat":-12.30, "lng":18.30, "lvl":6},'+

'{"code":"AI", "nation":"Anguilla", "lat":18.15, "lng":-63.10, "lvl":10},'+

'{"code":"AQ", "nation":"Antarctica", "lat":-84.00, "lng":0.00, "lvl":3},'+

'{"code":"AG", "nation":"Antigua and Barbuda", "lat":17.09, "lng":-61.80, "lvl":12},'+

'{"code":"AR", "nation":"Argentina", "lat":-34.00, "lng":-64.00, "lvl":5},'+

'{"code":"AM", "nation":"Armenia", "lat":40.00, "lng":45.00, "lvl":8},'+

'{"code":"AW", "nation":"Aruba", "lat":12.515, "lng":-69.95, "lvl":12},'+

'{"code":"AU", "nation":"Australia", "lat":-27.00, "lng":133.00, "lvl":5},'+

'{"code":"AT", "nation":"Austria", "lat":47.20, "lng":13.20, "lvl":7},'+

'{"code":"AZ", "nation":"Azerbaijan", "lat":40.30, "lng":47.30, "lvl":7},'+

'{"code":"BS", "nation":"Bahamas", "lat":24.15, "lng":-76.00, "lvl":8},'+

'{"code":"BH", "nation":"Bahrain", "lat":26.00, "lng":50.33, "lvl":9},'+

'{"code":"BD", "nation":"Bangladesh", "lat":24.00, "lng":90.00, "lvl":7},'+

'{"code":"BB", "nation":"Barbados", "lat":13.15, "lng":-59.60, "lvl":11},'+

'{"code":"BY", "nation":"Belarus", "lat":53.00, "lng":28.00, "lvl":6},'+

'{"code":"BE", "nation":"Belgium", "lat":50.50, "lng":4.00, "lvl":8},'+

'{"code":"BZ", "nation":"Belize", "lat":17.40, "lng":-88.45, "lvl":9},'+

'{"code":"BJ", "nation":"Benin", "lat":9.30, "lng":2.15, "lvl":7},'+

'{"code":"BM", "nation":"Bermuda", "lat":32.30, "lng":-64.80, "lvl":10},'+

'{"code":"BT", "nation":"Bhutan", "lat":27.30, "lng":90.30, "lvl":8},'+

'{"code":"BO", "nation":"Bolivia", "lat":-16.50, "lng":-65.00, "lvl":6},'+

'{"code":"BA", "nation":"Bosnia and Herzegovina", "lat":44.00, "lng":18.00, "lvl":7},'+

'{"code":"BW", "nation":"Botswana", "lat":-22.00, "lng":24.00, "lvl":6},'+

'{"code":"BV", "nation":"Bouvet Island", "lat":-54.45, "lng":3.40, "lvl":10},'+

'{"code":"BR", "nation":"Brazil", "lat":-10.00, "lng":-55.00, "lvl":4},'+

'{"code":"IO", "nation":"British Indian Ocean Territory", "lat":-7.35, "lng":72.45, "lvl":10},'+

'{"code":"BN", "nation":"Brunei", "lat":4.30, "lng":114.40, "lvl":9},'+

'{"code":"BG", "nation":"Bulgaria", "lat":43.00, "lng":25.00, "lvl":7},'+

'{"code":"BF", "nation":"Burkina Faso", "lat":12.70, "lng":-2.00, "lvl":7},'+

'{"code":"BI", "nation":"Burundi", "lat":-3.30, "lng":30.00, "lvl":8},'+

'{"code":"KH", "nation":"Cambodia", "lat":13.00, "lng":105.00, "lvl":7},'+

'{"code":"CM", "nation":"Cameroon", "lat":6.00, "lng":12.00, "lvl":6},'+

'{"code":"CA", "nation":"Canada", "lat":60.00, "lng":-95.00, "lvl":4},'+

'{"code":"CV", "nation":"Cape Verde", "lat":16.00, "lng":-24.00, "lvl":8},'+

'{"code":"KY", "nation":"Cayman Islands", "lat":19.30984732486229, "lng":-81.25625610351562, "lvl":10},'+

'{"code":"CF", "nation":"Central African Republic", "lat":7.00, "lng":21.00, "lvl":6},'+

'{"code":"TD", "nation":"Chad", "lat":15.00, "lng":19.00, "lvl":5},'+

'{"code":"CL", "nation":"Chile", "lat":-30.00, "lng":-71.00, "lvl":5},'+

'{"code":"CN", "nation":"China", "lat":35.00, "lng":105.00, "lvl":4},'+

'{"code":"CX", "nation":"Christmas Island", "lat":-10.4864615307745, "lng":105.64453125, "lvl":10},'+

'{"code":"CC", "nation":"Cocos Islands", "lat":-12.165540789425215, "lng":96.84036254882812, "lvl":10},'+

'{"code":"CO", "nation":"Colombia", "lat":4.00, "lng":-72.00, "lvl":5},'+

'{"code":"KM", "nation":"Comoros", "lat":-11.6737554034334, "lng":43.3465576171875, "lvl":9},'+

'{"code":"CG", "nation":"Congo", "lat":-1.00, "lng":15.00, "lvl":6},'+

'{"code":"CD", "nation":"Congo, Democratic Republic of the", "lat":0.00, "lng":25.00, "lvl":5},'+

'{"code":"CK", "nation":"Cook Islands", "lat":-21.224101526391543, "lng":-159.78378295898438, "lvl":10},'+

'{"code":"CR", "nation":"Costa Rica", "lat":9.930976812881799, "lng":-84.1058349609375, "lvl":8},'+

'{"code":"CI", "nation":"Cote dIvoire", "lat":7.689217127736191, "lng":-5.064697265625, "lvl":7},'+

'{"code":"HR", "nation":"Croatia", "lat":45.10, "lng":15.30, "lvl":7},'+

'{"code":"CU", "nation":"Cuba", "lat":21.30, "lng":-80.00, "lvl":6},'+

'{"code":"CY", "nation":"Cyprus", "lat":35.15584570226544, "lng":33.3929443359375, "lvl":9},'+

'{"code":"CZ", "nation":"Czech Republic", "lat":49.45, "lng":15.30, "lvl":7},'+

'{"code":"DK", "nation":"Denmark", "lat":56.00, "lng":10.00, "lvl":7},'+

'{"code":"DJ", "nation":"Djibouti", "lat":11.30, "lng":43.00, "lvl":8},'+

'{"code":"DM", "nation":"Dominica", "lat":15.444414528150116, "lng":-61.34765625, "lvl":10},'+

'{"code":"DO", "nation":"Dominican Republic", "lat":19.00, "lng":-70.40, "lvl":8},'+

'{"code":"EC", "nation":"Ecuador", "lat":-2.00, "lng":-77.30, "lvl":7},'+

'{"code":"EG", "nation":"Egypt", "lat":27.00, "lng":30.00, "lvl":6},'+

'{"code":"SV", "nation":"El Salvador", "lat":13.824745234589408, "lng":-88.8958740234375, "lvl":9},'+

'{"code":"GQ", "nation":"Equatorial Guinea", "lat":1.6587038068676245, "lng":10.2227783203125, "lvl":9},'+

'{"code":"ER", "nation":"Eritrea", "lat":15.00, "lng":39.00, "lvl":7},'+

'{"code":"EE", "nation":"Estonia", "lat":59.00, "lng":26.00, "lvl":7},'+

'{"code":"ET", "nation":"Ethiopia", "lat":9.037002898469423, "lng":38.8037109375, "lvl":6},'+

'{"code":"FK", "nation":"Falkland Islands", "lat":-51.767839887322125, "lng":-59.2822265625, "lvl":6},'+

'{"code":"FO", "nation":"Faroe Islands", "lat":62.01637363111728, "lng":-6.800537109375, "lvl":8},'+

'{"code":"FJ", "nation":"Fiji", "lat":-17.70682812401954, "lng":179.154052734375, "lvl":7},'+

'{"code":"FI", "nation":"Finland", "lat":65.07213008560697, "lng":25.48828125, "lvl":5},'+

'{"code":"FR", "nation":"France", "lat":47.08508535995383, "lng":2.39501953125, "lvl":6},'+

'{"code":"GF", "nation":"French Guiana", "lat":4.00, "lng":-53.00, "lvl":7},'+

'{"code":"PF", "nation":"French Polynesia", "lat":-17.769612247142653, "lng":-149.501953125, "lvl":10},'+

'{"code":"TF", "nation":"French Southern Territories", "lat":-49.39667507519397, "lng":69.4775390625, "lvl":8},'+

'{"code":"GA", "nation":"Gabon", "lat":-1.00, "lng":11.45, "lvl":7},'+

'{"code":"GM", "nation":"Gambia", "lat":13.28, "lng":-16.34, "lvl":8},'+

'{"code":"GE", "nation":"Georgia", "lat":42.00, "lng":43.30, "lvl":7},'+

'{"code":"DE", "nation":"Germany", "lat":51.00, "lng":9.00, "lvl":6},'+

'{"code":"GH", "nation":"Ghana", "lat":8.00, "lng":-2.00, "lvl":7},'+

'{"code":"GI", "nation":"Gibraltar", "lat":36.143142624690505, "lng":-5.3469085693359375, "lvl":13},'+

'{"code":"GR", "nation":"Greece", "lat":39.00, "lng":22.00, "lvl":7},'+

'{"code":"GL", "nation":"Greenland", "lat":77.07878389624943, "lng":-41.8359375, "lvl":3},'+

'{"code":"GD", "nation":"Grenada", "lat":12.115194124236767, "lng":-61.67724609375, "lvl":11},'+

'{"code":"GP", "nation":"Guadeloupe", "lat":16.15, "lng":-61.35, "lvl":10},'+

'{"code":"GU", "nation":"Guam", "lat":13.465757359351159, "lng":144.79293823242188, "lvl":10},'+

'{"code":"GT", "nation":"Guatemala", "lat":15.30, "lng":-90.15, "lvl":7},'+

'{"code":"GG", "nation":"Guernsey", "lat":49.45719018800985, "lng":-2.5793838500976562, "lvl":12},'+

'{"code":"GN", "nation":"Guinea", "lat":10.444597722834875, "lng":-11.00830078125, "lvl":7},'+

'{"code":"GW", "nation":"Guinea-Bissau", "lat":12.00, "lng":-15.00, "lvl":8},'+

'{"code":"GY", "nation":"Guyana", "lat":5.00, "lng":-59.00, "lvl":7},'+

'{"code":"HT", "nation":"Haiti", "lat":19.00, "lng":-72.25, "lvl":8},'+

'{"code":"HM", "nation":"Heard Island and McDonald Islands", "lat":-53.09732259357699, "lng":73.52325439453125, "lvl":10},'+

'{"code":"HN", "nation":"Honduras", "lat":15.00, "lng":-86.30, "lvl":7},'+

'{"code":"HK", "nation":"Hong Kong", "lat":22.43134015636061, "lng":114.13421630859375, "lvl":10},'+

'{"code":"HU", "nation":"Hungary", "lat":47.37603463349758, "lng":19.039306640625, "lvl":7},'+

'{"code":"IS", "nation":"Iceland", "lat":65.00, "lng":-18.00, "lvl":7},'+

'{"code":"IN", "nation":"India", "lat":20.00, "lng":77.00, "lvl":5},'+

'{"code":"ID", "nation":"Indonesia", "lat":-5.00, "lng":120.00, "lvl":5},'+

'{"code":"IR", "nation":"Iran", "lat":32.00, "lng":53.00, "lvl":5},'+

'{"code":"IQ", "nation":"Iraq", "lat":33.00, "lng":44.00, "lvl":6},'+

'{"code":"IE", "nation":"Ireland", "lat":53.45534913802113, "lng":-7.734375, "lvl":7},'+

'{"code":"IM", "nation":"Isle of Man", "lat":54.228313328833536, "lng":-4.54010009765625, "lvl":10},'+

'{"code":"IL", "nation":"Israel", "lat":31.30, "lng":34.45, "lvl":7},'+

'{"code":"IT", "nation":"Italy", "lat":42.50, "lng":12.50, "lvl":6},'+

'{"code":"JM", "nation":"Jamaica", "lat":18.15, "lng":-77.30, "lvl":9},'+

'{"code":"JP", "nation":"Japan", "lat":36.00, "lng":138.00, "lvl":5},'+

'{"code":"JE", "nation":"Jersey", "lat":49.22297891606675, "lng":-2.1402740478515625, "lvl":12},'+

'{"code":"JO", "nation":"Jordan", "lat":31.00, "lng":36.00, "lvl":7},'+

'{"code":"KZ", "nation":"Kazakhstan", "lat":48.00, "lng":68.00, "lvl":5},'+

'{"code":"KE", "nation":"Kenya", "lat":1.00, "lng":38.00, "lvl":6},'+

'{"code":"KI", "nation":"Kiribati", "lat":1.8508742952122357, "lng":-157.64694213867188, "lvl":10},'+

'{"code":"KW", "nation":"Kuwait", "lat":29.324720161511028, "lng":47.70263671875, "lvl":8},'+

'{"code":"KG", "nation":"Kyrgyzstan", "lat":41.00, "lng":75.00, "lvl":7},'+

'{"code":"LA", "nation":"Laos", "lat":18.00, "lng":105.00, "lvl":6},'+

'{"code":"LV", "nation":"latvia", "lat":57.00, "lng":25.00, "lvl":7},'+

'{"code":"LB", "nation":"Lebanon", "lat":33.893217379440884, "lng":35.5078125, "lvl":7},'+

'{"code":"LS", "nation":"Lesotho", "lat":-29.597341920567366, "lng":28.1744384765625, "lvl":8},'+

'{"code":"LR", "nation":"Liberia", "lat":6.30, "lng":-9.30, "lvl":7},'+

'{"code":"LY", "nation":"Libya", "lat":28.420391085674304, "lng":17.60009765625, "lvl":5},'+

'{"code":"LI", "nation":"Liechtenstein", "lat":47.16684287656919, "lng":9.540939331054688, "lvl":11},'+

'{"code":"LT", "nation":"Lithuania", "lat":55.31039088379827, "lng": 23.9501953125, "lvl":7},'+

'{"code":"LU", "nation":"Luxembourg", "lat":49.822037122094414, "lng":6.10015869140625, "lvl":9},'+

'{"code":"MO", "nation":"Macao", "lat":22.17214491738175, "lng":113.56155395507812, "lvl":12},'+

'{"code":"MK", "nation":"Macedonia", "lat":41.50, "lng":22.00, "lvl":8},'+

'{"code":"MG", "nation":"Madagascar", "lat":-20.00, "lng":47.00, "lvl":5},'+

'{"code":"MW", "nation":"Malawi", "lat":-13.30, "lng":34.00, "lvl":6},'+

'{"code":"MY", "nation":"Malaysia", "lat":2.30, "lng":112.30, "lvl":5},'+

'{"code":"MV", "nation":"Maldives", "lat":-0.6138493403822657, "lng":73.09616088867188, "lvl":11},'+

'{"code":"ML", "nation":"Mali", "lat":17.00, "lng":-4.00, "lvl":5},'+

'{"code":"MT", "nation":"Malta", "lat":35.93798832265393, "lng":14.39208984375, "lvl":11},'+

'{"code":"MH", "nation":"Marshall Islands", "lat":7.312071167657926, "lng":168.72390747070312, "lvl":10},'+

'{"code":"MQ", "nation":"Martinique", "lat":14.40, "lng":-61.00, "lvl":8},'+

'{"code":"MR", "nation":"Mauritania", "lat":20.00, "lng":-12.00, "lvl":5},'+

'{"code":"MU", "nation":"Mauritius", "lat":-20.224831682774006, "lng":57.561492919921875, "lvl":10},'+

'{"code":"YT", "nation":"Mayotte", "lat":-12.79774036228197, "lng":45.149688720703125, "lvl":10},'+

'{"code":"MX", "nation":"Mexico", "lat":23.00, "lng":-102.00, "lvl":5},'+

'{"code":"FM", "nation":"Micronesia", "lat":6.892343905203222, "lng":158.21823120117188, "lvl":10},'+

'{"code":"MD", "nation":"Moldova", "lat":47.00, "lng":29.00, "lvl":7},'+

'{"code":"MC", "nation":"Monaco", "lat":43.73910403053943, "lng":7.425470352172852, "lvl":14},'+

'{"code":"MN", "nation":"Mongolia", "lat":46.00, "lng":105.00, "lvl":5},'+

'{"code":"ME", "nation":"Montenegro", "lat":42.87596410238254, "lng":19.248046875, "lvl":8},'+

'{"code":"MS", "nation":"Montserrat", "lat":16.740441231939677, "lng":-62.19291687011719, "lvl":12},'+

'{"code":"MA", "nation":"Morocco", "lat":32.00, "lng":-5.00, "lvl":6},'+

'{"code":"MZ", "nation":"Mozambique", "lat":-18.15, "lng":35.00, "lvl":5},'+

'{"code":"MM", "nation":"Myanmar", "lat":20.756113874762082, "lng":97.03125, "lvl":5},'+

'{"code":"NA", "nation":"Namibia", "lat":-22.573438264572395, "lng":17.07275390625, "lvl":6},'+

'{"code":"NR", "nation":"Nauru", "lat":-0.5369489273009945, "lng":166.91802978515625, "lvl":10},'+

'{"code":"NP", "nation":"Nepal", "lat":28.00, "lng":84.00, "lvl":7},'+

'{"code":"NL", "nation":"Netherlands", "lat":52.30, "lng":5.45, "lvl":7},'+

'{"code":"AN", "nation":"Netherlands Antilles", "lat":12.20379787963988, "lng":-68.98658752441406, "lvl":5},'+

'{"code":"NC", "nation":"New Caledonia", "lat":-21.30, "lng":165.30, "lvl":7},'+

'{"code":"NZ", "nation":"New Zealand", "lat":-41.00, "lng":174.00, "lvl":5},'+

'{"code":"NI", "nation":"Nicaragua", "lat":13.00, "lng":-85.00, "lvl":7},'+

'{"code":"NE", "nation":"Niger", "lat":17.45547257997284, "lng":9.3603515625, "lvl":6},'+

'{"code":"NG", "nation":"Nigeria", "lat":10.00, "lng":8.00, "lvl":6},'+

'{"code":"NU", "nation":"Niue", "lat":-19.05822387777432, "lng":-169.86373901367188, "lvl":10},'+

'{"code":"NF", "nation":"Norfolk Island", "lat":-29.035759963925884, "lng":167.947998046875, "lvl":10},'+

'{"code":"MP", "nation":"Northern Mariana Islands", "lat":15.149020452896462, "lng":145.71990966796875, "lvl":10},'+

'{"code":"KP", "nation":"North Korea", "lat":40.00, "lng":127.00, "lvl":6},'+

'{"code":"NO", "nation":"Norway", "lat":66.05371622067922, "lng":10.00, "lvl":4},'+

'{"code":"OM", "nation":"Oman", "lat":21.00, "lng":57.00, "lvl":6},'+

'{"code":"PK", "nation":"Pakistan", "lat":30.00, "lng":70.00, "lvl":5},'+

'{"code":"PW", "nation":"Palau", "lat":7.30, "lng":134.30, "lvl":9},'+

'{"code":"PS", "nation":"Palestinian Territories", "lat":31.436865467417928, "lng":34.374847412109375, "lvl":10},'+

'{"code":"PA", "nation":"Panama", "lat":8.542997605026342, "lng":-80.0738525390625, "lvl":8},'+

'{"code":"PG", "nation":"Papua New Guinea", "lat":-6.00, "lng":147.00, "lvl":7},'+

'{"code":"PY", "nation":"Paraguay", "lat":-23.00, "lng":-58.00, "lvl":6},'+

'{"code":"PE", "nation":"Peru", "lat":-10.00, "lng":-76.00, "lvl":5},'+

'{"code":"PH", "nation":"Philippines", "lat":13.00, "lng":122.00, "lvl":5},'+

'{"code":"PN", "nation":"Pitcairn", "lat":-24.369615456124507, "lng":-128.3148193359375, "lvl":10},'+

'{"code":"PL", "nation":"Poland", "lat":52.00, "lng":20.00, "lvl":6},'+

'{"code":"PT", "nation":"Portugal", "lat":39.50404070558415, "lng":-8.00, "lvl":7},'+

'{"code":"PR", "nation":"Puerto Rico", "lat":18.15, "lng":-66.30, "lvl":7},'+

'{"code":"QA", "nation":"Qatar", "lat":25.30, "lng":51.15, "lvl":8},'+

'{"code":"RE", "nation":"Reunion", "lat":-21.098594269392088, "lng":55.52490234375, "lvl":10},'+

'{"code":"RO", "nation":"Romania", "lat":46.00, "lng":25.00, "lvl":7},'+

'{"code":"RU", "nation":"Russia", "lat":60.00, "lng":100.00, "lvl":3},'+

'{"code":"RW", "nation":"Rwanda", "lat":-2.00, "lng":30.00, "lvl":8},'+

'{"code":"SH", "nation":"Saint Helena", "lat":-15.966610400903184, "lng":-5.714263916015625, "lvl":10},'+

'{"code":"KN", "nation":"Saint Kitts and Nevis", "lat":17.316554333389497, "lng":-62.7154541015625, "lvl":10},'+

'{"code":"LC", "nation":"Saint Lucia", "lat":13.935400058483737, "lng":-60.9576416015625, "lvl":10},'+

'{"code":"PM", "nation":"Saint Pierre and Miquelon", "lat":46.89210855010362, "lng":-56.20, "lvl":10},'+

'{"code":"VC", "nation":"Saint Vincent and the Grenadines", "lat":13.15, "lng":-61.12, "lvl":10},'+

'{"code":"WS", "nation":"Samoa", "lat":-13.35, "lng":-172.20, "lvl":10},'+

'{"code":"SM", "nation":"San Marino", "lat":43.94141717295212, "lng":12.458152770996094, "lvl":12},'+

'{"code":"ST", "nation":"Sao Tome and Principe", "lat":0.22796570712403824, "lng":6.628875732421875, "lvl":10},'+

'{"code":"SA", "nation":"Saudi Arabia", "lat":25.00, "lng":45.00, "lvl":5},'+

'{"code":"SN", "nation":"Senegal", "lat":14.00, "lng":-14.00, "lvl":7},'+

'{"code":"RS", "nation":"Serbia", "lat":44.00, "lng":21.00, "lvl":7},'+

'{"code":"CS", "nation":"Serbia and Montenegro", "lat":42.30, "lng":19.18, "lvl":5},'+

'{"code":"SC", "nation":"Seychelles", "lat":-4.35, "lng":55.40, "lvl":9},'+

'{"code":"SL", "nation":"Sierra Leone", "lat":8.591884405798213, "lng":-11.7938232421875, "lvl":8},'+

'{"code":"SG", "nation":"Singapore", "lat":1.3587440869100178, "lng":103.84346008300781, "lvl":11},'+

'{"code":"SK", "nation":"Slovakia", "lat":48.79600890414036, "lng":19.6380615234375, "lvl":8},'+

'{"code":"SI", "nation":"Slovenia", "lat":46.07, "lng":14.49, "lvl":8},'+

'{"code":"SB", "nation":"Solomon Islands", "lat":-8.00, "lng":159.00, "lvl":7},'+

'{"code":"SO", "nation":"Somalia", "lat":5.309766171943691, "lng":46.0546875, "lvl":6},'+

'{"code":"ZA", "nation":"South Africa", "lat":-29.00, "lng":24.00, "lvl":5},'+

'{"code":"GS", "nation":"South Georgia and the South Sandwich Islands", "lat":-54.30, "lng":-37.00, "lvl":8},'+

'{"code":"KR", "nation":"South Korea", "lat":37.00, "lng":127.30, "lvl":6},'+

'{"code":"ES", "nation":"Spain", "lat":40.00, "lng":-4.00, "lvl":6},'+

'{"code":"LK", "nation":"Sri Lanka", "lat":7.00, "lng":81.00, "lvl":7},'+

'{"code":"SD", "nation":"Sudan", "lat":15.00, "lng":30.00, "lvl":5},'+

'{"code":"SR", "nation":"Suriname", "lat":4.00, "lng":-56.00, "lvl":7},'+

'{"code":"SJ", "nation":"Svalbard and Jan Mayen", "lat":78.00, "lng":20.00, "lvl":5},'+

'{"code":"SZ", "nation":"Swaziland", "lat":-26.30, "lng":31.30, "lvl":8},'+

'{"code":"SE", "nation":"Sweden", "lat":62.00, "lng":15.00, "lvl":4},'+

'{"code":"CH", "nation":"Switzerland", "lat":46.90149244734082, "lng":8.28369140625, "lvl":8},'+

'{"code":"SY", "nation":"Syria", "lat":35.00, "lng":38.00, "lvl":7},'+

'{"code":"TW", "nation":"Taiwan", "lat":23.30, "lng":121.00, "lvl":7},'+

'{"code":"TJ", "nation":"Tajikistan", "lat":39.00, "lng":71.00, "lvl":7},'+

'{"code":"TZ", "nation":"Tanzania", "lat":-6.00, "lng":35.00, "lvl":6},'+

'{"code":"TH", "nation":"Thailand", "lat":15.00, "lng":100.00, "lvl":5},'+

'{"code":"TL", "nation":"Timor-Leste", "lat":-8.50, "lng":125.55, "lvl":8},'+

'{"code":"TG", "nation":"Togo", "lat":8.00, "lng":1.10, "lvl":7},'+

'{"code":"TK", "nation":"Tokelau", "lat":-9.197003998984497, "lng":-171.85638427734375, "lvl":9},'+

'{"code":"TO", "nation":"Tonga", "lat":-21.20361781881226, "lng":-175.13580322265625, "lvl":9},'+

'{"code":"TT", "nation":"Trinidad and Tobago", "lat":10.531020008464989, "lng":-61.16363525390625, "lvl":9},'+

'{"code":"TN", "nation":"Tunisia", "lat":34.00, "lng":9.00, "lvl":6},'+

'{"code":"TR", "nation":"Turkey", "lat":39.00, "lng":35.00, "lvl":6},'+

'{"code":"TM", "nation":"Turkmenistan", "lat":40.00, "lng":60.00, "lvl":6},'+

'{"code":"TC", "nation":"Turks and Caicos Islands", "lat":21.788831884851852, "lng":-71.71875, "lvl":10},'+

'{"code":"TV", "nation":"Tuvalu", "lat":-8.514477408346133, "lng":179.18426513671875, "lvl":10},'+

'{"code":"UG", "nation":"Uganda", "lat":1.00, "lng":32.00, "lvl":6},'+

'{"code":"UA", "nation":"Ukraine", "lat":49.00, "lng":32.00, "lvl":6},'+

'{"code":"AE", "nation":"United Arab Emirates", "lat":24.00, "lng":54.00, "lvl":7},'+

'{"code":"GB", "nation":"United Kingdom", "lat":54.00, "lng":-2.00, "lvl":5},'+

'{"code":"US", "nation":"United States", "lat":38.00, "lng":-97.00, "lvl":4},'+

'{"code":"UY", "nation":"Uruguay", "lat":-33.00, "lng":-56.00, "lvl":7},'+

'{"code":"UZ", "nation":"Uzbekistan", "lat":41.00, "lng":64.00, "lvl":6},'+

'{"code":"VU", "nation":"Vanuatu", "lat":-16.00, "lng":167.00, "lvl":7},'+

'{"code":"VA", "nation":"Vatican City", "lat":41.90361855925283, "lng":12.453603744506836, "lvl":16},'+

'{"code":"VE", "nation":"Venezuela", "lat":7.1663003819031825, "lng":-66.0498046875, "lvl":6},'+

'{"code":"VN", "nation":"Vietnam", "lat":16.10, "lng":107.50, "lvl":5},'+

'{"code":"VG", "nation":"Virgin Islands, British", "lat":18.43499333816783, "lng":-64.62776184082031, "lvl":12},'+

'{"code":"VI", "nation":"Virgin Islands, U.S.", "lat":18.054478439496073, "lng":-64.79736328125, "lvl":10},'+

'{"code":"WF", "nation":"Wallis and Futuna", "lat":-14.305638794557638, "lng":-178.12545776367188, "lvl":10},'+

'{"code":"EH", "nation":"Western Sahara", "lat":24.30, "lng":-13.00, "lvl":6},'+

'{"code":"YE", "nation":"Yemen", "lat":15.00, "lng":48.00, "lvl":6},'+

'{"code":"ZM", "nation":"Zambia", "lat":-13.025965926333527, "lng":28.32275390625, "lvl":6},'+

'{"code":"ZW", "nation":"Zimbabwe", "lat":-20.00, "lng":30.00, "lvl":6}]}';

</script>


<script type="text/javascript">
	$(document).ready(function() {
		//ajax 통신
		$.ajax({
			type : "get",
			url : "file/getTravelBanList.xml",
			dataType : "xml",
			success : function(responseData, status, xhr) {
				var mesg = "";
				var totalCount = $(responseData).find("totalCount").text();
				$(responseData).find("item").each(function(idx, obj) {
					var countryName = $(this).find("countryName").text();
					var countryEnName = $(this).find("countryEnName").text();
					var continent = $(this).find("continent").text();
					var ban = $(this).find("ban").text();
					var banPartial = $(this).find("banPartial").text();
					var banNote = $(this).find("banNote").text();
					var wrtDt = $(this).find("wrtDt").text();
					var info = "<tr>";
						info += "<td>"+countryName+"</td>";
						info += "<td>"+countryEnName+"</td>";
						info += "<td>"+continent+"</td>";
						info += "<td>"+ban+banPartial+"</td>";
						info += "<td>"+banNote+"</td>";
						info += "<td>"+wrtDt+"</td>";
						info += "</tr>";
						mesg += info;
					$("#addBanTable").html(mesg);
				});
				$(".BanTotalCount").append(totalCount);
				
			},
			error : function(error) {
				console.log(error);
			}
		}); //end ajax
		$.ajax({
			type:"get",
			url:"file/getTravelWarningList.xml",
			dataType:"xml",
			success:function(responseData,status,xhr){
				var mesg ="";
				var totalCount=$(responseData).find("totalCount");
				$(responseData).find("item").each(function(idx,obj){
					var continent=$(this).find("continent").text();
					var countryName=$(this).find("countryName").text();
					var countryEnName=$(this).find("countryEnName").text();
					var wrtDt=$(this).find("wrtDt").text();
					var attention=$(this).find("attention").text();
					var attentionPartial=$(this).find("attentionPartial").text();
					var attentionNote=$(this).find("attentionNote").text();
					var control=$(this).find("control").text();
					var controlPartial=$(this).find("controlPartial").text();
					var controlNote=$(this).find("controlNote").text();
					var limit=$(this).find("limit").text();
					var limitPartial=$(this).find("limitPartial").text();
					var limitNote=$(this).find("limitNote").text(); 
					var info = "<tr>";
					info += "<td>"+continent+"</td>";
					info += "<td>"+countryName+"</td>";
					info += "<td>"+countryEnName+"</td>";
					info += "<td>"+wrtDt+"</td>";
					info += "<td>"+attention+attentionPartial+"</td>";
					info += "<td>"+attentionNote+"</td>";
					info += "<td>"+control+controlPartial+"</td>";
					info += "<td>"+controlNote+"</td>";
					info += "<td>"+limit+limitPartial+"</td>";
					info += "<td>"+limitNote+"</td>";
					info += "</tr>";
					mesg += info;
					
				$("#addWarningTable").html(mesg);
				});
				$("#WarningTotalCount").append(totalCount);
			},
			error:function(error){
				console.log(error);
			}
		}); //end ajax
		$("body").on("click","#BanTableaTag",function(event){
			if($("#BanTableDiv").attr("style")=='display: block; cursor: pointer;'){
				$("#BanTableDiv").css("display","none"); 
			}else{
				$("#BanTableDiv").css("display","block");
			}
			});//end BanTableaTag event

			$("body").on("click","#WarningTableaTag",function(event){
			if($("#WarningTableDiv").attr("style")=='display: block; width: 100%;'){
				$("#WarningTableDiv").css("display","none");
				
			}else{
				$("#WarningTableDiv").css("display","block");
			}
			});//end BanTableaTag event
			
	
	}); /* endDoucumentReady */
	
	
</script>       
</head>
<body>
   <jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include  page="maininclude/navi.jsp" flush="true"/>
 
    
<div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">공지사항
                    <small>여행 정보</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">공지사항</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
        
	<small><font color=red>주의!</font> 본 정보에는 오류가 있을 수 있으며, <a href="http://www.0404.go.kr/dev/main.mofa">외교부해외안전여행</a> 사이트에서 정확한 정보를 확인하실 수 있습니다.</small><br>
	<small> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 각 목록 업데이트 날짜는 본 사이트(4Travel)의 데이터 업데이트 날짜를 의미 합니다.</small>
       
       
        <!-- /.row -->
        <hr>
        <form action="BanListUpdate" name="banUpdateForm" method="post">
        	<!-- <input type="hidden" name="banUpdateDate"  id="banUpdateDate"> -->
            <button id="banUpdate">금지목록 업데이트</button>&nbsp;&nbsp;<font color="red"><small>주의! 업데이트는 시간이 다소 걸리는 과정입니다</small></font><br>
            </form>
             금지목록 마지막 업데이트 날짜:<span id="banUpdateDate">${TravelNoticeDTO.bandate}</span><br>
             
         <a id="BanMapTag">금지목록 지도로 보기 </a>
         <div id="MapMapping">
		 <div id="map"></div> 
		 <div class="BanTotalCount" style="position: relative; color: red;">TotalCount:</div>
         </div>
         <a id="BanTableaTag">금지목록 테이블로 보기 </a>
         <div id="BanTableDiv" style="display: none; cursor: pointer;">
        <table border="1" id="BanTable">
		<thead>
			<tr>
				<th>국가명</th>
				<th>영문 국가명</th>
				<th>대륙</th>
				<th>여행금지/(일부)</th>
				<th>여행금지 내용</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody id="addBanTable">
		
		</tbody>
	</table>
		<div class="BanTotalCount">TotalCount:</div>
    </div>
    <hr>
     <form action="WarningListUpdate" name="warningUpdateForm" method="post">
        	<!-- <input type="hidden" name="warningUpdateDate"  id="warningUpdateDate"> -->
            <button id="warningUpdate">경보목록 업데이트</button>&nbsp;&nbsp;<font color="red"><small>주의! 업데이트는 시간이 다소 걸리는 과정입니다</small></font><br>
        </form>  
           
            경보목록 마지막 업데이트 날짜:<span id="warningUpdateDate">${TravelNoticeDTO.warningDate}</span><br>
         <a id="WarningTableaTag">경보목록 테이블로 보기 </a>
         <div id="WarningTableDiv" style="display: none; width: 100%;">
         <table border="1" id="warningTable" style="width: 100%; height:2000px; overflow: auto; text-align: center;" > 
		<thead>
			<tr class="noticetable">
				<th class="noticetable" colsapn="14">대륙</th>
				<th class="noticetable" colsapn="13">국가명</th>
				<th class="noticetable" colsapn="13">영문 국가명</th>
				<th class="noticetable" colsapn="13">등록일</th>
				<th class="noticetable" colsapn="13">여행유의/(일부)</th>
				<th class="noticetable" colsapn="13">여행유의 내용</th>
				<th class="noticetable" colsapn="13">여행자제/(일부)</th>
				<th class="noticetable" colsapn="13">여행자제 내용</th>
				<th class="noticetable" colsapn="13">여행제한/(일부)</th>
				<th class="noticetable" colsapn="13">여행제한 내용</th>
			</tr>
		</thead>
		<tbody id="addWarningTable">
		
		</tbody>
	</table>
	<div id="WarningTotalCount">TotalCount:</div>
    </div>
    <hr>
    
   <small> 출처: <a href="https://www.data.go.kr/">공공데이터포털</a>의 여행금지제도,여행경보제도 api </small><br>
   <small> 원본 xml : <a href="http://apis.data.go.kr/1262000/TravelBanService/getTravelBanList?ServiceKey=Mf2l3D3UqYuFtvFpn8hCECfVaMTxH9HCvqZTuAmsPYNNqJ8i8rrBH5ExjOsYcbJ1kYpixDEzmiN7dWQRk6ZXhw%3D%3D">여행금지제도</a>,<a href="http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=Mf2l3D3UqYuFtvFpn8hCECfVaMTxH9HCvqZTuAmsPYNNqJ8i8rrBH5ExjOsYcbJ1kYpixDEzmiN7dWQRk6ZXhw%3D%3D&numOfRows=150">여행경보제도</a></small>
    <hr>
    </div>
    </div>
        <!-- Footer -->
 <jsp:include page="maininclude/forcopy.jsp" flush="true" />
    <!-- /.container -->


    <script>
  		var obj = JSON.parse(nation);
    	 objnation=obj.nations;
  		sameCountryName = [];
  		sameCountryEnName = [];
  		sameBan = [];
  		sameBanNote = [];
  		sameWrtDt = [];
  		sameLat=[];
  		sameLng=[];
  		//ajax 통신
  		$.ajax({
  			type : "get",
  			url : "file/getTravelBanList.xml",
  			async:false,
  			dataType : "xml",
  			success : function(responseData, status, xhr) {
  				var mesg = "";
  				var totalCount = $(responseData).find("totalCount").text();
  				$(responseData).find("item").each(function(idx, obj) {
  					var countryName = $(this).find("countryName").text();
  					var countryEnName = $(this).find("countryEnName").text();
  					var continent = $(this).find("continent").text();
  					var ban = $(this).find("ban").text();
  					var banPartial = $(this).find("banPartial").text();
  					var banNote = $(this).find("banNote").text();
  					var wrtDt = $(this).find("wrtDt").text();
  					for (var i = 0; i < objnation.length; i++) {
  						if(objnation[i].nation == countryEnName){
  							sameCountryName[sameCountryName.length] = countryName;
  							sameLat[sameLat.length] = objnation[i].lat;
  							sameLng[sameLng.length] = objnation[i].lng;
  							if(ban != '' && banPartial==''){
  								sameBan[sameBan.length] = ban;
  					  		}
  							if(banPartial != '' && ban==''){
  					  			sameBan[sameBan.length] = banPartial;
  					  		}
  					  		sameBanNote[sameBanNote.length] = banNote;
  					  		sameWrtDt[sameWrtDt.length] = wrtDt;	
  						}
					}//end for
  				});//end each
  			},//end sucess
  			error : function(error) {
  				console.log(error);
  			}
  		}); //end ajax
    
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 2,
          center: {lat: 37.00, lng: 127.30 }
        });
        // Display the area between the location southWest and northEast.
        // Add 5 markers to map at random locations.
        // For each of these markers, give them a title with their index, and when
        // they are clicked they should open an infowindow with text from a secret
        // message.
        //var secretMessages = ['This', 'is', 'the', 'secret', 'message'];
        contentString = [];
        for (var i = 0; i < sameCountryName.length; i++) {
          var marker = new google.maps.Marker({
            position: {
              lat: parseFloat(sameLat[i]),
              lng: parseFloat(sameLng[i])
            },
            map: map
          });
          contentString[i] ='국가명&nbsp;:&nbsp;'+sameCountryName[i]+'<br/>'+'금지사항&nbsp;:&nbsp;'+sameBan[i]+'<br/>'+'Note&nbsp;:&nbsp;'+sameBanNote[i]
          					+'<br/>'+'작성일&nbsp;:&nbsp;'+sameWrtDt[i];
          attachSecretMessage(marker, objnation[i].nation);
          function attachSecretMessage(marker, secretMessage) {
              var infowindow = new google.maps.InfoWindow({
                content: contentString[i]
              });

              marker.addListener('click', function() {
                infowindow.open(marker.get('map'), marker);
              });
            }
        }
      }
      $(document).ready(function() {
    	  
		$("body").on("click","#BanMapTag",function(){
			$("#MapMapping").toggleClass("displaytoggle");
		});    	  
    	  
      });
      
    </script>
    <!-- /.container -->
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9pjYyBZSV-jNs6d8o58mEXsgqe4ecpCA&callback=initMap">
    </script>
    <!-- jQuery -->
    
        <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>