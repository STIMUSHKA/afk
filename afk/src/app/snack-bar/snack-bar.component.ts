import { Component, inject } from '@angular/core';
import {
  MatSnackBarAction,
  MatSnackBarActions,
  MatSnackBarLabel,
  MatSnackBarRef,
  MAT_SNACK_BAR_DATA,
} from '@angular/material/snack-bar';

@Component({
  selector: 'snack-bar-annotated-component-example-snack',
  template: '<div [class]="data.customClass">{{ data.message }}</div>',
  styles: `
    :host {
      display: flex;
    }
  `,
  imports: [MatSnackBarLabel, MatSnackBarActions, MatSnackBarAction],
})
export class SnackBarComponent {
  snackBarRef = inject(MatSnackBarRef);
  data = inject(MAT_SNACK_BAR_DATA);
}
