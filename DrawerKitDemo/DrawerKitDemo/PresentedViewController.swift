import UIKit
import DrawerKit

class PresentedViewController: UIViewController {
    @IBOutlet weak var presentedView: PresentedView!
    @IBAction func dismissButtonTapped() {
        dismiss(animated: true)
    }
}

extension PresentedViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return (view as? PresentedView)?.imageView
    }
}

extension PresentedViewController: DrawerPresentable {
    var heightOfPartiallyExpandedDrawer: CGFloat {
        guard let view = self.view as? PresentedView else { return 0 }
        return view.dividerView.frame.origin.y
    }
}

extension PresentedViewController: DrawerAnimationParticipant {
    public var drawerAnimationActions: DrawerAnimationActions {
        var actions = DrawerAnimationActions()
        actions.prepare = { [weak self] info in
            switch (info.startDrawerState, info.endDrawerState) {
            case (.collapsed, .partiallyExpanded):
                self?.presentedView.prepareCollapsedToPartiallyExpanded()
            case (.partiallyExpanded, .collapsed):
                self?.presentedView.preparePartiallyExpandedToCollapsed()
            case (.collapsed, .fullyExpanded):
                self?.presentedView.prepareCollapsedToFullyExpanded()
            case (.fullyExpanded, .collapsed):
                self?.presentedView.prepareFullyExpandedToCollapsed()
            case (.partiallyExpanded, .fullyExpanded):
                self?.presentedView.preparePartiallyExpandedToFullyExpanded()
            case (.fullyExpanded, .partiallyExpanded):
                self?.presentedView.prepareFullyExpandedToPartiallyExpanded()
            default:
                break
            }
        }
        actions.animateAlong = { [weak self] info in
            switch (info.startDrawerState, info.endDrawerState) {
            case (.collapsed, .partiallyExpanded):
                self?.presentedView.animateAlongCollapsedToPartiallyExpanded()
            case (.partiallyExpanded, .collapsed):
                self?.presentedView.animateAlongPartiallyExpandedToCollapsed()
            case (.collapsed, .fullyExpanded):
                self?.presentedView.animateAlongCollapsedToFullyExpanded()
            case (.fullyExpanded, .collapsed):
                self?.presentedView.animateAlongFullyExpandedToCollapsed()
            case (.partiallyExpanded, .fullyExpanded):
                self?.presentedView.animateAlongPartiallyExpandedToFullyExpanded()
            case (.fullyExpanded, .partiallyExpanded):
                self?.presentedView.animateAlongFullyExpandedToPartiallyExpanded()
            default:
                break
            }
        }
        actions.cleanup = { [weak self] info in
            switch (info.startDrawerState, info.endDrawerState) {
            case (.collapsed, .partiallyExpanded):
                self?.presentedView.cleanupCollapsedToPartiallyExpanded()
            case (.partiallyExpanded, .collapsed):
                self?.presentedView.cleanupPartiallyExpandedToCollapsed()
            case (.collapsed, .fullyExpanded):
                self?.presentedView.cleanupCollapsedToFullyExpanded()
            case (.fullyExpanded, .collapsed):
                self?.presentedView.cleanupFullyExpandedToCollapsed()
            case (.partiallyExpanded, .fullyExpanded):
                self?.presentedView.cleanupPartiallyExpandedToFullyExpanded()
            case (.fullyExpanded, .partiallyExpanded):
                self?.presentedView.cleanupFullyExpandedToPartiallyExpanded()
            default:
                break
            }
        }
        return actions
    }
}
