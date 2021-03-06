import UIKit

/// A collection of convenience getter functions to access the drawer
/// configuration parameters directly from the drawer display controller.
///
/// Refer to `DrawerConfiguration.swift` for detailed descriptions of the
/// configuration parameters.

extension DrawerDisplayController {
    public var totalDurationInSeconds: TimeInterval {
        return configuration.totalDurationInSeconds
    }

    public var durationIsProportionalToDistanceTraveled: Bool {
        return configuration.durationIsProportionalToDistanceTraveled
    }

    public var timingCurveProvider: UITimingCurveProvider {
        return configuration.timingCurveProvider
    }

    public var fullExpansionBehaviour: DrawerConfiguration.FullExpansionBehaviour {
        return configuration.fullExpansionBehaviour
    }

    public var supportsPartialExpansion: Bool {
        return configuration.supportsPartialExpansion
    }

    public var dismissesInStages: Bool {
        return configuration.dismissesInStages
    }

    public var flickSpeedThreshold: CGFloat {
        return configuration.flickSpeedThreshold
    }

    public var upperMarkGap: CGFloat {
        return configuration.upperMarkGap
    }

    public var lowerMarkGap: CGFloat {
        return configuration.lowerMarkGap
    }

    public var maximumCornerRadius: CGFloat {
        return configuration.maximumCornerRadius
    }

    public var isDrawerDraggable: Bool {
        return configuration.isDrawerDraggable
    }

    public var isFullyPresentableByDrawerTaps: Bool {
        return configuration.isFullyPresentableByDrawerTaps
    }

    public var numberOfTapsForFullDrawerPresentation: Int {
        return configuration.numberOfTapsForFullDrawerPresentation
    }

    public var isDismissableByOutsideDrawerTaps: Bool {
        return configuration.isDismissableByOutsideDrawerTaps
    }

    public var numberOfTapsForOutsideDrawerDismissal: Int {
        return configuration.numberOfTapsForOutsideDrawerDismissal
    }

    public var hasHandleView: Bool {
        return configuration.hasHandleView
    }

    public var handleViewConfiguration: HandleViewConfiguration {
        return configuration.handleViewConfiguration
    }
}
