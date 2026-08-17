(*******************************************************************************
Alteração:
   André Tavares - pendência 15365 - 21/05/2004 - Substituição da query que lista os
   centros de responsabilidade pelo método ListCentRespon da CmGlobalObj50 que já contempla
   as adapatações do de-para e alteração da query sqlRateios.

********************************************************************************
 25/01/2000 - 02.16.04
  Correção da alteração de centro de responsabilidade qdo o centro de responsabilidade
  de destino já existia no rateio do financeiro ou do capcar;
 10/04/2000 - 2.19.01
  Correção na rotina de Alteração de Centro de Responsabilidade para os documentos
  baixados num lote.

 21/10/2002
  Migração desta tela para o modelo 3 camadas - Fábio Barros
*******************************************************************************)

unit fAlteraCentResponMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Db, DBTables, Grids,
  Wwdbigrd, Wwdbgrid, Wwdatsrc, MontaSelect, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlCentRespon, uCtrlParamIntegra, uCtrlAlteraCentRespon,
  uctrlParamGlobal, uCtrlPadroes; // André Tavares - pendência 15365 - 21/05/2004

type
  TFrmAlteraCentResponMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SbtPesquisa: TSpeedButton;
    EdtDoc: TRealEdit;
    EdtCompl: TEdit;
    dblcOrigem: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    dblcDestino: TwwDBLookupCombo;
    Label1: TLabel;
    Panel2: TPanel;
    Pnldocpendentes: TPanel;
    wwDBGrid1: TwwDBGrid;
    DsRateios: TwwDataSource;
    MsDoc: TMontaSelect;
    Label2: TLabel;
    CmbTipoDesemb: TwwDBLookupCombo;
    sqlRateios: TCMSqlParams;
    cdsCentroRespon: TCMClientDataSet;
    cdsTipoDesemb: TCMClientDataSet;
    sqlTipoDesemb: TCMSqlParams;
    cdsRateios: TCMClientDataSet;
    sqlCentroRespon: TCMSqlParams;
    cdsParamGlobal: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure SbtPesquisaClick(Sender: TObject);
    procedure dblcOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    _CtrlAlteraCentRespon : TCtrlAlteraCentRespon;
//***
    _ctrlCentroRespon     : TCtrlCentRespon;
  public
    { Public declarations }
  end;

var
  FrmAlteraCentResponMT: TFrmAlteraCentResponMT;

implementation

{$R *.DFM}

Uses uSistema, uFuncaoGeral, uMensErro, uString, uDataBase, dBaseDados;

procedure TFrmAlteraCentResponMT.SbtPesquisaClick(Sender: TObject);
begin
  inherited;
  if MsDoc.Executar = MrOk then
  begin
    EdtDoc.Text   := MsDoc.ValoresChave[0];
    EdtCompl.Text := MsDoc.ValoresChave[1];
    if cdsRateios.Active then cdsRateios.Close;
    sqlRateios.Prepare;
    sqlRateios.ParamByName('IDPESSOA').AsFloat     := Sistema.IdEmpresa;
    sqlRateios.ParamByName('RECPAG').AsString      := ParamIntegra.RecPag;
    sqlRateios.ParamByName('CODDOCUMENTO').AsFloat := StrToFloat(MsDoc.ValoresChave[2]);
    sqlRateios.Open;

    sqlTipoDesemb.Prepare;
    sqlTipoDesemb.ParamByName('CODDOCUMENTO').AsInteger := cdsRateios.FieldByName('CODDOCUMENTO').AsInteger;
    sqlTipoDesemb.Open;
  end
  else
  begin
    EdtDoc.Text   := '';
    EdtCompl.Text := '';
  end;
end;

procedure TFrmAlteraCentResponMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _CtrlAlteraCentRespon.Free;
  _ctrlCentroRespon.Free;  
end;

procedure TFrmAlteraCentResponMT.FormCreate(Sender: TObject);
begin
  inherited;
  _CtrlAlteraCentRespon := TCtrlAlteraCentRespon.Create;
  _CtrlAlteraCentRespon.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  sqlRateios.Prepare;
  sqlRateios.ParamByName('IDPESSOA').AsInteger := -1;
  sqlRateios.ParamByName('CODDOCUMENTO').AsInteger := -1;
  sqlRateios.Open;
// -----------------------------------------------------------------------------

// início - André Tavares - pendência 15365 - 21/05/2004
  _ctrlCentroRespon := TCtrlCentRespon.Create;
  _ctrlCentroRespon.InitializeAS( Padroes );
   cdsCentroRespon.Data := _ctrlCentroRespon.ListaCentRespon(Sistema.idEmpresa, '', 1, '',
                                                             ParamIntegra.PlanoCentroRespon, false, true);

{
  sqlCentroRespon.Prepare;
  sqlCentroRespon.ParamByName('IDPESSOA').AsInteger := Sistema.IDEmpresa;
  sqlCentroRespon.Open;}
// fim - André Tavares - pendência 15365 - 21/05/2004

  sqlTipoDesemb.Prepare;
  sqlTipoDesemb.ParamByName('CODDOCUMENTO').AsInteger := cdsRateios.FieldByName('CODDOCUMENTO').AsInteger;
  sqlTipoDesemb.Open;
// -----------------------------------------------------------------------------

  MsDoc.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));

  if ParamIntegra.RecPag = 'R' then
  begin
    MsDoc.Colunas.Add('DOCUMENTO.NOSSONUMERO');
    MsDoc.Larguras.Add('20');
    MsDoc.Mascaras.Add('');
    MsDoc.Descricao.Add('Nosso Número');
    MsDoc.TipoDeDado.Add('C');
  end;
  MsDoc.Filtro.Add('DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = ' +
                   QuotedStr(ParamIntegra.RecPag) + ' AND NOT EXISTS (select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr(ParamIntegra.RecPag) +
                   ' and b.idusuario=' +
                   IntToStr(Sistema.IDUsuario) + ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = ' +
                   QuotedStr(ParamIntegra.RecPag) + ' and exists (select 1 from UsuarioxTpdocto b where recpag= ' + QuotedStr(ParamIntegra.RecPag) +
                   ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                   IntToStr(sistema.idusuario)+'))');

end;

procedure TFrmAlteraCentResponMT.dblcOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (not cdsRateios.IsEmpty) and
     (Trim(dblcOrigem.Text) <> '') and
     (Trim(CmbTipoDesemb.Text) <> '')
     then
//  VarArrayOf([Espaco(dblcOrigem.LookupValue,10),Espaco(CmbTipoDesemb.LookupValue,15)]),[]) Then
     if not cdsRateios.Locate('CODCENTRORESPON;CODTIPRECDES',
                              VarArrayOf([dblcOrigem.LookupValue,CmbTipoDesemb.LookupValue]),[]) Then
                               MsgDlg('Registro não consta no Rateio','Erro',mtError,[mbOk],0);
end;

procedure TFrmAlteraCentResponMT.bbtnConfirmarClick(Sender: TObject);
var OldDocumento : Integer;
begin
  inherited;
  OldDocumento := cdsRateios.FieldByName('CODDOCUMENTO').AsInteger;
  if _CtrlAlteraCentRespon.GravaAlteraCentRespon(Sistema.IDEmpresa, CmbTipoDesemb.LookupValue,
                                                 dblcOrigem.LookupValue, dblcDestino.LookupValue,
                                                 cdsRateios.Data) then
  begin
    MsgDlg('Centro de Responsabilidade alterado com sucesso','Aviso',mtInformation,[mbOk],0);
    sqlRateios.Prepare;
    sqlRateios.ParamByName('IDPESSOA').AsFloat     := Sistema.IdEmpresa;
    sqlRateios.ParamByName('RECPAG').AsString      := ParamIntegra.RecPag;
    sqlRateios.ParamByName('CODDOCUMENTO').AsFloat := OldDocumento;
    sqlRateios.Open;
  end
  else
    MsgDlg(_CtrlAlteraCentRespon.MessageInfo,'Erro',mtError,[mbOk],0);
end;

end.

// 30007 - Help Context anterior...
