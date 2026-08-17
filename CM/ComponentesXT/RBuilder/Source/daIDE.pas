{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daIDE;

interface

implementation

{$R rbDADE.res}
{$R daIDEBmp.res}

uses
  ppClass, ppUtils, ppForms, ppIDE, ppDsIntf, ppDsgnDB,
  daDataWizard, daDataManager, daDataSettingDlg, daQueryDesigner, daQueryWizard,
  daLinkDataViewDlg;

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppResourceManager.AddResFileName('rbDADE');

  ppRegisterDesignModule(TdaDataManager, 'TppDesignerWindow');
  ppRegisterForm(TppCustomDataSettingsDialog, TdaDataSettingsDialog);

  daRegisterWizard(TdaQueryWizard);
  daRegisterWizard(TdaQueryDesigner);

finalization

  ppResourceManager.RemoveResFileName('rbDADE');

  ppUnRegisterDesignModule(TdaDataManager, 'TppDesignerWindow');
  ppUnRegisterForm(TppCustomDataSettingsDialog);

  daUnRegisterWizard(TdaQueryWizard);
  daUnRegisterWizard(TdaQueryDesigner);

end.
