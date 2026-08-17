{--------------------------------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Pendência: 26538
Descrição: permite que a criação do processo RAD para documentos com valor negativo.
---------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Pendência: 26278
Descrição: Alteração. Nas condições de destacamento, é utilizado o centro de responsabilidade
           ao invés de centro de custo.
           Esta alteração é somente para referências 32 e 33:
              . Solicitação de Destacamento de viagem (ida)
              . Solicitação de Destacamento de viagem (volta)
--------------------------------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Pendência: 25420
Descrição: Implementada a referência-RAD para o sistema de Cotas Patrimoniais.
--------------------------------------------------------------------------------------------------}

unit fGeraProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, DBTables, MontaSelect,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, TREdit, CMProcura, DBClient, Db,
  CMProcuraSubTipo, uCMClientDataSet, uCmSqlParams, uCtrlRad, uCmTypes,
  uCtrlParamIntegra, uCtrlRadTipoProc, uCtrlRADPlus, uRADDataHora;

type
  TfrmGeraProcesso = class(TfrmSairAjuda)
    btnExecutar: TBitBtn;
    dblcProc: TCMDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    MemObs: TMemo;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dblcGrpProd: TCMDBLookupCombo;
    dblcCentResp: TCMDBLookupCombo;
    dblcCentCust: TCMDBLookupCombo;
    dblcUnNegoc: TCMDBLookupCombo;
    Label8: TLabel;
    Label5: TLabel;
    edValor: TRealEdit;
    ToolbarSep971: TToolbarSep97;
    SqlUnNegoc: TCMSqlParams;
    CdsUnNegoc: TCMClientDataSet;
    SqlProc: TCMSqlParams;
    CdsProc: TCMClientDataSet;
    CdsCentRespon: TCMClientDataSet;
    SqlCentRespon: TCMSqlParams;
    SqlGrpProc: TCMSqlParams;
    CdsGrpProc: TCMClientDataSet;
    SqlCentCust: TCMSqlParams;
    CdsCentCust: TCMClientDataSet;
    SqlGrpProd: TCMSqlParams;
    CdsGrpProd: TCMClientDataSet;
    Label3: TLabel;
    dblcTipDoc: TCMDBLookupCombo;
    cdsTipDoc: TCMClientDataSet;
    SqlTipDoc: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcProcCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcProcExit(Sender: TObject);
  private
    { Private declarations }
    Procedure SelProc;
  public
    { Public declarations }
    rad: TCtrlRad;

    RADPlus : TCtrlRADPlus;

    procedure MsgErro( sMsg : string );
  end;

var
  frmGeraProcesso: TfrmGeraProcesso;

implementation

{$R *.DFM}

Uses uSistema, uDataBase, DBasedados, uMensErro;

Procedure TfrmGeraProcesso.SelProc;
var
  iRadRef : integer;
Begin
  dblcCentCust.Enabled := False;
  dblcCentResp.Enabled := False;
  dblcGrpProd.Enabled  := False;
  dblcUnNegoc.Enabled  := False;
  edValor.Enabled      := False;
  btnExecutar.Enabled  := False;
  dblcTipDoc.Enabled   := False;

  if dblcProc.Text = '' then
    exit;

  iRadRef := CdsProc.FieldByName( 'IDREFERENCIA' ).AsInteger;

  dblcCentCust.Enabled := RADReferencia( iRadRef, rrSolicCompra   ) or
                          RADReferencia( iRadRef, rrReqMaterial   ) or
                          RADReferencia( iRadRef, rrDestacaViagem ) or
                          ( iRadRef = 0                           ) ;

  dblcCentResp.Enabled := RADReferencia( iRadRef, rrSolicCompra ) or
                          RADReferencia( iRadRef, rrDoc         ) or
                          //amf 26278 05.09.2007
                          RADReferencia( iRadRef, rrDestacaViagem ) or
                          ( iRadRef = 0                            ) ;

  dblcGrpProd.Enabled  := RADReferencia( iRadRef, rrSolicCompra ) or
                          RADReferencia( iRadRef, rrReqMaterial ) or
                          RADReferencia( iRadRef, rrOrdemCompra ) or
                          RADReferencia( iRadRef, rrCotacao     ) or
                          ( iRadRef = 0                         ) ;

  dblcUnNegoc.Enabled  := RADReferencia( iRadRef, rrSolicCompra ) or
                          RADReferencia( iRadRef, rrReqMaterial ) or
                          ( iRadRef = 0                         ) ;

  dblcTipDoc.Enabled   := RADReferencia( iRadRef, rrDoc         ) or
                          ( iRadRef = 0                         ) ;

  edValor.Enabled      := RADReferencia( iRadRef, rrSolicCompra   ) or
                          RADReferencia( iRadRef, rrDoc           ) or
                          RADReferencia( iRadRef, rrOrdemCompra   ) or
                          RADReferencia( iRadRef, rrPagtoLote     ) or
                          RADReferencia( iRadRef, rrReqMaterial   ) or
                          RADReferencia( iRadRef, rrDestacaViagem ) or
                          RADReferencia( iRadRef, rrCotasPatrim   ) or //amf 23.05.2007 25420
                          ( iRadRef = 0                           ) ;

  btnExecutar.Enabled  := True;
End;


procedure TfrmGeraProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  RADPlus := TCtrlRADPlus.Create;
  RADPlus.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      MsgErro );

  Rad := TCtrlRad.Create;
  Rad.InitializeAs( RADPlus );

  if ParamIntegra = nil then
    ParamIntegra.GetParams( Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP );                  

  CdsCentCust.Close;
  SqlCentCust.Prepare;
  SqlCentCust.ParamByName( 'IDPLANCENTCUST' ).AsInteger := ParamIntegra.PlanoCentroCusto;
  SqlCentCust.Open;

  CdsCentRespon.Close;
  SqlCentRespon.Prepare;
  SqlCentRespon.ParamByName( 'IDPLANCRESPON' ).AsInteger := ParamIntegra.PlanoCentroRespon;
  SqlCentRespon.Open;

  CdsUnNegoc.Close;
  SqlUnNegoc.Prepare;
  SqlUnNegoc.Open;

  SqlGrpProd.Open;
  SqlGrpProc.Open;

  CdsProc.Close;
  SqlProc.Open;

  cdsTipDoc.Close;
  SqlTipDoc.Open;
end;


procedure TfrmGeraProcesso.btnExecutarClick(Sender: TObject);
Var
  iRadRef, iNumProc: LongInt;
begin
  inherited;

  if trim( dblcProc.Text ) = '' Then
  Begin
    MsgDlg( 'Selecione o tipo de processo.', 'Erro', mtError, [mbOK], 0 );
    dblcProc.setFocus;
    exit;
  end;

  if Sistema.VersaoRAD = '+' then
  begin

    RADPlus.InicializaPropriedades;
    RADPlus.TipoProcesso    := StrToInt( dblcProc.LookupValue );
    RADPlus.IdEmpresa       := Sistema.IdEmpresa;
    RADPlus.IdUsuario       := Sistema.IdUsuario;
    RADPlus.OBS             := MemOBS.Text;

    iRadRef := CdsProc.FieldByName( 'IDREFERENCIA' ).AsInteger;

    if ( RADReferencia( iRadRef, rrSolicCompra   ) or
         RADReferencia( iRadRef, rrReqMaterial   ) or
         RADReferencia( iRadRef, rrDestacaViagem ) or
       ( iRadRef = 0                           ) ) and
       ( dblcCentCust.Text <> ''                 ) then
      RADPlus.CodCentroCusto := dblcCentCust.LookupValue;

    if ( RADReferencia( iRadRef, rrSolicCompra ) or
         RADReferencia( iRadRef, rrDoc         ) or
         RADReferencia( iRadRef, rrDestacaViagem ) or
       ( iRadRef = 0                         ) ) and
       ( dblcCentResp.Text <> ''               ) then
      RADPlus.CodCentroRespon := dblcCentResp.LookupValue;

    if ( RADReferencia( iRadRef, rrSolicCompra ) or
         RADReferencia( iRadRef, rrReqMaterial ) or
         RADReferencia( iRadRef, rrOrdemCompra ) or
         RADReferencia( iRadRef, rrCotacao     ) or
       ( iRadRef = 0                         ) ) and
       ( dblcGrpProd.Text <> ''                ) then
      RADPlus.CodGrupoProd := dblcGrpProd.LookupValue;

    if ( RADReferencia( iRadRef, rrSolicCompra ) or
         RADReferencia( iRadRef, rrReqMaterial ) or
       ( iRadRef = 0                         ) ) and
       ( dblcUnNegoc.Text <> ''                ) then
      RADPlus.UnidNegoc := StrToIntDef( dblcUnNegoc.LookupValue, 0 );

    if ( RADReferencia( iRadRef, rrDoc         ) or
       ( iRadRef = 0                         ) ) and
       ( dblcTipDoc.Text <> '' ) then
      RADPlus.CodTipDoc := StrToIntDef( dblcTipDoc.LookupValue, 0 );

    if ( RADReferencia( iRadRef, rrSolicCompra   ) or
         RADReferencia( iRadRef, rrDoc           ) or
         RADReferencia( iRadRef, rrOrdemCompra   ) or
         RADReferencia( iRadRef, rrPagtoLote     ) or
         RADReferencia( iRadRef, rrReqMaterial   ) or
         RADReferencia( iRadRef, rrDestacaViagem ) or
         RADReferencia( iRadRef, rrCotasPatrim   ) or //amf 23.05.2007 25420
       ( iRadRef = 0                           ) ) and
       ( edValor.Value <> 0                      ) then
      RADPlus.VlrProc := edValor.Value;

    iNumProc := RadPlus.IniciarProcesso;

  end
  else
  begin
    Rad.TipoProcesso := StrToInt( dblcProc.LookupValue );
    Rad.IdPessoa     := Sistema.IdEmpresa;
    Rad.IdUsuario    := Sistema.IdUsuario;
    Rad.OBS          := MemOBS.Text;

    Rad.IdPessResp := Sistema.IdUsuario;

    If Trim( dblcCentCust.Text ) <> '' Then Begin
        Rad.CodCentroCusto := dblcCentCust.LookupValue;
        Rad.IdEmpresa      := Sistema.IdEmpresa;
    End;

    If Trim( dblcCentResp.Text ) <> '' Then
       Rad.CodCentroRespon := dblcCentResp.LookupValue;

    If Trim( dblcGrpProd.Text ) <> '' Then
       Rad.CodGrupoProd := dblcGrpProd.LookupValue;

    If Trim( dblcUnNegoc.Text ) <> '' Then
       Rad.UnidNegoc := StrToInt( dblcUnNegoc.LookupValue );

//amf 26538 09.10.2007   If edValor.Value > 0 Then
    If edValor.Value <> 0 Then
       Rad.Valor := edValor.Value;

    iNumProc := Rad.IniciarProcesso;

  end;

  if iNumProc <= 0 Then
  begin
    MsgDlg( 'Processo não gerado.', 'Erro', mtError, [mbOK], 0 );
    Exit;
  end
  else
    MsgDlg( 'Processo nº. ' + IntToStr( iNumProc ) + ' gerado com sucesso.', 'Information', mtInformation, [mbOK], 0 );

end;

procedure TfrmGeraProcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  RADPlus.Free;
  Rad.Free;
end;

procedure TfrmGeraProcesso.dblcProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelProc;
end;

procedure TfrmGeraProcesso.dblcProcExit(Sender: TObject);
begin
  inherited;
  SelProc;
end;

procedure TfrmGeraProcesso.MsgErro(sMsg: string);
begin
  MsgDlg( sMsg, 'Erro', mtError, [mbOK], 0 );
end;

end.
