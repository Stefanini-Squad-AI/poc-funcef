unit RegCmAdd50;

interface

procedure Register;

implementation

uses
  Classes, dsgnIntf, ZipMstr, SortGrid, Twofish, RipeMD, uProcuraDir, BfDialogs,
  ComPort, TrayIcon, TaskIcon, CMNetUsers, ZipDir, FsmTimer, DialUp, SimpFTP, SdfData;

procedure Register;
begin
  RegisterComponents('CM Additional', [TTwofish, TRipeMD, TZipMaster, TSortGrid,
                      TZipDir, TProcuraDirDlg, TComPort, TTrayIcon, TTaskIcon,
                      TCMNetUsers, TFSMTimer, TDialUp, TSimpleFTP, TFixedFormatDataSet,
                      TSdfDataSet ]);

  RegisterPropertyEditor(TypeInfo(String), TComPort, 'DeviceName', TDeviceNameProperty);

  RegisterComponentEditor(TsBfCustomDialog, TBfDialogEditor);
end;

end.
