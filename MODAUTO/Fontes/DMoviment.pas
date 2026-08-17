unit DMoviment;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, CMSQLScript;

type
  TDtmMoviment = class(TDataModule)
    qryInfoSaldoRep: TwwQuery;
    qryInfoSaldoMov: TwwQuery;
    qryInfoSaldoRepSALDOQTDE: TFloatField;
    qryInfoSaldoMovSALDOQTDEMOV: TFloatField;
    procedure DtmMovimentCreate(Sender: TObject);
    procedure DtmMovimentDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmMoviment: TDtmMoviment;

implementation

{$R *.DFM}

procedure TDtmMoviment.DtmMovimentCreate(Sender: TObject);
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
End;

procedure TDtmMoviment.DtmMovimentDestroy(Sender: TObject);
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
