unit FCadValParamInstFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TB97, TabControlDetalhe, ExtCtrls, Mask,
  TREdit, wwdblook, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  CmEventosCadastro, ImgList, IvDictio, IvMulti, IvEMulti;

type
  TFrmCadValParamInstFin = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    QryDetalhe: TwwQuery;
    QryExibeDetalhe: TwwQuery;
    DsExibeDetalhe: TwwDataSource;
    QryExibeDetalheIDTIPOEVENEMISSOR: TFloatField;
    QryExibeDetalheDESCTPEVENEMISSOR: TStringField;
    QryExibeDetalheIDEMISSOR: TFloatField;
    QryExibeDetalheDATAEVENTOEMISSOR: TDateTimeField;
    QryExibeDetalheVLREVENTOEMISSOR: TFloatField;
    QryExibeDetalheSTATEVENTOEMISSOR: TStringField;
    DBlkTipoEvento: TwwDBLookupCombo;
    Label2: TLabel;
    LbLValor: TLabel;
    dbreValor: TDBRealEdit;
    DBData: TCMDateTimePicker;
    Label3: TLabel;
    QryTipoIndicador: TwwQuery;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label4: TLabel;
    QryRegras: TwwQuery;
    qryIDINSTFIN: TFloatField;
    qryNOME: TStringField;
    QryDetalheIDPARAMINSTFIN: TFloatField;
    QryDetalheIDINSTFIN: TFloatField;
    QryDetalheDATAREFPRINSTFIN: TDateTimeField;
    QryDetalheVLRPARAMINSTFIN: TFloatField;
    QryDetalheIDREGRAUSOINSTFIN: TFloatField;
    QryTipoIndicadorIDPARAMINSTFIN: TFloatField;
    QryTipoIndicadorDESCPARAMINSTFIN: TStringField;
    QryTipoIndicadorIDREGRA: TFloatField;
    QryDetalheDESCINDICADOR: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadValParamInstFin: TFrmCadValParamInstFin;

implementation

{$R *.DFM}
//-------------------------------------------------
// Mostra Formulario
procedure TFrmCadValParamInstFin.FormShow(Sender: TObject);
begin
  inherited;
// Abre Querys
  Qry.Open;
//  QryExibeDetalhe.Open;
  QryDetalhe.Open;
  QryTipoIndicador.Open;
  QryRegras.Open;
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
end;

procedure TFrmCadValParamInstFin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Querys
  QryDetalhe.Close;
  Qry.Close;
  QryTipoIndicador.Close;
  QryRegras.Close;
end;
//----------------------------------------------------------
// Fazer Procura
procedure TFrmCadValParamInstFin.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
// Volta da Procura e Seta Arquivo
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    Qry.Locate('IDINSTFIN',MontaSelect.ValoresChave[0],[]);
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
end;

//----------------------------------------------------------
// Ativa Formulario
procedure TFrmCadValParamInstFin.FormActivate(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;

end;

//----------------------------------------------------------
// Cancela Alteracao no Detalhe
procedure TFrmCadValParamInstFin.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//----------------------------------------------------------
// Volta a Alteracao no Detalhe
procedure TFrmCadValParamInstFin.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
// Reabre a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
end;

//----------------------------------------------------------
// Ok do Detalhe
procedure TFrmCadValParamInstFin.bbtnOkDetClick(Sender: TObject);
begin
// Critica Valores
  If (DBlkTipoEvento.Value='') Or (dbreValor.Text='') Or
     (DBData.Text='') Then Begin
    ShowMessage('Faltam Preencher Valores ....');
    DBlkTipoEvento.SetFocus;
    Exit;
  End;
// Caso esteja inserindo Acrecenta ID do Emissor
  If QryDetalhe.State = DsInsert Then Begin
    QryDetalhe.FieldByName('IDINSTFIN').AsInteger:=
      Qry.FieldByName('IDINSTFIN').AsInteger;
  End;
// Heranca
  inherited;

end;

//----------------------------------------------------------
// Excluir Detalhe
procedure TFrmCadValParamInstFin.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
// Abilita Botoes de Detalhe
  sbtnInsDet.Enabled   :=True;
  sbtnAltDet.Enabled   :=True;
  sbtnExcluiDet.Enabled:=True;
end;

end.
