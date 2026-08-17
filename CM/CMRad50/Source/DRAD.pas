unit DRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TDtmRAD = class(TDataModule)
    qryExecProc: TwwQuery;
    qryEtapa: TwwQuery;
    qryProc: TwwQuery;
    qryEtapaIDTIPOETAPA: TFloatField;
    qryProcFLGOK: TStringField;
    qryExecEtapa: TwwQuery;
    qryNdiaProc: TwwQuery;
    qryNdiaEtapa: TwwQuery;
    qryNdiaProcNUMDIASPREVISTO: TFloatField;
    qryNdiaEtapaNUMDIASPREVISTO: TFloatField;
    qryEmpresaProp: TwwQuery;
    qryInfoProcPend: TwwQuery;
    qryAux: TwwQuery;
    procedure DtmRADCreate(Sender: TObject);
    procedure DtmRADDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmRAD: TDtmRAD;

implementation

{$R *.DFM}

procedure TDtmRAD.DtmRADCreate(Sender: TObject);
Var
    x : Integer;
Begin
   For x := 0 To ComponentCount - 1 Do
     Begin
        IF (Components[x] is TwwQuery) Then
           Begin
              If Not (Components[x] as TwwQuery).Prepared Then
                 (Components[x] as TwwQuery).Prepare;
           End;
     End;
end;

procedure TDtmRAD.DtmRADDestroy(Sender: TObject);
Var
    x : Integer;
Begin
  For x := 0 To ComponentCount - 1 Do
    Begin
       IF (Components[x] is TwwQuery) Then
          Begin
             (Components[x] as TwwQuery).Close;
             If (Components[x] as TwwQuery).Prepared Then
                (Components[x] as TwwQuery).Unprepare;
          End;
    End;
end;



end.
