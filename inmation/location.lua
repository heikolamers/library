-- inmation.location
-- inmation Script Library Lua Script
--
-- (c) 2017 inmation

locLib = {

	setLocationProperties = function(path, latitude, longitude, locationName)
		local obj = inmation.getobject(path)
		if obj == nil then error("Object with path '" .. path "' not found.") end
		obj.Location.Latitude = latitude
		obj.Location.Longitude = longitude
		obj.Location.LocationName = locationName
		obj.Location.LocationStrategy = "LOC_STRAT_STATIC" 
		obj:commit()
	end,
  
	getRegionAndName = function(regionCode)
		if string.match(regionCode, "AM%-N") then return 36.518466, -102.304688, "America (North)" end
		if string.match(regionCode, "AM%-S") then return -15.040296, -59.765625, "America (South)" end
		if string.match(regionCode, "AP%-N") then return 36.800488, 112.851563, "Asia-Pacific (North)" end
		if string.match(regionCode, "AP%-S") then return -1.504954, 112.500000, "Asia-Pacific (South)" end
		if string.match(regionCode, "EU%-E") then return 51.117317, 28.125000, "Europe (East)" end
		if string.match(regionCode, "EU%-S") then return 44.016521, 11.601563, "Europe (South)" end
		if string.match(regionCode, "EU%-W") then return 51.117317, 9.140625, "Europe (West)" end
		if string.match(regionCode, "ME") then return 27.595935, 28.828125, "Middle-East" end
		error("Unknown region code: " .. regionCode)
	end,
  
	getCoordinatesAndName = function(countryCode)
		if string.match(countryCode, "AD") then return 42.546245, 1.601554, "Andorra" end
		if string.match(countryCode, "AE") then return 23.424076, 53.847818, "United Arab Emirates" end
		if string.match(countryCode, "AF") then return 33.93911, 67.709953, "Afghanistan" end
		if string.match(countryCode, "AG") then return 17.060816, -61.796428, "Antigua and Barbuda" end
		if string.match(countryCode, "AI") then return 18.220554, -63.068615, "Anguilla" end
		if string.match(countryCode, "AL") then return 41.153332, 20.168331, "Albania" end
		if string.match(countryCode, "AM") then return 40.069099, 45.038189, "Armenia" end
		if string.match(countryCode, "AN") then return 12.226079, -69.060087, "Netherlands Antilles" end
		if string.match(countryCode, "AO") then return -11.202692, 17.873887, "Angola" end
		if string.match(countryCode, "AQ") then return -75.250973, -0.071389, "Antarctica" end
		if string.match(countryCode, "AR") then return -38.416097, -63.616672, "Argentina" end
		if string.match(countryCode, "AS") then return -14.270972, -170.132217, "American Samoa" end
		if string.match(countryCode, "AT") then return 47.516231, 14.550072, "Austria" end
		if string.match(countryCode, "AU") then return -25.274398, 133.775136, "Australia" end
		if string.match(countryCode, "AW") then return 12.52111, -69.968338, "Aruba" end
		if string.match(countryCode, "AZ") then return 40.143105, 47.576927, "Azerbaijan" end
		if string.match(countryCode, "BA") then return 43.915886, 17.679076, "Bosnia and Herzegovina" end
		if string.match(countryCode, "BB") then return 13.193887, -59.543198, "Barbados" end
		if string.match(countryCode, "BD") then return 23.684994, 90.356331, "Bangladesh" end
		if string.match(countryCode, "BE") then return 50.503887, 4.469936, "Belgium" end
		if string.match(countryCode, "BF") then return 12.238333, -1.561593, "Burkina Faso" end
		if string.match(countryCode, "BG") then return 42.733883, 25.48583, "Bulgaria" end
		if string.match(countryCode, "BH") then return 25.930414, 50.637772, "Bahrain" end
		if string.match(countryCode, "BI") then return -3.373056, 29.918886, "Burundi" end
		if string.match(countryCode, "BJ") then return 9.30769, 2.315834, "Benin" end
		if string.match(countryCode, "BM") then return 32.321384, -64.75737, "Bermuda" end
		if string.match(countryCode, "BN") then return 4.535277, 114.727669, "Brunei" end
		if string.match(countryCode, "BO") then return -16.290154, -63.588653, "Bolivia" end
		if string.match(countryCode, "BR") then return -14.235004, -51.92528, "Brazil" end
		if string.match(countryCode, "BS") then return 25.03428, -77.39628, "Bahamas" end
		if string.match(countryCode, "BT") then return 27.514162, 90.433601, "Bhutan" end
		if string.match(countryCode, "BV") then return -54.423199, 3.413194, "Bouvet Island" end
		if string.match(countryCode, "BW") then return -22.328474, 24.684866, "Botswana" end
		if string.match(countryCode, "BY") then return 53.709807, 27.953389, "Belarus" end
		if string.match(countryCode, "BZ") then return 17.189877, -88.49765, "Belize" end
		if string.match(countryCode, "CA") then return 56.130366, -106.346771, "Canada" end
		if string.match(countryCode, "CC") then return -12.164165, 96.870956, "Cocos [Keeling] Islands" end
		if string.match(countryCode, "CD") then return -4.038333, 21.758664, "Congo [DRC]" end
		if string.match(countryCode, "CF") then return 6.611111, 20.939444, "Central African Republic" end
		if string.match(countryCode, "CG") then return -0.228021, 15.827659, "Congo [Republic]" end
		if string.match(countryCode, "CH") then return 46.818188, 8.227512, "Switzerland" end
		if string.match(countryCode, "CI") then return 7.539989, -5.54708, "Côte d'Ivoire" end
		if string.match(countryCode, "CK") then return -21.236736, -159.777671, "Cook Islands" end
		if string.match(countryCode, "CL") then return -35.675147, -71.542969, "Chile" end
		if string.match(countryCode, "CM") then return 7.369722, 12.354722, "Cameroon" end
		if string.match(countryCode, "CN") then return 35.86166, 104.195397, "China" end
		if string.match(countryCode, "CO") then return 4.570868, -74.297333, "Colombia" end
		if string.match(countryCode, "CR") then return 9.748917, -83.753428, "Costa Rica" end
		if string.match(countryCode, "CU") then return 21.521757, -77.781167, "Cuba" end
		if string.match(countryCode, "CV") then return 16.002082, -24.013197, "Cape Verde" end
		if string.match(countryCode, "CX") then return -10.447525, 105.690449, "Christmas Island" end
		if string.match(countryCode, "CY") then return 35.126413, 33.429859, "Cyprus" end
		if string.match(countryCode, "CZ") then return 49.817492, 15.472962, "Czech Republic" end
		if string.match(countryCode, "DE") then return 51.165691, 10.451526, "Germany" end
		if string.match(countryCode, "DJ") then return 11.825138, 42.590275, "Djibouti" end
		if string.match(countryCode, "DK") then return 56.26392, 9.501785, "Denmark" end
		if string.match(countryCode, "DM") then return 15.414999, -61.370976, "Dominica" end
		if string.match(countryCode, "DO") then return 18.735693, -70.162651, "Dominican Republic" end
		if string.match(countryCode, "DZ") then return 28.033886, 1.659626, "Algeria" end
		if string.match(countryCode, "EC") then return -1.831239, -78.183406, "Ecuador" end
		if string.match(countryCode, "EE") then return 58.595272, 25.013607, "Estonia" end
		if string.match(countryCode, "EG") then return 26.820553, 30.802498, "Egypt" end
		if string.match(countryCode, "EH") then return 24.215527, -12.885834, "Western Sahara" end
		if string.match(countryCode, "ER") then return 15.179384, 39.782334, "Eritrea" end
		if string.match(countryCode, "ES") then return 40.463667, -3.74922, "Spain" end
		if string.match(countryCode, "ET") then return 9.145, 40.489673, "Ethiopia" end
		if string.match(countryCode, "FI") then return 61.92411, 25.748151, "Finland" end
		if string.match(countryCode, "FJ") then return -16.578193, 179.414413, "Fiji" end
		if string.match(countryCode, "FK") then return -51.796253, -59.523613, "Falkland Islands [Islas Malvinas]" end
		if string.match(countryCode, "FM") then return 7.425554, 150.550812, "Micronesia" end
		if string.match(countryCode, "FO") then return 61.892635, -6.911806, "Faroe Islands" end
		if string.match(countryCode, "FR") then return 46.227638, 2.213749, "France" end
		if string.match(countryCode, "GA") then return -0.803689, 11.609444, "Gabon" end
		if string.match(countryCode, "GB") then return 55.378051, -3.435973, "United Kingdom" end
		if string.match(countryCode, "GD") then return 12.262776, -61.604171, "Grenada" end
		if string.match(countryCode, "GE") then return 42.315407, 43.356892, "Georgia" end
		if string.match(countryCode, "GF") then return 3.933889, -53.125782, "French Guiana" end
		if string.match(countryCode, "GG") then return 49.465691, -2.585278, "Guernsey" end
		if string.match(countryCode, "GH") then return 7.946527, -1.023194, "Ghana" end
		if string.match(countryCode, "GI") then return 36.137741, -5.345374, "Gibraltar" end
		if string.match(countryCode, "GL") then return 71.706936, -42.604303, "Greenland" end
		if string.match(countryCode, "GM") then return 13.443182, -15.310139, "Gambia" end
		if string.match(countryCode, "GN") then return 9.945587, -9.696645, "Guinea" end
		if string.match(countryCode, "GP") then return 16.995971, -62.067641, "Guadeloupe" end
		if string.match(countryCode, "GQ") then return 1.650801, 10.267895, "Equatorial Guinea" end
		if string.match(countryCode, "GR") then return 39.074208, 21.824312, "Greece" end
		if string.match(countryCode, "GS") then return -54.429579, -36.587909, "South Georgia and the South Sandwich Islands" end
		if string.match(countryCode, "GT") then return 15.783471, -90.230759, "Guatemala" end
		if string.match(countryCode, "GU") then return 13.444304, 144.793731, "Guam" end
		if string.match(countryCode, "GW") then return 11.803749, -15.180413, "Guinea-Bissau" end
		if string.match(countryCode, "GY") then return 4.860416, -58.93018, "Guyana" end
		if string.match(countryCode, "GZ") then return 31.354676, 34.308825, "Gaza Strip" end
		if string.match(countryCode, "HK") then return 22.396428, 114.109497, "Hong Kong" end
		if string.match(countryCode, "HM") then return -53.08181, 73.504158, "Heard Island and McDonald Islands" end
		if string.match(countryCode, "HN") then return 15.199999, -86.241905, "Honduras" end
		if string.match(countryCode, "HR") then return 45.1, 15.2, "Croatia" end
		if string.match(countryCode, "HT") then return 18.971187, -72.285215, "Haiti" end
		if string.match(countryCode, "HU") then return 47.162494, 19.503304, "Hungary" end
		if string.match(countryCode, "ID") then return -0.789275, 113.921327, "Indonesia" end
		if string.match(countryCode, "IE") then return 53.41291, -8.24389, "Ireland" end
		if string.match(countryCode, "IL") then return 31.046051, 34.851612, "Israel" end
		if string.match(countryCode, "IM") then return 54.236107, -4.548056, "Isle of Man" end
		if string.match(countryCode, "IN") then return 20.593684, 78.96288, "India" end
		if string.match(countryCode, "IO") then return -6.343194, 71.876519, "British Indian Ocean Territory" end
		if string.match(countryCode, "IQ") then return 33.223191, 43.679291, "Iraq" end
		if string.match(countryCode, "IR") then return 32.427908, 53.688046, "Iran" end
		if string.match(countryCode, "IS") then return 64.963051, -19.020835, "Iceland" end
		if string.match(countryCode, "IT") then return 41.87194, 12.56738, "Italy" end
		if string.match(countryCode, "JE") then return 49.214439, -2.13125, "Jersey" end
		if string.match(countryCode, "JM") then return 18.109581, -77.297508, "Jamaica" end
		if string.match(countryCode, "JO") then return 30.585164, 36.238414, "Jordan" end
		if string.match(countryCode, "JP") then return 36.204824, 138.252924, "Japan" end
		if string.match(countryCode, "KE") then return -0.023559, 37.906193, "Kenya" end
		if string.match(countryCode, "KG") then return 41.20438, 74.766098, "Kyrgyzstan" end
		if string.match(countryCode, "KH") then return 12.565679, 104.990963, "Cambodia" end
		if string.match(countryCode, "KI") then return -3.370417, -168.734039, "Kiribati" end
		if string.match(countryCode, "KM") then return -11.875001, 43.872219, "Comoros" end
		if string.match(countryCode, "KN") then return 17.357822, -62.782998, "Saint Kitts and Nevis" end
		if string.match(countryCode, "KP") then return 40.339852, 127.510093, "North Korea" end
		if string.match(countryCode, "KR") then return 35.907757, 127.766922, "South Korea" end
		if string.match(countryCode, "KW") then return 29.31166, 47.481766, "Kuwait" end
		if string.match(countryCode, "KY") then return 19.513469, -80.566956, "Cayman Islands" end
		if string.match(countryCode, "KZ") then return 48.019573, 66.923684, "Kazakhstan" end
		if string.match(countryCode, "LA") then return 19.85627, 102.495496, "Laos" end
		if string.match(countryCode, "LB") then return 33.854721, 35.862285, "Lebanon" end
		if string.match(countryCode, "LC") then return 13.909444, -60.978893, "Saint Lucia" end
		if string.match(countryCode, "LI") then return 47.166, 9.555373, "Liechtenstein" end
		if string.match(countryCode, "LK") then return 7.873054, 80.771797, "Sri Lanka" end
		if string.match(countryCode, "LR") then return 6.428055, -9.429499, "Liberia" end
		if string.match(countryCode, "LS") then return -29.609988, 28.233608, "Lesotho" end
		if string.match(countryCode, "LT") then return 55.169438, 23.881275, "Lithuania" end
		if string.match(countryCode, "LU") then return 49.815273, 6.129583, "Luxembourg" end
		if string.match(countryCode, "LV") then return 56.879635, 24.603189, "Latvia" end
		if string.match(countryCode, "LY") then return 26.3351, 17.228331, "Libya" end
		if string.match(countryCode, "MA") then return 31.791702, -7.09262, "Morocco" end
		if string.match(countryCode, "MC") then return 43.750298, 7.412841, "Monaco" end
		if string.match(countryCode, "MD") then return 47.411631, 28.369885, "Moldova" end
		if string.match(countryCode, "ME") then return 42.708678, 19.37439, "Montenegro" end
		if string.match(countryCode, "MG") then return -18.766947, 46.869107, "Madagascar" end
		if string.match(countryCode, "MH") then return 7.131474, 171.184478, "Marshall Islands" end
		if string.match(countryCode, "MK") then return 41.608635, 21.745275, "Macedonia [FYROM]" end
		if string.match(countryCode, "ML") then return 17.570692, -3.996166, "Mali" end
		if string.match(countryCode, "MM") then return 21.913965, 95.956223, "Myanmar [Burma]" end
		if string.match(countryCode, "MN") then return 46.862496, 103.846656, "Mongolia" end
		if string.match(countryCode, "MO") then return 22.198745, 113.543873, "Macau" end
		if string.match(countryCode, "MP") then return 17.33083, 145.38469, "Northern Mariana Islands" end
		if string.match(countryCode, "MQ") then return 14.641528, -61.024174, "Martinique" end
		if string.match(countryCode, "MR") then return 21.00789, -10.940835, "Mauritania" end
		if string.match(countryCode, "MS") then return 16.742498, -62.187366, "Montserrat" end
		if string.match(countryCode, "MT") then return 35.937496, 14.375416, "Malta" end
		if string.match(countryCode, "MU") then return -20.348404, 57.552152, "Mauritius" end
		if string.match(countryCode, "MV") then return 3.202778, 73.22068, "Maldives" end
		if string.match(countryCode, "MW") then return -13.254308, 34.301525, "Malawi" end
		if string.match(countryCode, "MX") then return 23.634501, -102.552784, "Mexico" end
		if string.match(countryCode, "MY") then return 4.210484, 101.975766, "Malaysia" end
		if string.match(countryCode, "MZ") then return -18.665695, 35.529562, "Mozambique" end
		if string.match(countryCode, "NA") then return -22.95764, 18.49041, "Namibia" end
		if string.match(countryCode, "NC") then return -20.904305, 165.618042, "New Caledonia" end
		if string.match(countryCode, "NE") then return 17.607789, 8.081666, "Niger" end
		if string.match(countryCode, "NF") then return -29.040835, 167.954712, "Norfolk Island" end
		if string.match(countryCode, "NG") then return 9.081999, 8.675277, "Nigeria" end
		if string.match(countryCode, "NI") then return 12.865416, -85.207229, "Nicaragua" end
		if string.match(countryCode, "NL") then return 52.132633, 5.291266, "Netherlands" end
		if string.match(countryCode, "NO") then return 60.472024, 8.468946, "Norway" end
		if string.match(countryCode, "NP") then return 28.394857, 84.124008, "Nepal" end
		if string.match(countryCode, "NR") then return -0.522778, 166.931503, "Nauru" end
		if string.match(countryCode, "NU") then return -19.054445, -169.867233, "Niue" end
		if string.match(countryCode, "NZ") then return -40.900557, 174.885971, "New Zealand" end
		if string.match(countryCode, "OM") then return 21.512583, 55.923255, "Oman" end
		if string.match(countryCode, "PA") then return 8.537981, -80.782127, "Panama" end
		if string.match(countryCode, "PE") then return -9.189967, -75.015152, "Peru" end
		if string.match(countryCode, "PF") then return -17.679742, -149.406843, "French Polynesia" end
		if string.match(countryCode, "PG") then return -6.314993, 143.95555, "Papua New Guinea" end
		if string.match(countryCode, "PH") then return 12.879721, 121.774017, "Philippines" end
		if string.match(countryCode, "PK") then return 30.375321, 69.345116, "Pakistan" end
		if string.match(countryCode, "PL") then return 51.919438, 19.145136, "Poland" end
		if string.match(countryCode, "PM") then return 46.941936, -56.27111, "Saint Pierre and Miquelon" end
		if string.match(countryCode, "PN") then return -24.703615, -127.439308, "Pitcairn Islands" end
		if string.match(countryCode, "PR") then return 18.220833, -66.590149, "Puerto Rico" end
		if string.match(countryCode, "PS") then return 31.952162, 35.233154, "Palestinian Territories" end
		if string.match(countryCode, "PT") then return 39.399872, -8.224454, "Portugal" end
		if string.match(countryCode, "PW") then return 7.51498, 134.58252, "Palau" end
		if string.match(countryCode, "PY") then return -23.442503, -58.443832, "Paraguay" end
		if string.match(countryCode, "QA") then return 25.354826, 51.183884, "Qatar" end
		if string.match(countryCode, "RE") then return -21.115141, 55.536384, "Réunion" end
		if string.match(countryCode, "RO") then return 45.943161, 24.96676, "Romania" end
		if string.match(countryCode, "RS") then return 44.016521, 21.005859, "Serbia" end
		if string.match(countryCode, "RU") then return 61.52401, 105.318756, "Russia" end
		if string.match(countryCode, "RW") then return -1.940278, 29.873888, "Rwanda" end
		if string.match(countryCode, "SA") then return 23.885942, 45.079162, "Saudi Arabia" end
		if string.match(countryCode, "SB") then return -9.64571, 160.156194, "Solomon Islands" end
		if string.match(countryCode, "SC") then return -4.679574, 55.491977, "Seychelles" end
		if string.match(countryCode, "SD") then return 12.862807, 30.217636, "Sudan" end
		if string.match(countryCode, "SE") then return 60.128161, 18.643501, "Sweden" end
		if string.match(countryCode, "SG") then return 1.352083, 103.819836, "Singapore" end
		if string.match(countryCode, "SH") then return -24.143474, -10.030696, "Saint Helena" end
		if string.match(countryCode, "SI") then return 46.151241, 14.995463, "Slovenia" end
		if string.match(countryCode, "SJ") then return 77.553604, 23.670272, "Svalbard and Jan Mayen" end
		if string.match(countryCode, "SK") then return 48.669026, 19.699024, "Slovakia" end
		if string.match(countryCode, "SL") then return 8.460555, -11.779889, "Sierra Leone" end
		if string.match(countryCode, "SM") then return 43.94236, 12.457777, "San Marino" end
		if string.match(countryCode, "SN") then return 14.497401, -14.452362, "Senegal" end
		if string.match(countryCode, "SO") then return 5.152149, 46.199616, "Somalia" end
		if string.match(countryCode, "SR") then return 3.919305, -56.027783, "Suriname" end
		if string.match(countryCode, "ST") then return 0.18636, 6.613081, "São Tomé and Príncipe" end
		if string.match(countryCode, "SV") then return 13.794185, -88.89653, "El Salvador" end
		if string.match(countryCode, "SY") then return 34.802075, 38.996815, "Syria" end
		if string.match(countryCode, "SZ") then return -26.522503, 31.465866, "Swaziland" end
		if string.match(countryCode, "TC") then return 21.694025, -71.797928, "Turks and Caicos Islands" end
		if string.match(countryCode, "TD") then return 15.454166, 18.732207, "Chad" end
		if string.match(countryCode, "TF") then return -49.280366, 69.348557, "French Southern Territories" end
		if string.match(countryCode, "TG") then return 8.619543, 0.824782, "Togo" end
		if string.match(countryCode, "TH") then return 15.870032, 100.992541, "Thailand" end
		if string.match(countryCode, "TJ") then return 38.861034, 71.276093, "Tajikistan" end
		if string.match(countryCode, "TK") then return -8.967363, -171.855881, "Tokelau" end
		if string.match(countryCode, "TL") then return -8.874217, 125.727539, "Timor-Leste" end
		if string.match(countryCode, "TM") then return 38.969719, 59.556278, "Turkmenistan" end
		if string.match(countryCode, "TN") then return 33.886917, 9.537499, "Tunisia" end
		if string.match(countryCode, "TO") then return -21.178986, -175.198242, "Tonga" end
		if string.match(countryCode, "TR") then return 38.963745, 35.243322, "Turkey" end
		if string.match(countryCode, "TT") then return 10.691803, -61.222503, "Trinidad and Tobago" end
		if string.match(countryCode, "TV") then return -7.109535, 177.64933, "Tuvalu" end
		if string.match(countryCode, "TW") then return 23.69781, 120.960515, "Taiwan" end
		if string.match(countryCode, "TZ") then return -6.369028, 34.888822, "Tanzania" end
		if string.match(countryCode, "UA") then return 48.379433, 31.16558, "Ukraine" end
		if string.match(countryCode, "UG") then return 1.373333, 32.290275, "Uganda" end
		if string.match(countryCode, "US") then return 37.09024, -95.712891, "United States" end
		if string.match(countryCode, "UY") then return -32.522779, -55.765835, "Uruguay" end
		if string.match(countryCode, "UZ") then return 41.377491, 64.585262, "Uzbekistan" end
		if string.match(countryCode, "VA") then return 41.902916, 12.453389, "Vatican City" end
		if string.match(countryCode, "VC") then return 12.984305, -61.287228, "Saint Vincent and the Grenadines" end
		if string.match(countryCode, "VE") then return 6.42375, -66.58973, "Venezuela" end
		if string.match(countryCode, "VG") then return 18.420695, -64.639968, "British Virgin Islands" end
		if string.match(countryCode, "VI") then return 18.335765, -64.896335, "U.S. Virgin Islands" end
		if string.match(countryCode, "VN") then return 14.058324, 108.277199, "Vietnam" end
		if string.match(countryCode, "VU") then return -15.376706, 166.959158, "Vanuatu" end
		if string.match(countryCode, "WF") then return -13.768752, -177.156097, "Wallis and Futuna" end
		if string.match(countryCode, "WS") then return -13.759029, -172.104629, "Samoa" end
		if string.match(countryCode, "XK") then return 42.602636, 20.902977, "Kosovo" end
		if string.match(countryCode, "YE") then return 15.552727, 48.516388, "Yemen" end
		if string.match(countryCode, "YT") then return -12.8275, 45.166244, "Mayotte" end
		if string.match(countryCode, "ZA") then return -30.559482, 22.937506, "South Africa" end
		if string.match(countryCode, "ZM") then return -13.133897, 27.849332, "Zambia" end
		if string.match(countryCode, "ZW") then return -19.015438, 29.154857, "Zimbabwe" end
		error("Unknown country code: " .. countryCode)
	end

}

return locLib
