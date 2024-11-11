//
//  PNRContent.swift
//  UnitedReservationViewer
//
//  Created by Jayen Agrawal on 11/10/24.
//

import Foundation

public struct UnitedReservationContent: Codable {
    var shareReservationInfo: String?
    var showJoinOneClickEnrollment: Bool?
    var deviceId: String?
    var specialNeeds: String?
    var sessionId: String?
    var flow: String?
    var rewardPrograms: String?
    var recordLocator: String?
    var lastName: String?
    var uaRecordLocator: String?
    var pnr: PNRContent?
    var dotBagRules: String?
    var dotBaggageInformation: String?
    var countDownWidgetInfo: CountDownWidgetInfo?
    var showSeatChange: Bool?
    var showPremierAccess: Bool?
    var showAddCalendar: Bool?
    var showBaggageInfo: Bool?
    var premierAccess: String?
    var tripInsuranceInfo: String?
    var ancillary: String?
    var travelOptions: String?
    var sustainableAviationFuel: String?
    var petEligibility: String?
    var captions: [Caption]?
    var transactionId: String?
    var languageCode: String?
    var machineName: String
    var callDuration: Int?
    var exception: String?
    
    private enum CodingKeys: String, CodingKey {
        case recordLocator, lastName, pnr, languageCode, machineName, callDuration
    }
}

struct PNRContent: Codable {
    var hasJSXSegment: Bool?
    var jsxAlertMessageForChangeSeat: String?
    var invokeTRCEligiblity: Bool?
    var isMilesAndMoney: Bool?
    var isATREEligible: Bool?
    var isChangeEligible: Bool?
    var isTicketedByUA: Bool?
    var isSCChangeEligible: Bool?
    var isDOTSCChangeOptimizely: Bool?
    var isSCRefundEligible: Bool?
    var isSCBulkGroupPWC: Bool?
    var scheduleChangeInfo: String?
    var irropsChangeInfo: String?
    var advisoryInfo: [Advisory]?
    var consolidateScheduleChangeMessage: Bool?
    var isCorporateBooking: Bool?
    var corporateVendorName: String?
    var isPolicyExceptionAlert: Bool
    var isBEChangeEligible: Bool?
    var isCheckinEligible: Bool?
    var isAgencyBooking: Bool?
    var agencyName: String?
    var shouldDisplayUpgradeCabin: Bool?
    var earnedMilesInfo: [EarnedMilesInfo]?
    var shuttleOfferInformation: Bool?
    var futureflightcredit: String?
    var umnr: String?
    var infantInLaps: [String]?
    var mealAccommodationAdvisory: String?
    var mealAccommodationAdvisoryHeader: String?
    var isUnaccompaniedMinor: Bool?
    var isETicketed: Bool?
    var inCabinPetInfo: String?
    var isPetAvailable: Bool?
    var shouldDisplayEmailReceipt: Bool?
    var isCanceledWithFutureFlightCredit: Bool?
    var showOverride24HrFlex: Bool?
    var showOverrideATREEligible: Bool?
    var isInflightMealsOfferEligible: Bool?
    var isEnableEditTraveler: Bool?
    var isShuttleOfferEligible: Bool?
    var journeyType: String?
    var elfLimitations: String?
    var isELF: Bool?
    var lmxtravelers: String?
    var sessionId: String?
    var recordLocator: String?
    var uaRecordLocator: String?
    var coRecordLocator: String?
    var pnrOwner: String?
    var oaRecordLocators: [String]?
    var oaRecordLocatorMessageTitle: String?
    var oaRecordLocatorMessage: String?
    var dateCreated: String?
    var description: String?
    var isActive: Bool?
    var ticketType: String?
    var numberOfPassengers: String?
    var trips: [Trip]
    var passengers: [Passenger]
    var segments: [Segment]
    var checkinEligible: String?
    var lastTripDateDepartureDate: String?
    var lastTripDateArrivalDate: String?
    var alreadyCheckedin: String?
    var notValid: String?
    var validforCheckin: String?
    var pnrCanceled: String?
    var seatOffer: String?
    var isEligibleToSeatChange: Bool?
    var petRecordLocators: [String?]?
    var emailAddress: String?
    var upgradeMessage: String?
    var bundleInfo: String?
    var farelockExpirationDate: String?
    var farelockPurchaseMessage: String?
    var earnedMilesHeader: String?
    var earnedMilesText: String?
    var ineligibleToEarnCreditMessage: String?
    var oaIneligibleToEarnCreditMessage: String?
    var awardTravel: Bool?
    var psSaTravel: Bool?
    var supressLMX: Bool?
    var overMileageLimitMessage: String?
    var overMileageLimitAmount: String?
    var syncedWithConcur: String?
    var tripType: String?
    var isTPIIncluded: Bool?
    var isFareLockOrNRSA: Bool?
    var hasCheckedBags: Bool?
    var urlItems: [String?]?
    var editTravelerInfo: String?
    var encryptPNR: String?
    var encryptLastName: String?
    var isgroup: Bool?
    var isBulk: Bool?
    var isIBELite: Bool?
    var isIBE: Bool?
    var isCBE: Bool?
    var hasScheduleChanged: Bool?
    var statusMessageItems: String?
    var productCode: String?
    var productCategory: String?
    var marketType: String?
    var checkInStatus: String?
    var getCheckInStatusFromCSLPNRRetrivalService: Bool?
    var irrOps: Bool?
    var irrOpsViewed: Bool?
    var fareLockMessage: String?
    var fareLockPurchaseButton: String?
    var fareLockPriceButton: String?
    var associateMPId: String?
    var associateMPIdSharesPosition: String?
    var associateMPIdSharesGivenName: String?
    var associateMPIdMessage: String?
    var prices: String?
    var oneClickEnrollmentEligibility: OneClickEnrollmentEligibility?
    var isJSENonChangeableFare: Bool
    var is24HrFlexibleBookingPolicy: Bool
    var travelerInfo: String?
    var isLinkYourTrip: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case isMilesAndMoney, isChangeEligible, isTicketedByUA, isSCChangeEligible, isSCRefundEligible, isPolicyExceptionAlert, isCheckinEligible, isUnaccompaniedMinor, isETicketed, isCanceledWithFutureFlightCredit, showOverride24HrFlex, isInflightMealsOfferEligible, sessionId, recordLocator, dateCreated, isActive, numberOfPassengers, trips, passengers, segments, checkinEligible, lastTripDateDepartureDate, lastTripDateArrivalDate, alreadyCheckedin, notValid, validforCheckin, pnrCanceled, emailAddress, earnedMilesHeader, earnedMilesText, ineligibleToEarnCreditMessage, oaIneligibleToEarnCreditMessage, awardTravel, overMileageLimitMessage, overMileageLimitAmount, tripType, isgroup, isBulk, productCode, productCategory, marketType, checkInStatus, irrOps, irrOpsViewed, isJSENonChangeableFare, is24HrFlexibleBookingPolicy
    }
}

struct Advisory: Codable {
    var advisoryType: String?
    var displayType: String?
    var contentType: String?
    var header: String?
    var subTitle: String?
    var body: String?
    var footer: String?
    var buttontext: String?
    var buttonlink: String?
    var isBodyAsHtml: Bool?
    var isDefaultOpen: Bool?
    var shouldExpand: Bool?
    var buttonItems: String?
    var subItems: String?
}

struct EarnedMilesInfo: Codable {
    var id: String
    var currentValue: String
    var saveToPersist: Bool
}

struct Trip: Codable {
    let index: Int
    let cabinType: String?
    let origin: String
    let originName: String
    let destination: String
    let destinationName: String
    let stops: String
    let journeyTime: String?
    let departureTime: String
    let departureTimeSort: String?
    let arrivalTime: String
    let departureTimeGMT: String?
    let arrivalTimeGMT: String?
    let arrivalOffset: String?
    let serviceMap: String?
    let journeyMileage: String?
    let flightNumber: String?
    let destinationImage: String
    let destinationImageDesc: String?
    let tripNumber: String?
    let zeros: [String]?
    let destinationImageOnTop: DestinationImage?
}

struct DestinationImage: Codable {
    let imageUrl: String
    let imageDesc: String
    let nickName: String?
}

struct Passenger: Codable {
    var earnedMiles: PassengerEarnedMiles?
    var contact: PassengerContact
    var birthDate: String
    var travelerTypeCode: String
    var pricingPaxType: String
    var ctnDisplaySequence: String
    var ssrDisplaySequence: String
    var selectedSpecialNeeds: [SpecialNeeds]?
    var sharesGivenName: String
    var pnrCustomerID: String
    var knownTravelerNumber: String
    var canadianTravelNumber: String
    var redressNumber: String
    var ktnDisplaySequence: String
    var redressDisplaySequence: String
    var passengerName: PassengerName
    var sharesPosition: String
    var mileagePlus: MileagePlus?
    var oaRewardPrograms: String?
    var isMPMember: Bool
    var loyaltyProgramProfile: LoyaltyProfile?
    var employeeProfile: String?
    
    private enum CodingKeys: String, CodingKey {
        case earnedMiles, contact, birthDate, travelerTypeCode, pricingPaxType, ctnDisplaySequence, ssrDisplaySequence, sharesGivenName, pnrCustomerID, knownTravelerNumber, canadianTravelNumber, redressNumber, ktnDisplaySequence, redressDisplaySequence, passengerName, sharesPosition, mileagePlus, isMPMember, loyaltyProgramProfile
    }
}

struct PassengerEarnedMiles: Codable {
    var earnedMilesType: String?
    var pqfTotalFormated: String?
    var pqpTotalFormated: String?
    var pqfTotalShort: String?
    var pqpTotalShort: String?
    var firstName: String?
    var lastName: String?
    var awardMileTotalFormated: String?
    var pqmTotalFormated: String?
    var pqsTotalFormated: String?
    var pqdTotalFormated: String?
    var awardMileTotalShort: String?
    var pqmTotalShort: String?
    var pqsTotalShort: String?
    var pqdTotalShort: String?
    var isMember: Bool?
    var memberLevelText: String?
    var nonMemberMessage: String?
    var rowData: PassengerEarnedMilesRowData?
    var hasInelligibleSegment: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case earnedMilesType, pqfTotalFormated, pqpTotalFormated, pqfTotalShort, pqpTotalShort, firstName, lastName, awardMileTotalFormated, awardMileTotalShort, isMember, memberLevelText, nonMemberMessage, hasInelligibleSegment
    }
}

struct PassengerEarnedMilesRowData: Codable {
    var pqfText: String
    var pqpText: String
    var tripText: String
    var segmentText: String
    var awardMileText: String
    var pqmText: String?
    var pqsText: String?
    var pqdText: String?
    var isElligibleForEarnings: Bool
    var ineligibleEarningsText: String
    var secondLineText: String
    
    private enum CodingKeys: String, CodingKey {
        case pqfText, pqpText, tripText, segmentText, awardMileText, isElligibleForEarnings, ineligibleEarningsText, secondLineText
    }
}

struct PassengerContact: Codable {
    var emails: [PassengerContactEmails]?
    var phoneNumbers: [PassengerContactPhoneNumbers]?
}

struct PassengerContactEmails: Codable {
    var key: String
    var channel: String?
    var emailAddress: String
    var isPrivate: Bool
    var isDefault: Bool
    var isPrimary: Bool
    var isDayOfTravel: Bool
    
    private enum CodingKeys: String, CodingKey {
        case key, emailAddress, isPrivate, isDefault, isPrimary, isDayOfTravel
    }
}

struct PassengerContactPhoneNumbers: Codable {
    var areaNumber: String
    var attention: String
    var channelCode: String
    var channelCodeDescription: String
    var channelTypeCode: String
    var channelTypeDescription: String
    var channelTypeSeqNumber: Int
    var countryCode: String
    var countryNumber: String
    var countryPhoneNumber: String
    var customerId: Int
    var description: String
    var discontinuedDate: String
    var effectiveDate: String
    var extensionNumber: String
    var isPrimary: Bool
    var isPrivate: Bool
    var isProfileOwner: Bool
    var key: String
    var languageCode: String
    var mileagePlusId: String
    var pagerPinNumber: String // what the fuck
    var phoneNumber: String
    var sharesCountryCode: String
    var wrongPhoneDate: String
    var deviceTypeCode: String
    var deviceTypeDescription: String
    var isDayOfTravel: Bool
    var isSMSEnabled: Bool
}

struct SpecialNeeds: Codable {
    var displaySequence: String
    var value: String
    var code: String
    var displayDescription: String?
    var registerServiceDescription: String?
    var type: String?
    var messages: String?
    var subOptions: String?
    var subOptionHeader: String?
    var isDisabled: Bool?
    var informationLink: String?
    
    private enum CodingKeys: String, CodingKey {
        case displaySequence, value, code
    }
}

struct PassengerName: Codable {
    var title: String
    var first: String
    var middle: String
    var last: String
    var suffix: String
    var dateOfBirth: String
}

struct MileagePlus: Codable {
    var accountBalance: Int
    var activeStatusCode: String
    var activeStatusDescription: String
    var travelBankBalance: Double
    var allianceEliteLevel: Int
    var closedStatusCode: String
    var closedStatusDescription: String
    var currentEliteLevel: Int
    var currentEliteLevelDescription: String
    var currentYearMoneySpent: Double
    var eliteMileageBalance: Int
    var eliteSegmentBalance: Int
    var eliteSegmentDecimalPlaceValue: Int
    var encryptedPin: String
    var enrollDate: String
    var enrollSourceCode: String
    var enrollSourceDescription: String
    var flexPqmBalance: Int
    var futureEliteLevel: Int
    var futureEliteDescription: String
    var instantEliteExpirationDate: String
    var isCEO: Bool
    var isClosedPermanently: Bool
    var isClosedTemporarily: Bool
    var isCurrentTrialEliteMember: Bool
    var isFlexPqm: Bool
    var isInfiniteElite: Bool
    var isLifetimeCompanion: Bool
    var isLockedOut: Bool
    var isMergePending: Bool
    var isUnitedClubMember: Bool
    var isPresidentialPlus: Bool
    var key: String
    var lastActivityDate: String
    var lastExpiredMile: Int
    var lastFlightDate: String
    var lastStatementBalance: Int
    var lastStatementDate: String
    var lifetimeEliteLevel: Int
    var lifetimeEliteMileageBalance: Int
    var mileageExpirationDate: String
    var nextYearEliteLevel: Int
    var nextYearEliteLevelDescription: String
    var mileagePlusId: String
    var mileagePlusPin: String
    var priorUnitedAccountNumber: String
    var starAllianceEliteLevel: Int
    var mpCustomerId: Int
    var vendorCode: String
    var premierLevelExpirationDate: String
    var instantElite: String?
    var travelBankAccountNumber: String?
    var travelBankCurrencyCode: String?
    var travelBankExpirationDate: String?
}

struct LoyaltyProfile: Codable {
    var loyaltyProgramCarrierCode: String?
    var loyaltyProgramID: String?
    var loyaltyProgramMemberID: String?
    var loyaltyProgramMemberTierLevel: String?
    var starEliteLevel: String?
    var loyaltyProgramMemberTierDescription: String?
    var balances: [LoyaltyProfileBalances]?
}

struct LoyaltyProfileBalances: Codable {
    var characteristics: [LoyaltyProfileBalancesCharacteristics]
}

struct LoyaltyProfileBalancesCharacteristics: Codable {
    var code: String
    var value: String?
    var description: String?
    var status: LoyaltyProfileBalancesCharacteristicsStatus?
}

struct LoyaltyProfileBalancesCharacteristicsStatus: Codable {
    var description: String
    var key: String?
}

struct Segment: Codable {
    var isCheckedIn: Bool
    var isCheckInEligible: Bool
    var isAllPaxCheckedIn: Bool
    var scheduleChangeInfo: String?
    var isChangeOfGuage: Bool?
    var isCanadaSegment: Bool?
    var showSeatMapLink: Bool?
    var noProtection: String?
    var inCabinPetInfo: String?
    var ssrMeals: String
    var ticketCouponStatus: String?
    var tripNumber: String?
    var segmentNumber: Int
    var isPlusPointSegment: Bool
    var hasPreviousSegmentDetails: Bool
    var isElf: Bool?
    var isIBE: Bool?
    var bundles: String?
    var operationoperatingCarrier: SegmentOperatingCarrier
    var aircraft: SegmentAircraftType
    var meal: String
    var flightTime: String
    var groundTime: String
    var totalTravelTime: String
    var actualMileage: String
    var mileagePlusMileage: String
    var emp: String?
    var totalMileagePlusMileage: String
    var classOfService: String
    var classOfServiceDescription: String
    var seats: [SegmentSeats]
    var numberOfStops: String
    var stops: [Segment]
    var scheduledDepartureDateTimeGMT: String
    var scheduledArrivalDateTimeGMT: String
    var codeshareCarrier: SegmentCodeshareCarrier
    var codeshareFlightNumber: String
    var upgradeVisibility: SegmentUpgradeVisibility?
    var upgradeable: Bool
    var upgradeableMessageCode: String
    var upgradeableMessage: String
    var complimentaryInstantUpgradeMessage: String
    var remove: Bool
    var waitlisted: Bool
    var lowestEliteLevel: Int
    var upgradeableRemark: String
    var actionCode: String
    var upgradeEligible: Bool
    var waitedCOSDesc: String
    var lmxProducts: String?
    var cabinType: String
    var nonPartnerFlight: Bool
    var productCode: String?
    var fareBasisCode: String?
    var uflifoFlightStatus: String?
    var uflifoFlightStatusForDotIrropsMessage: String?
    var marketingCarrier: SegmentOperatingCarrier
    var flightNumber: String
    var departure: SegmentPoi
    var arrival: SegmentPoi
    var scheduledDepartureDateTime: String
    var scheduledArrivalDateTime: String
    var scheduledDepartureTimeGMT: String
    var scheduledArrivalTimeGMT: String
    var formattedScheduledDepartureDateTime: String
    var formattedScheduledArrivalDateTime: String
    var formattedScheduledDepartureDate: String
    var formattedScheduledArrivalDate: String
    var formattedScheduledDepartureTime: String
    var formattedScheduledArrivalTime: String

    private enum CodingKeys: String, CodingKey {
        case isCheckedIn, isCheckInEligible, isAllPaxCheckedIn, ssrMeals, ticketCouponStatus, tripNumber, segmentNumber, isPlusPointSegment, hasPreviousSegmentDetails, operationoperatingCarrier, aircraft, meal, flightTime, groundTime, totalTravelTime, actualMileage, mileagePlusMileage, totalMileagePlusMileage, classOfService, classOfServiceDescription, seats, numberOfStops, stops, scheduledDepartureDateTimeGMT, scheduledArrivalDateTimeGMT, codeshareCarrier, codeshareFlightNumber, upgradeable, upgradeableMessageCode, upgradeableMessage, complimentaryInstantUpgradeMessage, remove, waitlisted, lowestEliteLevel, upgradeableRemark, actionCode, upgradeEligible, waitedCOSDesc, cabinType, nonPartnerFlight, productCode, fareBasisCode, uflifoFlightStatus, uflifoFlightStatusForDotIrropsMessage, marketingCarrier, flightNumber, departure, arrival, scheduledDepartureDateTime, scheduledArrivalDateTime, scheduledDepartureTimeGMT, scheduledArrivalTimeGMT, formattedScheduledDepartureDateTime, formattedScheduledArrivalDateTime, formattedScheduledDepartureDate, formattedScheduledArrivalDate, formattedScheduledDepartureTime, formattedScheduledArrivalTime
    }
}

struct SegmentOperatingCarrier: Codable {
    var code: String
    var name: String
    var flightNumber: String
}

struct SegmentAircraftType: Codable {
    var code: String
    var shortName: String
    var longName: String
    var modelCode: String
}

struct SegmentSeats: Codable {
    var number: String
    var seatRow: String
    var seatLetter: String
    var passengerSHARESPosition: String
    var seatStatus: String
    var segmentIndex: String
    var origin: String
    var destination: String
    var eddNumber: String
    var eDocId: String
    var price: Double
    var currency: String
    var programCode: String
}

struct SegmentCodeshareCarrier: Codable {
    var code: String
    var name: String
    var flightNumber: String
}

struct SegmentUpgradeVisibility: Codable {
    var remarkAdvisoryType: String
    var carrierCode: String
    var classOfService: String
    var departureDateTime: String
    var destination: String
    var flightNumber: Int
    var origin: String
    var previousSegmentActionCode: String
    var segmentActionCode: String
    var segmentNumber: Int
    var upgradeRemark: String
    var decodedUpgradeMessage: String
    var upgradeMessage: String
    var upgradeMessageCode: String
    var upgradeProperties: [SegmentUpgradeVisibilityUpgradeProperties]
    var upgradeStatus: String
    var upgradeType: String
    var waitlistSegments: String?
    
    private enum CodingKeys: String, CodingKey {
        case remarkAdvisoryType, carrierCode, classOfService, departureDateTime, destination, flightNumber, origin, previousSegmentActionCode, segmentActionCode, segmentNumber, upgradeRemark, decodedUpgradeMessage, upgradeMessage, upgradeMessageCode, upgradeProperties, upgradeStatus, upgradeType
    }
}

struct SegmentUpgradeVisibilityUpgradeProperties: Codable {
    var key: String
    var value: String
}

struct SegmentPoi: Codable {
    var code: String
    var name: String
    var city: String
}

struct OneClickEnrollmentEligibility: Codable {
    var joinMileagePlusHeader: String
    var joinMileagePlusText: String
    var joinMileagePlus: String
}

struct CountDownWidgetInfo: Codable {
    let sectionTitle: String
    let sectionDescription: String
    let instructionLinkText: String
    let instructionPageTitle: String
    let instructionPageContent: String
}

struct Caption: Codable {
    var id: String
    var currentValue: String
    var saveToPersist: Bool
}
