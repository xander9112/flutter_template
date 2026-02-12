import 'package:dependencies/dependencies.dart';

abstract class FormWorker<T> {
  late final FormGroup form;

  Future<FormGroup> init([T? initialValue]) async {
    return form = FormGroup({});
  }

  bool get isValid => form.valid;

  Map<String, dynamic> get value => form.value;

  Map<String, AbstractControl<Object?>> get fields => form.controls;

  Object? getRawValue(String name) => form.rawValue[name];

  bool get isDirty => form.dirty;

  bool get isTouched => form.touched;

  void patchValue(
    Map<String, Object?>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.patchValue(value, updateParent: updateParent, emitEvent: emitEvent);

  void reset({
    Map<String, Object?>? value,
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) => form.reset(
    value: value,
    updateParent: updateParent,
    emitEvent: emitEvent,
    removeFocus: removeFocus,
    disabled: disabled,
  );

  AbstractControl<dynamic>? getFormControl(String fieldName) {
    final control = form.control(fieldName);

    return control;
  }

  void invalidate(
    String fieldName,
    Map<String, dynamic> errors, {
    bool markAsDirty = true,
  }) {
    getFormControl(fieldName)?.setErrors(errors, markAsDirty: markAsDirty);
  }
}
