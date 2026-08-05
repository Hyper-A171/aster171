# Fix Attendance Summary Logic and Models

The current implementation has fragmented attendance summary models (`AttendanceSummary` and `SubjectAttendanceSummary`) and duplicates calculation logic across multiple screens (`AllSubjectsScreen` and `SubjectDetailsScreen`). This plan unifies the models and centralizes the "thinking" (logic) within the model itself.

## User Review Required

> [!IMPORTANT]
> I am merging `SubjectAttendanceSummary` into `AttendanceSummary`. This will require updating all usages of `SubjectAttendanceSummary` to use the enriched `AttendanceSummary` model.

## Proposed Changes

### Core Models & Services

#### [MODIFY] [attendance_summary.dart](file:///C:/Users/mrhyp/StudioProjects/aster/lib/core/models/attendance_summary.dart)
- Enrich with counts (`presentCount`, `absentCount`, etc.).
- Add a factory method `fromCounts` that takes raw units/counts and required percentages to calculate all metrics (percentage, risk status, safe absences, recovery needed).
- This centralizes the "thinking" logic.

#### [DELETE] [subject_attendance_summary.dart](file:///C:/Users/mrhyp/StudioProjects/aster/lib/core/models/subject_attendance_summary.dart)
- Remove this redundant model.

---

### Data Layer

#### [MODIFY] [attendance_dao.dart](file:///C:/Users/mrhyp/StudioProjects/aster/lib/core/database/daos/attendance_dao.dart)
- Update `watchSubjectAttendanceSummary` to return the new enriched `AttendanceSummary` (initially just with the raw counts).
- Actually, it's better if the DAO returns the raw counts and a service/provider handles the "thinking" that requires subject-specific rules (like `requiredPercentage`).

#### [MODIFY] [attendance_repository.dart](file:///C:/Users/mrhyp/StudioProjects/aster/lib/core/repositories/attendance_repository.dart)
- Update signature to use `AttendanceSummary`.

---

### Providers & UI

#### [MODIFY] [database_providers.dart](file:///C:/Users/mrhyp/StudioProjects/aster/lib/core/providers/database_providers.dart)
- Create a new provider (or update the existing one) that combines `Subject` data and raw attendance counts to produce a fully calculated `AttendanceSummary`.

#### [MODIFY] [all_subjects_screen.dart](file:///C:/Users/mrhyp/StudioProjects/aster/lib/features/subjects/presentation/pages/all_subjects_screen.dart)
- Use the enriched `AttendanceSummary` directly, removing manual calculations for `riskStatus`.

#### [MODIFY] [subject_details_screen.dart](file:///C:/Users/mrhyp/StudioProjects/aster/lib/features/subjects/presentation/pages/subject_details_screen.dart)
- Major cleanup: use the enriched `AttendanceSummary` to display all metrics (Safe Absences, Recovery Needed, etc.) without calculating them in the `build` method.

## Verification Plan

### Automated Tests
- I'll check if there are existing tests for attendance calculation and update them if necessary.

### Manual Verification
- Verify that `SubjectDetailsScreen` still shows correct attendance percentages and risk levels.
- Verify that `AllSubjectsScreen` correctly displays the status chips for each subject.
- Ensure "No attendance recorded" state is still handled correctly.
