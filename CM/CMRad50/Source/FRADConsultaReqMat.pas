unit FRADConsultaReqMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBClient, uCMClientDataSet, TREdit, Mask,
  DBCtrls, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uCtrlPadroes, uCtrlRADConsModulos;

type
  TfrmRADConsultaReqMat = class(TfrmSairAjuda)
    pnlMestre: TPanel;
    Label1: TLabel;
    lbALmox: TLabel;
    Label14: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    RgTipoMov: TDBRadioGroup;
    GrpDatas: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edDataEmi: TCMDateTimePicker;
    edDataNec: TCMDateTimePicker;
    edAlmox: TEdit;
    dblcAtiv: TwwDBLookupCombo;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    dbgrdDet: TwwDBGrid;
    TabOBS: TTabSheet;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    edValTot: TRealEdit;
    Label3: TLabel;
    edNumReq: TDBEdit;
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    dsDet: TwwDataSource;
    cdsItem: TCMClientDataSet;
    cdsAlmox: TCMClientDataSet;
    dsArtigo: TwwDataSource;
    cdsUnidNegoc: TCMClientDataSet;
    cdsUnMedida: TCMClientDataSet;
    cdsArtigo: TCMClientDataSet;
    cdsAlmoxUsuario: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FNumRequisicao: integer;
    RADConsultaCompras: TCtrlRADConsultaCompras;
    FIdProcesso: integer;
    procedure CalcValorTot;
    procedure TrocaCaption;
    procedure SetIdProcesso(const Value: integer);
    procedure SetArtigo;
  public
    { Public declarations }
    property IdProcesso: integer read FIdProcesso write SetIdProcesso;
    procedure SelecionarReqMat;

  end;

var
  frmRADConsultaReqMat: TfrmRADConsultaReqMat;

implementation

{$R *.DFM}
uses uSistema, DBaseDados, uMensErro;

procedure TfrmRADConsultaReqMat.FormCreate(Sender: TObject);
begin
  inherited;
  RADConsultaCompras := TCtrlRADConsultaCompras.Create;
  RADConsultaCompras.InitializeAs(Padroes);

  cdsUnidNegoc.Data    := RADConsultaCompras.SelectUnidadeNegocio(Sistema.IdEmpresa);
  cdsAlmox.Data        := RADConsultaCompras.SelectAlmox(Sistema.IdUsuario, Sistema.IdEmpresa);
  cdsCCusto.Data       := RADConsultaCompras.SelectCentroCusto(cdsAlmox.FieldByName('CODCENTROCUSTO').AsInteger,
                                                               Sistema.IdEmpresa);                                                 
end;


procedure TfrmRADConsultaReqMat.SetArtigo;
begin
{   edSaldo.Value := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                         dblcItem.LookUpValue,
                                         Modulo.iCodAlmoxa,
                                         edDataEmi.Date);
                                         }
end;

procedure TfrmRADConsultaReqMat.TrocaCaption;
begin
  Case RgTipoMov.ItemIndex Of
       0 : Begin
              lbAlmox.Caption        := 'Almoxarifado Destino';
              cdsAlmoxUsuario.Data := RADConsultaCompras.SelectAlmoxOrigem(Sistema.IdEmpresa,
                                     cdsAlmox.FieldByName('CODALMOX').AsInteger);
              edAlmox.Text           := cdsAlmoxUsuario.FieldByName('DESCALMOX').AsString;
           End;
       1 : Begin
              lbAlmox.Caption := 'Centro de Custo Destino';
              edAlmox.Text    :=  cdsCCusto.FieldByName('NOME').AsString;
           End;
    End;
end;

procedure TfrmRADConsultaReqMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(RADConsultaCompras);
  inherited;
end;

procedure TfrmRADConsultaReqMat.CalcValorTot;
Var
   Marca   : TBookmark;
   rValor  : Double;
   cEstado : Char;
begin
   Case cdsItem.State Of
      dsInsert : cEstado := 'I';
      dsEdit   : cEstado := 'E';
   Else
      cEstado := 'N';
   End;
   Marca  := cdsItem.GetBookmark;
   rValor := 0;
   cdsItem.DisableControls;
   Try
     cdsItem.Cancel;
     cdsItem.First;
     While Not cdsItem.Eof Do
        Begin
           rValor := rValor + (cdsItem.fieldByName('QTDEPEDIDA').AsFloat * cdsItem.fieldByName('VALORUN').asFloat);
           cdsItem.Next;
        End;
   Finally
      edValTot.Value := rValor;
      cdsItem.EnableControls;
      cdsItem.GotoBookmark(Marca);
      cdsItem.FreeBookmark(Marca);
      Case cEstado Of
         'I' : cdsItem.Append;
         'E' : cdsItem.Edit;
      End;
   End;
end;

procedure TfrmRADConsultaReqMat.SelecionarReqMat;
begin
   FNumRequisicao := RADConsultaCompras.GetRequisicaoMaterial(FIdProcesso);
   cds.Data     := RADConsultaCompras.SelectReqMat(FNumRequisicao);
   cdsItem.Data := RADConsultaCompras.SelectItemReqMat(FNumRequisicao);
   TrocaCaption;
   CalcValorTot;
end;

procedure TfrmRADConsultaReqMat.SetIdProcesso(const Value: integer);
begin
  FIdProcesso := Value;
end;

end.
