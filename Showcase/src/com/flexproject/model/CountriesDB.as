package com.flexproject.model
{
	
	/**
	 * 
	 * @author Pedro Machado
	 * 
	 */
	public class CountriesDB
	{
		
		public static function getCountryArray():Array
		{
			var arr:Array= [];
			for each (var obj:Object in CountriesDB.Country.country)
			{
				arr.push(obj);
			}
			return arr;
		}
public static var Country:XML=new XML(
	<countries>
		<country code="US" iso="840" label="United States" />
		<country code="CA" iso="124" label="Canada" />
		<country code="GB" iso="826" label="United Kingdom" />
		<country code="AF" iso="4" label="Afghanistan" />
		<country code="AL" iso="8" label="Albania" />
		<country code="DZ" iso="12" label="Algeria" />
		<country code="AS" iso="16" label="American Samoa" />
		<country code="AD" iso="20" label="Andorra" />
		<country code="AO" iso="24" label="Angola" />
		<country code="AI" iso="660" label="Anguilla" />
		<country code="AQ" iso="10" label="Antarctica" />
		<country code="AG" iso="28" label="Antigua And Barbuda" />
		<country code="AR" iso="32" label="Argentina" />
		<country code="AM" iso="51" label="Armenia" />
		<country code="AW" iso="533" label="Aruba" />
		<country code="AU" iso="36" label="Australia" />
		<country code="AT" iso="40" label="Austria" />
		<country code="AZ" iso="31" label="Azerbaijan" />
		<country code="BS" iso="44" label="Bahamas" />
		<country code="BH" iso="48" label="Bahrain" />
		<country code="BD" iso="50" label="Bangladesh" />
		<country code="BB" iso="52" label="Barbados" />
		<country code="BY" iso="112" label="Belarus" />
		<country code="BE" iso="56" label="Belgium" />
		<country code="BZ" iso="84" label="Belize" />
		<country code="BJ" iso="204" label="Benin" />
		<country code="BM" iso="60" label="Bermuda" />
		<country code="BT" iso="64" label="Bhutan" />
		<country code="BO" iso="68" label="Bolivia" />
		<country code="BA" iso="70" label="Bosnia And Herzegovina" />
		<country code="BW" iso="72" label="Botswana" />
		<country code="BV" iso="74" label="Bouvet Island" />
		<country code="BR" iso="76" label="Brazil" />
		<country code="IO" iso="86" label="British Indian Ocean Territory" />
		<country code="BN" iso="96" label="Brunei Darussalam" />
		<country code="BG" iso="100" label="Bulgaria" />
		<country code="BF" iso="854" label="Burkina Faso" />
		<country code="BI" iso="108" label="Burundi" />
		<country code="KH" iso="116" label="Cambodia" />
		<country code="CM" iso="120" label="Cameroon" />
		<country code="CV" iso="132" label="Cape Verde" />
		<country code="KY" iso="136" label="Cayman Islands" />
		<country code="CF" iso="140" label="Central African Republic" />
		<country code="TD" iso="148" label="Chad" />
		<country code="CL" iso="152" label="Chile" />
		<country code="CN" iso="156" label="China" />
		<country code="CX" iso="162" label="Christmas Island" />
		<country code="CC" iso="166" label="Cocos (Keeling) Islands" />
		<country code="CO" iso="170" label="Colombia" />
		<country code="KM" iso="174" label="Comoros" />
		<country code="CG" iso="178" label="Congo" />
		<country code="CK" iso="184" label="Cook Islands" />
		<country code="CR" iso="188" label="Costa Rica" />
		<country code="CI" iso="384" label="Cote D'Ivoire" />
		<country code="HR" iso="191" label="Croatia (Local Name: Hrvatska)" />
		<country code="CU" iso="192" label="Cuba" />
		<country code="CY" iso="196" label="Cyprus" />
		<country code="CZ" iso="203" label="Czech Republic" />
		<country code="DK" iso="208" label="Denmark" />
		<country code="DJ" iso="262" label="Djibouti" />
		<country code="DM" iso="212" label="Dominica" />
		<country code="DO" iso="214" label="Dominican Republic" />
		<country code="EC" iso="218" label="Ecuador" />
		<country code="EG" iso="818" label="Egypt" />
		<country code="SV" iso="222" label="El Salvador" />
		<country code="GQ" iso="226" label="Equatorial Guinea" />
		<country code="ER" iso="232" label="Eritrea" />
		<country code="EE" iso="233" label="Estonia" />
		<country code="ET" iso="210" label="Ethiopia" />
		<country code="FK" iso="238" label="Falkland Islands (Malvinas)" />
		<country code="FO" iso="234" label="Faroe Islands" />
		<country code="FJ" iso="242" label="Fiji" />
		<country code="FI" iso="246" label="Finland" />
		<country code="FR" iso="250" label="France" />
		<country code="FX" iso="249" label="France, Metropolitan" />
		<country code="GF" iso="254" label="French Guiana" />
		<country code="PF" iso="258" label="French Polynesia" />
		<country code="TF" iso="260" label="French Southern Territories" />
		<country code="GA" iso="266" label="Gabon" />
		<country code="GM" iso="270" label="Gambia" />
		<country code="GE" iso="268" label="Georgia" />
		<country code="DE" iso="276" label="Germany" />
		<country code="GH" iso="288" label="Ghana" />
		<country code="GI" iso="292" label="Gibraltar" />
		<country code="GR" iso="300" label="Greece" />
		<country code="GL" iso="304" label="Greenland" />
		<country code="GD" iso="308" label="Grenada" />
		<country code="GP" iso="312" label="Guadeloupe" />
		<country code="GU" iso="316" label="Guam" />
		<country code="GT" iso="320" label="Guatemala" />
		<country code="GN" iso="324" label="Guinea" />
		<country code="GW" iso="624" label="Guinea-Bissau" />
		<country code="GY" iso="328" label="Guyana" />
		<country code="HT" iso="332" label="Haiti" />
		<country code="HM" iso="334" label="Heard Island & Mcdonald Islands" />
		<country code="HN" iso="340" label="Honduras" />
		<country code="HK" iso="344" label="Hong Kong" />
		<country code="HU" iso="348" label="Hungary" />
		<country code="IS" iso="352" label="Iceland" />
		<country code="IN" iso="356" label="India" />
		<country code="ID" iso="360" label="Indonesia" />
		<country code="IR" iso="364" label="Iran, Islamic Republic Of" />
		<country code="IQ" iso="368" label="Iraq" />
		<country code="IE" iso="372" label="Ireland" />
		<country code="IL" iso="376" label="Israel" />
		<country code="IT" iso="380" label="Italy" />
		<country code="JM" iso="388" label="Jamaica" />
		<country code="JP" iso="392" label="Japan" />
		<country code="JO" iso="400" label="Jordan" />
		<country code="KZ" iso="398" label="Kazakhstan" />
		<country code="KE" iso="404" label="Kenya" />
		<country code="KI" iso="296" label="Kiribati" />
		<country code="KP" iso="408" label="Korea, Democratic People'S Republic Of" />
		<country code="KR" iso="410" label="Korea, Republic Of" />
		<country code="KW" iso="414" label="Kuwait" />
		<country code="KG" iso="417" label="Kyrgyzstan" />
		<country code="LA" iso="418" label="Lao People'S Democratic Republic" />
		<country code="LV" iso="428" label="Latvia" />
		<country code="LB" iso="422" label="Lebanon" />
		<country code="LS" iso="426" label="Lesotho" />
		<country code="LR" iso="430" label="Liberia" />
		<country code="LY" iso="434" label="Libyan Arab Jamahiriya" />
		<country code="LI" iso="438" label="Liechtenstein" />
		<country code="LT" iso="440" label="Lithuania" />
		<country code="LU" iso="442" label="Luxembourg" />
		<country code="MO" iso="446" label="Macau" />
		<country code="MK" iso="807"
			label="Macedonia, The Former Yugoslav Republic Of" />
		<country code="MG" iso="450" label="Madagascar" />
		<country code="MW" iso="454" label="Malawi" />
		<country code="MY" iso="458" label="Malaysia" />
		<country code="MV" iso="462" label="Maldives" />
		<country code="ML" iso="466" label="Mali" />
		<country code="MT" iso="470" label="Malta" />
		<country code="MH" iso="584" label="Marshall Islands" />
		<country code="MQ" iso="474" label="Martinique" />
		<country code="MR" iso="478" label="Mauritania" />
		<country code="MU" iso="480" label="Mauritius" />
		<country code="YT" iso="175" label="Mayotte" />
		<country code="MX" iso="484" label="Mexico" />
		<country code="FM" iso="583" label="Micronesia, Federated States Of" />
		<country code="MD" iso="498" label="Moldova, Republic Of" />
		<country code="MC" iso="492" label="Monaco" />
		<country code="MN" iso="496" label="Mongolia" />
		<country code="MS" iso="500" label="Montserrat" />
		<country code="MA" iso="504" label="Morocco" />
		<country code="MZ" iso="508" label="Mozambique" />
		<country code="MM" iso="104" label="Myanmar" />
		<country code="NA" iso="516" label="Namibia" />
		<country code="NR" iso="520" label="Nauru" />
		<country code="NP" iso="524" label="Nepal" />
		<country code="NL" iso="528" label="Netherlands" />
		<country code="AN" iso="530" label="Netherlands Antilles" />
		<country code="NC" iso="540" label="New Caledonia" />
		<country code="NZ" iso="554" label="New Zealand" />
		<country code="NI" iso="558" label="Nicaragua" />
		<country code="NE" iso="562" label="Niger" />
		<country code="NG" iso="566" label="Nigeria" />
		<country code="NU" iso="570" label="Niue" />
		<country code="NF" iso="574" label="Norfolk Island" />
		<country code="MP" iso="580" label="Northern Mariana Islands" />
		<country code="NO" iso="578" label="Norway" />
		<country code="OM" iso="512" label="Oman" />
		<country code="PK" iso="586" label="Pakistan" />
		<country code="PW" iso="585" label="Palau" />
		<country code="PA" iso="591" label="Panama" />
		<country code="PG" iso="598" label="Papua New Guinea" />
		<country code="PY" iso="600" label="Paraguay" />
		<country code="PE" iso="604" label="Peru" />
		<country code="PH" iso="608" label="Philippines" />
		<country code="PN" iso="612" label="Pitcairn" />
		<country code="PL" iso="616" label="Poland" />
		<country code="PT" iso="620" label="Portugal" />
		<country code="PR" iso="630" label="Puerto Rico" />
		<country code="QA" iso="634" label="Qatar" />
		<country code="RE" iso="638" label="Reunion" />
		<country code="RO" iso="642" label="Romania" />
		<country code="RU" iso="643" label="Russian Federation" />
		<country code="RW" iso="646" label="Rwanda" />
		<country code="SH" iso="654" label="Saint Helena" />
		<country code="KN" iso="659" label="Saint Kitts And Nevis" />
		<country code="LC" iso="662" label="Saint Lucia" />
		<country code="PM" iso="666" label="Saint Pierre And Miquelon" />
		<country code="VC" iso="670" label="Saint Vincent And The Grenadines" />
		<country code="WS" iso="882" label="Samoa" />
		<country code="SM" iso="674" label="San Marino" />
		<country code="ST" iso="678" label="Sao Tome And Principe" />
		<country code="SA" iso="682" label="Saudi Arabia" />
		<country code="SN" iso="686" label="Senegal" />
		<country code="SC" iso="690" label="Seychelles" />
		<country code="SL" iso="694" label="Sierra Leone" />
		<country code="SG" iso="702" label="Singapore" />
		<country code="SK" iso="703" label="Slovakia (Slovak Republic)" />
		<country code="SI" iso="705" label="Slovenia" />
		<country code="SB" iso="90" label="Solomon Islands" />
		<country code="SO" iso="706" label="Somalia" />
		<country code="ZA" iso="710" label="South Africa" />
		<country code="ES" iso="724" label="Spain" />
		<country code="LK" iso="144" label="Sri Lanka" />
		<country code="SD" iso="736" label="Sudan" />
		<country code="SR" iso="740" label="Suriname" />
		<country code="SJ" iso="744" label="Svalbard And Jan Mayen Islands" />
		<country code="SZ" iso="748" label="Swaziland" />
		<country code="SE" iso="752" label="Sweden" />
		<country code="CH" iso="756" label="Switzerland" />
		<country code="SY" iso="760" label="Syrian Arab Republic" />
		<country code="TW" iso="158" label="Taiwan, Province Of China" />
		<country code="TJ" iso="762" label="Tajikistan" />
		<country code="TZ" iso="834" label="Tanzania, United Republic Of" />
		<country code="TH" iso="764" label="Thailand" />
		<country code="TG" iso="768" label="Togo" />
		<country code="TK" iso="772" label="Tokelau" />
		<country code="TO" iso="776" label="Tonga" />
		<country code="TT" iso="780" label="Trinidad And Tobago" />
		<country code="TN" iso="788" label="Tunisia" />
		<country code="TR" iso="792" label="Turkey" />
		<country code="TM" iso="795" label="Turkmenistan" />
		<country code="TC" iso="796" label="Turks And Caicos Islands" />
		<country code="TV" iso="798" label="Tuvalu" />
		<country code="UG" iso="800" label="Uganda" />
		<country code="UA" iso="804" label="Ukraine" />
		<country code="AE" iso="784" label="United Arab Emirates" />
		<country code="UM" iso="581" label="United States Minor Outlying Islands" />
		<country code="UY" iso="858" label="Uruguay" />
		<country code="UZ" iso="860" label="Uzbekistan" />
		<country code="VU" iso="548" label="Vanuatu" />
		<country code="VA" iso="336" label="Vatican City State (Holy See)" />
		<country code="VE" iso="862" label="Venezuela" />
		<country code="VN" iso="704" label="Viet Nam" />
		<country code="VG" iso="92" label="Virgin Islands (British)" />
		<country code="VI" iso="850" label="Virgin Islands (U.S.)" />
		<country code="WF" iso="876" label="Wallis And Futuna Islands" />
		<country code="EH" iso="732" label="Western Sahara" />
		<country code="YE" iso="887" label="Yemen" />
		<country code="YU" iso="891" label="Yugoslavia" />
		<country code="ZR" iso="180" label="Zaire" />
		<country code="ZM" iso="894" label="Zambia" />
		<country code="ZW" iso="716" label="Zimbabwe" />
	</countries>);
	}
}