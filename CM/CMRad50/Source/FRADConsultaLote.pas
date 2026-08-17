unit FRADConsultaLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Mask, wwdbedit, Db, Wwdatsrc,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCGrids,
  TREdit, IvDictio, IvMulti, IvEMulti, ComCtrls, DBCtrls, uCtrlParamIntegra,
  DBClient, uCMClientDataSet,  Menus, ImgList, ToolWin, uCtrlRadConsModulos, uCtrlPadroes;


type
  TfrmRADConsultaLote = class(TfrmSairAjuda)
    Panel1: TPanel;
    dbgrDocLote: TwwDBGrid;
    PlnFixo: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    lbldoc: TLabel;
    DBText11: TDBText;
    DBText5: TDBText;
    DBText4: TDBText;
    Label1: TLabel;
    lblPortadorForma: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    dblPortadorForma: TDBText;
    DBText2: TDBText;
    DBText6: TDBText;
    Label7: TLabel;
    Label12: TLabel;
    DBText7: TDBText;
    LbValorTotal: TLabel;
    CdsDocLote: TCMClientDataSet;
    CdsLote: TCMClientDataSet;
    Cds: TCMClientDataSet;
    dsLote: TwwDataSource;
    dsDocLote: TwwDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FIdProcesso: integer;
    procedure SetIdProcesso(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    RADConsultaLote: TCtrlRADConsultaLote;

    property IdProcesso: integer read FIdProcesso write SetIdProcesso;

    procedure SelecionarLote;
    procedure calculaValorTotal;
  end;

var
  frmRADConsultaLote: TfrmRADConsultaLote;

implementation

{$R *.DFM}

Procedure TfrmRADConsultaLote.calculaValorTotal;
Var
  dvalor: double;
Begin
  dvalor := 0;
  CdsDocLote.First;
  While Not CdsDocLote.Eof Do
  Begin
    dvalor := dvalor + CdsDocLote.FieldByName('Valor').AsFloat;
    CdsDocLote.Next;
  End;
  LbValorTotal.Caption := FloatToStrf(dvalor, ffNumber, 14, 2);
  CdsDocLote.First;
End;


procedure TfrmRADConsultaLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(RadConsultaLote);
  inherited;
end;

procedure TfrmRADConsultaLote.FormCreate(Sender: TObject);
begin
  inherited;
  RadConsultaLote := TCtrlRadConsultaLote.Create;
  RadConsultaLote.InitializeAs(Padroes);
end;

procedure TfrmRADConsultaLote.SelecionarLote;
var
  iNumLote: LongInt;
begin
  //amf 28.11.2006
  iNumLote := RadConsultaLote.ObterNumeroLoteDoProcessoRAD(IdProcesso);

  CdsLote.Data := RadConsultaLote.ListaLotePagto(iNumLote);

  if iNumLote > 0 then
  begin
     cdsDocLote.Data := RadConsultaLote.ListaDocumentosDoLote(iNumLote);
     TFloatField(CdsDocLote.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
     TFloatField(CdsDocLote.FieldByName('SALDO')).DisplayFormat := '#,##0.00';
     calculaValorTotal;
  end;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30069;
    bbtnAjuda.HelpContext := 30069;
  end
  else
  begin
     // OBS.: Não mexi no Help Context do Contas a Receber...
    //    HelpContext           := 40034;
   //    bbtnAjuda.HelpContext := 40034;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
end;

procedure TfrmRADConsultaLote.SetIdProcesso(const Value: integer);
begin
  FIdProcesso := Value;
end;

end.
