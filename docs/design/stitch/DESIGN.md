# Aster Design System - Stitch Source of Truth

## Brand Direction
Aster is a premium, productivity-focused Android application designed for college students. It conveys professionalism, precision, and trust through a "Modern Corporate" aesthetic that aligns strictly with Material 3 principles.

## Colour Strategy
The palette uses deep indigo and violet tones to establish a calm, intelligent environment. 
- **Light Mode**: High-contrast, airy surfaces with tonal elevations.
- **Dark Mode**: Soft, deep greys (not pure black) with subtle 1dp strokes on containers for definition.
- **Functional Status**: Semantic colors (Safe, Watch, Risky, Critical, Unrecoverable) are used to communicate internship and attendance states. These never rely on color alone and are always paired with icons and labels.

## Typography Rules
Aster uses **Inter** as its primary typeface.
- **Scale**: Follows Material 3 type scales (Display, Headline, Title, Body, Label).
- **Android Specifics**: TitleMedium is reserved for AppBar titles. LabelLarge is used for interactive elements like buttons and navigation.

## Spacing System
A strict **8-point grid** is enforced throughout the application.
- `spaceXs`: 4 (tight internal spacing)
- `spaceSm`: 8
- `spaceMd`: 16
- `spaceLg`: 24
- `spaceXl`: 32
- **Margins**: Mobile uses 16px, Tablets use 24px.
- **Touch Targets**: Minimum 48x48 logical pixels.

## Radius System
- **Buttons**: 12px
- **Chips**: 8px (Status/Choice) or Full (Pill)
- **Cards**: 16px
- **Bottom Sheets**: 24px (Top Corners)
- **FAB**: 16px

## Elevation System
- **Tonal Elevation**: Primary method for depth in Material 3.
- **Shadows**: Used sparingly. 
  - Level 1: 5% opacity for standard surfaces.
  - Level 2: 10% opacity for modals/prominent elements.
- **Dark Mode**: Elevation is communicated via surface color shifts and subtle strokes rather than shadows.

## Accessibility Rules
- Minimum 48dp touch targets for all interactive components.
- AA contrast compliance for all text/icon combinations.
- Semantic labels for every functional icon and status indicator.
- Support for system-level text scaling without UI breakage.
