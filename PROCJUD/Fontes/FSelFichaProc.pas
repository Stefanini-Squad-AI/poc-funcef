unit FSelFichaProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, Mask, DBCtrls, Wwdatsrc, Wwtable, TB97,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, MontaSelect;

type
  TfrmSelFichaProc = class(TCMParamRel)
    tblProcesso: TwwTable;
    tblPessoal: TwwTable;
    ds: TwwDataSource;
    Label1: TLabel;
    Label2: TLabel;
    ds2: TwwDataSource;
    TabSheet1: TTabSheet;
    dbedNumero: TDBEdit;
    dbedContraP: TDBEdit;
    sbtnProcurar: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    MontaSelectProc: TMontaSelect;
    rgObserv: TRadioGroup;
    rgHonor: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelFichaProc: TfrmSelFichaProc;

implementation

uses RFichaProc;

{$R *.DFM}

procedure TfrmSelFichaProc.FormCreate(Sender: TObject);
begin
  inherited;
  tblProcesso.Open;
  tblPessoal.Open;
  sbtnProcurarClick(Self);  
end;

procedure TfrmSelFichaProc.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relFichaProc := TrelFichaProc.Create(Application);
  relFichaProc.qr.Print;
  Self.WindowState := wsNormal;
  //relFichaProc.Free;
  //relFichaProc := Nil;
end;

procedure TfrmSelFichaProc.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relFichaProc := TrelFichaProc.Create(Self);
  relFichaProc.qr.Preview;
  Self.WindowState := wsNormal;
  //relFichaProc.Free;
  //relFichaProc := Nil;
end;






procedure TfrmSelFichaProc.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  sbtnProcurar.down := false;
  MontaSelectProc.Executar;
  if (MontaSelectProc.ValoresChave.Count > 0) and
     (MontaSelectProc.ValoresChave[0] <> '')
  then tblProcesso.FindKey([StrToFloat(MontaSelectProc.ValoresChave[0])]);

end;



end.
