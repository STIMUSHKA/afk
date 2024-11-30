import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HeroSelectionDialogComponent } from './hero-selection-dialog.component';

describe('HeroSelectionDialogComponent', () => {
  let component: HeroSelectionDialogComponent;
  let fixture: ComponentFixture<HeroSelectionDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HeroSelectionDialogComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HeroSelectionDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
