# Aster Component Inventory

## Buttons

### AsterPrimaryButton
- **Purpose**: High-emphasis actions.
- **States**: Default, Pressed, Disabled, Loading.
- **Properties**: `label`, `onPressed`, `icon`, `isLoading`, `fullWidth`.
- **A11y**: Standard button semantics.

### AsterSecondaryButton
- **Purpose**: Medium-emphasis actions.
- **States**: Default, Pressed, Disabled, Loading.
- **Properties**: `label`, `onPressed`, `icon`, `isLoading`, `fullWidth`.

## Cards

### AsterCard
- **Purpose**: Main organizational building block.
- **States**: Static, Tappable.
- **Properties**: `child`, `padding`, `onTap`, `showShadow`.
- **A11y**: Card semantics; tap target minimums handled via InkWell.

### AsterStatusCard
- **Purpose**: Communicates status with context.
- **Properties**: `status`, `title`, `description`, `content`, `icon`.
- **A11y**: Status icons have associated labels for screen readers.

## Navigation

### AsterBottomNavigation
- **Purpose**: Primary app navigation.
- **Destinations**: Today, Subjects, Plan, Internship, More.
- **A11y**: Uses Material 3 NavigationBar semantics.

## Feedback

### AsterEmptyState
- **Purpose**: Placeholder when content is missing.
- **Properties**: `title`, `message`, `icon`, `action`.

### AsterLoadingIndicator
- **Purpose**: Full-screen or section-level loading.
- **Properties**: `message`.
