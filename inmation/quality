-- inmation.quality
-- inmation Script Library Lua Script
--
-- (c) 2017 inmation

qualityLib = {

	isDa = function (qualityNumeric)

		if (qualityNumeric >> 16 == 65535) then
			return true
		else
			return false
		end

	end,

	getText = function (qualityNumeric)

		if qualityLib.isDa(qualityNumeric) then
			return qualityLib.getTextDa(qualityNumeric)
		else
			return qualityLib.getTextUa(qualityNumeric)
		end

	end,

	getTextDa = function (qualityNumeric)

		-- Input: 64bit
		-- FFFF FFFF
		-- For DA, we set the first 32bit to FFFF. Those are only used for UA Quality
		-- The last 16 bit are interesting for DA.
		-- QQSSSSLL

		-- mask away the first 2 bytes (this is UA quality)
		local masked = qualityNumeric & 65535

		-- strip limit bits (LL)
		local mainQuality = masked >> 2
		mainQuality = mainQuality << 2

		-- detect main quality/subquality
		local mainText
		if (mainQuality == 192) then mainText = "Good" end
		if (mainQuality == 216) then mainText = "GoodLocalOverride" end
		if (mainQuality == 0) then mainText = "Bad" end
		if (mainQuality == 4) then mainText = "BadConfigurationError" end
		if (mainQuality == 8) then mainText = "BadNotConnected" end
		if (mainQuality == 12) then mainText = "BadDeviceFailure" end
		if (mainQuality == 16) then mainText = "BadSensorFailure" end
		if (mainQuality == 20) then mainText = "BadLastKnownValue" end
		if (mainQuality == 24) then mainText = "BadCommFailure" end
		if (mainQuality == 28) then mainText = "BadOutOfService" end
		if (mainQuality == 32) then mainText = "BadWaitingForInitialData" end
		if (mainQuality == 64) then mainText = "Uncertain" end
		if (mainQuality == 68) then mainText = "UncertainLastUsableValue" end
		if (mainQuality == 80) then mainText = "UncertainSensorNotAccurate" end
		if (mainQuality == 84) then mainText = "UncertainEUExceeded" end
		if (mainQuality == 88) then mainText = "UncertainSubNormal" end

		-- if not known, set unknown
		if (mainText == nil) then
			mainText = mainQuality
		end

		-- limits handling
		local limits = qualityNumeric & 3
		if (limits == 1) then
			mainText = mainText .. " (Low)"
		elseif (limits == 2) then
			mainText = mainText .. " (High)"
		elseif (limits == 3) then
			mainText = mainText .. " (Constant)"
		end

		return mainText

	end,

	getTextUa = function (qualityNumeric)

		local masked = qualityNumeric >> 16

		-- List of known UA status codes, from UA specification
		if (masked == 32769) then return "BadUnexpectedError " end
		if (masked == 32770) then return "BadInternalError " end
		if (masked == 32771) then return "BadOutOfMemory " end
		if (masked == 32772) then return "BadResourceUnavailable " end
		if (masked == 32773) then return "BadCommunicationError " end
		if (masked == 32774) then return "BadEncodingError " end
		if (masked == 32775) then return "BadDecodingError " end
		if (masked == 32776) then return "BadEncodingLimitsExceeded " end
		if (masked == 32952) then return "BadRequestTooLarge " end
		if (masked == 32953) then return "BadResponseTooLarge " end
		if (masked == 32777) then return "BadUnknownResponse " end
		if (masked == 32778) then return "BadTimeout " end
		if (masked == 32779) then return "BadServiceUnsupported " end
		if (masked == 32780) then return "BadShutdown " end
		if (masked == 32781) then return "BadServerNotConnected " end
		if (masked == 32782) then return "BadServerHalted " end
		if (masked == 32783) then return "BadNothingToDo " end
		if (masked == 32784) then return "BadTooManyOperations " end
		if (masked == 32987) then return "BadTooManyMonitoredItems " end
		if (masked == 32785) then return "BadDataTypeIdUnknown " end
		if (masked == 32786) then return "BadCertificateInvalid " end
		if (masked == 32787) then return "BadSecurityChecksFailed " end
		if (masked == 32788) then return "BadCertificateTimeInvalid " end
		if (masked == 32789) then return "BadCertificateIssuerTimeInvalid " end
		if (masked == 32790) then return "BadCertificateHostNameInvalid " end
		if (masked == 32791) then return "BadCertificateUriInvalid " end
		if (masked == 32792) then return "BadCertificateUseNotAllowed " end
		if (masked == 32793) then return "BadCertificateIssuerUseNotAllowed " end
		if (masked == 32794) then return "BadCertificateUntrusted " end
		if (masked == 32795) then return "BadCertificateRevocationUnknown " end
		if (masked == 32796) then return "BadCertificateIssuerRevocationUnknown " end
		if (masked == 32797) then return "BadCertificateRevoked " end
		if (masked == 32798) then return "BadCertificateIssuerRevoked " end
		if (masked == 32799) then return "BadUserAccessDenied " end
		if (masked == 32800) then return "BadIdentityTokenInvalid " end
		if (masked == 32801) then return "BadIdentityTokenRejected " end
		if (masked == 32802) then return "BadSecureChannelIdInvalid " end
		if (masked == 32803) then return "BadInvalidTimestamp " end
		if (masked == 32804) then return "BadNonceInvalid " end
		if (masked == 32805) then return "BadSessionIdInvalid " end
		if (masked == 32806) then return "BadSessionClosed " end
		if (masked == 32807) then return "BadSessionNotActivated " end
		if (masked == 32808) then return "BadSubscriptionIdInvalid " end
		if (masked == 32810) then return "BadRequestHeaderInvalid " end
		if (masked == 32811) then return "BadTimestampsToReturnInvalid " end
		if (masked == 32812) then return "BadRequestCancelledByClient " end
		if (masked == 45) then return "GoodSubscriptionTransferred " end
		if (masked == 46) then return "GoodCompletesAsynchronously " end
		if (masked == 47) then return "GoodOverload " end
		if (masked == 48) then return "GoodClamped " end
		if (masked == 32817) then return "BadNoCommunication " end
		if (masked == 32818) then return "BadWaitingForInitialData " end
		if (masked == 32819) then return "BadNodeIdInvalid " end
		if (masked == 32820) then return "BadNodeIdUnknown " end
		if (masked == 32821) then return "BadAttributeIdInvalid " end
		if (masked == 32822) then return "BadIndexRangeInvalid " end
		if (masked == 32823) then return "BadIndexRangeNoData " end
		if (masked == 32824) then return "BadDataEncodingInvalid " end
		if (masked == 32825) then return "BadDataEncodingUnsupported " end
		if (masked == 32826) then return "BadNotReadable " end
		if (masked == 32827) then return "BadNotWritable " end
		if (masked == 32828) then return "BadOutOfRange " end
		if (masked == 32829) then return "BadNotSupported " end
		if (masked == 32830) then return "BadNotFound " end
		if (masked == 32831) then return "BadObjectDeleted " end
		if (masked == 32832) then return "BadNotImplemented " end
		if (masked == 32833) then return "BadMonitoringModeInvalid " end
		if (masked == 32834) then return "BadMonitoredItemIdInvalid " end
		if (masked == 32835) then return "BadMonitoredItemFilterInvalid " end
		if (masked == 32836) then return "BadMonitoredItemFilterUnsupported " end
		if (masked == 32837) then return "BadFilterNotAllowed " end
		if (masked == 32838) then return "BadStructureMissing " end
		if (masked == 32839) then return "BadEventFilterInvalid " end
		if (masked == 32840) then return "BadContentFilterInvalid " end
		if (masked == 32961) then return "BadFilterOperatorInvalid " end
		if (masked == 32962) then return "BadFilterOperatorUnsupported " end
		if (masked == 32963) then return "BadFilterOperandCountMismatch " end
		if (masked == 32841) then return "BadFilterOperandInvalid " end
		if (masked == 32964) then return "BadFilterElementInvalid " end
		if (masked == 32965) then return "BadFilterLiteralInvalid " end
		if (masked == 32842) then return "BadContinuationPointInvalid " end
		if (masked == 32843) then return "BadNoContinuationPoints " end
		if (masked == 32844) then return "BadReferenceTypeIdInvalid " end
		if (masked == 32845) then return "BadBrowseDirectionInvalid " end
		if (masked == 32846) then return "BadNodeNotInView " end
		if (masked == 32847) then return "BadServerUriInvalid " end
		if (masked == 32848) then return "BadServerNameMissing " end
		if (masked == 32849) then return "BadDiscoveryUrlMissing " end
		if (masked == 32850) then return "BadSempahoreFileMissing " end
		if (masked == 32851) then return "BadRequestTypeInvalid " end
		if (masked == 32852) then return "BadSecurityModeRejected " end
		if (masked == 32853) then return "BadSecurityPolicyRejected " end
		if (masked == 32854) then return "BadTooManySessions " end
		if (masked == 32855) then return "BadUserSignatureInvalid " end
		if (masked == 32856) then return "BadApplicationSignatureInvalid " end
		if (masked == 32857) then return "BadNoValidCertificates " end
		if (masked == 32966) then return "BadIdentityChangeNotSupported " end
		if (masked == 32858) then return "BadRequestCancelledByRequest " end
		if (masked == 32859) then return "BadParentNodeIdInvalid " end
		if (masked == 32860) then return "BadReferenceNotAllowed " end
		if (masked == 32861) then return "BadNodeIdRejected " end
		if (masked == 32862) then return "BadNodeIdExists " end
		if (masked == 32863) then return "BadNodeClassInvalid " end
		if (masked == 32864) then return "BadBrowseNameInvalid " end
		if (masked == 32865) then return "BadBrowseNameDuplicated " end
		if (masked == 32866) then return "BadNodeAttributesInvalid " end
		if (masked == 32867) then return "BadTypeDefinitionInvalid " end
		if (masked == 32868) then return "BadSourceNodeIdInvalid " end
		if (masked == 32869) then return "BadTargetNodeIdInvalid " end
		if (masked == 32870) then return "BadDuplicateReferenceNotAllowed " end
		if (masked == 32871) then return "BadInvalidSelfReference " end
		if (masked == 32872) then return "BadReferenceLocalOnly " end
		if (masked == 32873) then return "BadNoDeleteRights " end
		if (masked == 16572) then return "UncertainReferenceNotDeleted " end
		if (masked == 32874) then return "BadServerIndexInvalid " end
		if (masked == 32875) then return "BadViewIdUnknown " end
		if (masked == 32969) then return "BadViewTimestampInvalid " end
		if (masked == 32970) then return "BadViewParameterMismatch " end
		if (masked == 32971) then return "BadViewVersionInvalid " end
		if (masked == 16576) then return "UncertainNotAllNodesAvailable " end
		if (masked == 186) then return "GoodResultsMayBeIncomplete " end
		if (masked == 32968) then return "BadNotTypeDefinition " end
		if (masked == 16492) then return "UncertainReferenceOutOfServer " end
		if (masked == 32877) then return "BadTooManyMatches " end
		if (masked == 32878) then return "BadQueryTooComplex " end
		if (masked == 32879) then return "BadNoMatch " end
		if (masked == 32880) then return "BadMaxAgeInvalid " end
		if (masked == 32881) then return "BadHistoryOperationInvalid " end
		if (masked == 32882) then return "BadHistoryOperationUnsupported " end
		if (masked == 32957) then return "BadInvalidTimestampArgument " end
		if (masked == 32883) then return "BadWriteNotSupported " end
		if (masked == 32884) then return "BadTypeMismatch " end
		if (masked == 32885) then return "BadMethodInvalid " end
		if (masked == 32886) then return "BadArgumentsMissing " end
		if (masked == 32887) then return "BadTooManySubscriptions " end
		if (masked == 32888) then return "BadTooManyPublishRequests " end
		if (masked == 32889) then return "BadNoSubscription " end
		if (masked == 32890) then return "BadSequenceNumberUnknown " end
		if (masked == 32891) then return "BadMessageNotAvailable " end
		if (masked == 32892) then return "BadInsufficientClientProfile " end
		if (masked == 32959) then return "BadStateNotActive " end
		if (masked == 32893) then return "BadTcpServerTooBusy " end
		if (masked == 32894) then return "BadTcpMessageTypeInvalid " end
		if (masked == 32895) then return "BadTcpSecureChannelUnknown " end
		if (masked == 32896) then return "BadTcpMessageTooLarge " end
		if (masked == 32897) then return "BadTcpNotEnoughResources " end
		if (masked == 32898) then return "BadTcpInternalError " end
		if (masked == 32899) then return "BadTcpEndpointUrlInvalid " end
		if (masked == 32900) then return "BadRequestInterrupted " end
		if (masked == 32901) then return "BadRequestTimeout " end
		if (masked == 32902) then return "BadSecureChannelClosed " end
		if (masked == 32903) then return "BadSecureChannelTokenUnknown " end
		if (masked == 32904) then return "BadSequenceNumberInvalid " end
		if (masked == 32958) then return "BadProtocolVersionUnsupported " end
		if (masked == 32905) then return "BadConfigurationError " end
		if (masked == 32906) then return "BadNotConnected " end
		if (masked == 32907) then return "BadDeviceFailure " end
		if (masked == 32908) then return "BadSensorFailure " end
		if (masked == 32909) then return "BadOutOfService " end
		if (masked == 32910) then return "BadDeadbandFilterInvalid " end
		if (masked == 16527) then return "UncertainNoCommunicationLastUsableValue " end
		if (masked == 16528) then return "UncertainLastUsableValue " end
		if (masked == 16529) then return "UncertainSubstituteValue " end
		if (masked == 16530) then return "UncertainInitialValue " end
		if (masked == 16531) then return "UncertainSensorNotAccurate " end
		if (masked == 16532) then return "UncertainEngineeringUnitsExceeded " end
		if (masked == 16533) then return "UncertainSubNormal " end
		if (masked == 150) then return "GoodLocalOverride " end
		if (masked == 32919) then return "BadRefreshInProgress " end
		if (masked == 32920) then return "BadConditionAlreadyDisabled " end
		if (masked == 32972) then return "BadConditionAlreadyEnabled " end
		if (masked == 32921) then return "BadConditionDisabled " end
		if (masked == 32922) then return "BadEventIdUnknown " end
		if (masked == 32955) then return "BadEventNotAcknowledgeable " end
		if (masked == 32973) then return "BadDialogNotActive " end
		if (masked == 32974) then return "BadDialogResponseInvalid " end
		if (masked == 32975) then return "BadConditionBranchAlreadyAcked " end
		if (masked == 32976) then return "BadConditionBranchAlreadyConfirmed " end
		if (masked == 32977) then return "BadConditionAlreadyShelved " end
		if (masked == 32978) then return "BadConditionNotShelved " end
		if (masked == 32979) then return "BadShelvingTimeOutOfRange " end
		if (masked == 32923) then return "BadNoData " end
		if (masked == 32983) then return "BadBoundNotFound " end
		if (masked == 32984) then return "BadBoundNotSupported " end
		if (masked == 32925) then return "BadDataLost " end
		if (masked == 32926) then return "BadDataUnavailable " end
		if (masked == 32927) then return "BadEntryExists " end
		if (masked == 32928) then return "BadNoEntryExists " end
		if (masked == 32929) then return "BadTimestampNotSupported " end
		if (masked == 162) then return "GoodEntryInserted " end
		if (masked == 163) then return "GoodEntryReplaced " end
		if (masked == 16548) then return "UncertainDataSubNormal " end
		if (masked == 165) then return "GoodNoData " end
		if (masked == 166) then return "GoodMoreData " end
		if (masked == 32980) then return "BadAggregateListMismatch " end
		if (masked == 32981) then return "BadAggregateNotSupported " end
		if (masked == 32982) then return "BadAggregateInvalidInputs " end
		if (masked == 32986) then return "BadAggregateConfigurationRejected " end
		if (masked == 217) then return "GoodDataIgnored " end
		if (masked == 167) then return "GoodCommunicationEvent " end
		if (masked == 168) then return "GoodShutdownEvent " end
		if (masked == 169) then return "GoodCallAgain " end
		if (masked == 170) then return "GoodNonCriticalTimeout " end
		if (masked == 32939) then return "BadInvalidArgument " end
		if (masked == 32940) then return "BadConnectionRejected " end
		if (masked == 32941) then return "BadDisconnect " end
		if (masked == 32942) then return "BadConnectionClosed " end
		if (masked == 32943) then return "BadInvalidState " end
		if (masked == 32944) then return "BadEndOfStream " end
		if (masked == 32945) then return "BadNoDataAvailable " end
		if (masked == 32946) then return "BadWaitingForResponse " end
		if (masked == 32947) then return "BadOperationAbandoned " end
		if (masked == 32948) then return "BadExpectedStreamToBlock " end
		if (masked == 32949) then return "BadWouldBlock " end
		if (masked == 32950) then return "BadSyntaxError " end
		if (masked == 32951) then return "BadMaxConnectionsReached " end

		return masked

	end

}

return qualityLib
