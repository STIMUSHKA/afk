import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HeroAddToPartitionDialog } from './hero-add-to-partition-dialog.component';

describe('HeroSelectionDialogComponent', () => {
  let component: HeroAddToPartitionDialog;
  let fixture: ComponentFixture<HeroAddToPartitionDialog>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HeroAddToPartitionDialog]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HeroAddToPartitionDialog);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
