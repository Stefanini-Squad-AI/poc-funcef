// Alterado por: Andre Tavares - Pendência 16977 - 29/09/2004 - Trazer no combo
//               Centro de responsabilidade, somente os que estiverem relacionados ao usuário.


unit FMTGeraSCIAuto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, fcLabel, Db,
  DBTables, Wwquery, wwdblook, TREdit, ComCtrls, Wwdatsrc, MontaSelect,
  DBClient, uCMClientDataSet, uCtrlGeraSCIAuto, uCtrlUnidNegocio, uCtrlCentRespon,
  uCtrlParamIntegra, uCmSqlParams;

type
  TFrmMTGeraSCIAuto = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    pln: TPanel;
    plnSCI: TPanel;
    plnReq: TPanel;
    plnlbReq: TPanel;
    fcLabel1: TfcLabel;
    GrdReq: TwwDBGrid;
    plnItem: TPanel;
    plnLbItem: TPanel;
    fcLabel2: TfcLabel;
    Splitter1: TSplitter;
    Label6: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    Label7: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    GpDotOrc: TGroupBox;
    btnOrcamento: TSpeedButton;
    ReResOrc: TRealEdit;
    btnGerar: TBitBtn;
    BtnPreview: TBitBtn;
    pgBar: TProgressBar;
    LbPreview: TLabel;
    dsSCI: TwwDataSource;
    dsItem: TwwDataSource;
    GrdItem: TwwDBGrid;
    MsResORc: TMontaSelect;
    CdsUnidNegoc: TCMClientDataSet;
    CdsCRespon: TCMClientDataSet;
    CdsSCI: TCMClientDataSet;
    CdsItem: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure BtnPreviewClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure CdsSCIAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    GeraSCIAuto  : TCtrlGeraSCIAuto;
    UnidNegocio  : TCtrlUnidNegocio;
    CentRespon   : TCtrlCentRespon;
    CtrlParamIntegra : TCtrlParamIntegra;

    Procedure Progresso(Args : Array of Variant );

    Procedure Preview;
    Procedure Detalhe( n : LongInt);

  public
    { Public declarations }
  end;

var
  FrmMTGeraSCIAuto: TFrmMTGeraSCIAuto;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, uFuncaoGeral, uDataBase, dBaseDados,
     uIntegraback, uModulo;

Procedure TFrmMTGeraSCIAuto.Preview;
Begin
  CdsSCI.DisableControls;
  CdsItem.DisableControls;
  LbPreview.Visible := True;
  pgBar.Visible     := True;
  Try
     GeraSCIAuto.CreateThreadProgresso;

     If Not GeraSCIAuto.PreviewSCI(Sistema.IdEmpresa,GeraSCIAuto.ProgressFileName) Then
        Begin
           GeraSCIAuto.FreeThreadProgresso;
           MsgDlg(GeraSCIAuto.MessageInfo,'Erro',mtError,[mbOk],0)
        End
     Else
        Begin
           GeraSCIAuto.FreeThreadProgresso;
           MsgDlg(GeraSCIAuto.MessageInfo,'Informação',mtInformation,[mbOk],0);
        End;
  Finally
     LbPreview.Visible := False;
     pgBar.Visible     := False;
     CdsSCI.First;
     CdsSCI.EnableControls;
     CdsItem.EnableControls;
     Detalhe( CdsSCI.FieldByName('NUMSOLCOMPRA').AsInteger );
  End;
End;


procedure TFrmMTGeraSCIAuto.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamIntegra := TCtrlParamIntegra.Create;
  CtrlParamIntegra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiCAP);

  GeraSCIAuto := TCtrlGeraSCIAuto.Create;
  GeraSCIAuto.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  GeraSCIAuto.Progresso := Progresso;
  GeraSCIAuto.Cds     := CdsSCI;
  GeraSCIAuto.CdsItem := CdsItem;

  CdsSCI.Data  := GeraSCIAuto.ListSCI;
  CdsItem.Data :=  GeraSCIAuto.ListItemSCI;

  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs(GeraSCIAuto);

  CentRespon := TCtrlCentRespon.Create;
  CentRespon.InitializeAs(GeraSCIAuto);

  CdsCRespon.Data := CentRespon.ListaCentResponAtrib_Usu(sistema.idusuario, sistema.idempresa, tcrAmbos, CtrlParamIntegra.PlanoCentroRespon);
  CdsUnidNegoc.Data  := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);

  If GpDotOrc.Enabled Then
     MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  //
  GpDotOrc.Enabled := (IntegraBack.IntegraOrcamento = 'S');

end;


Procedure TFrmMTGeraSCIAuto.Detalhe( n : LongInt);
Begin
   CdsItem.Filtered := False;
   CdsItem.Filter   := 'NUMSOLCOMPRA = '+IntToStr( n );
   CdsItem.Filtered := True;
End;


procedure TFrmMTGeraSCIAuto.BtnPreviewClick(Sender: TObject);
begin
  inherited;
  Preview;
end;

procedure TFrmMTGeraSCIAuto.btnGerarClick(Sender: TObject);
begin
  inherited;
  If trim(dblcCentRespon.Text ) = '' Then
     Begin
        MsgDlg('Centro de responsabilidade não foi preenchido','Erro',mtError,[mbOk],0);
        dblcCentRespon.SetFocus;
     End
  Else
  If trim(dblcAtiv.Text ) = '' Then
     Begin
        MsgDlg('Atividade e projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
     End
  Else
  If (GpDotOrc.Enabled) and (ReResOrc.Value > 0) Then
     Begin
        MsgDlg('Reserva orçamentária não foi preenchido','Erro',mtError,[mbOk],0);
        ReResOrc.SetFocus;
     End
  Else
  If CdsSCI.IsEmpty Then
     Begin
        MsgDlg('Não foi gerado nenhum preview ','Erro',mtError,[mbOk],0);
     End
  Else
    Begin
       If Not GeraSCIAuto.GerarSCI(Sistema.IdEmpresa,
                                   Sistema.IdUsuario,
                                   CdsSCI.FieldbyName('CODALMOXARIFADO').AsInteger,
                                   StrToIntDef(dblcAtiv.LookupValue ,-1),
                                   CdsSCI.FieldbyName('NUMREQUISICAO').AsFloat,
                                   dblcCentRespon.LookupValue,
                                   CdsSCI.FieldbyName('CODCENTROCUSTO').AsString,
                                   Trunc(ReResOrc.Value))
       Then
          Begin
             MsgDlg(GeraSCIAuto.MessageInfo,'Erro',mtError,[mbOk],0)
          End
       Else
          Begin
             MsgDlg(GeraSCIAuto.MessageInfo,'Informação',mtInformation,[mbOk],0);
             CdsSCI.Delete;
          End;
    End;
end;

procedure TFrmMTGeraSCIAuto.btnOrcamentoClick(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  If  MsResORc.RetornouValor Then
     Begin
        ReResOrc.Value := StrToInt(MsResORc.ValoresChave[1]);
     End;
end;

procedure TFrmMTGeraSCIAuto.Progresso(Args: array of Variant);
begin
   pgBar.Max         := Args[1];
   pgBar.Position    := Args[2];
   LbPreview.Caption := Args[3];

   Self.Repaint;

end;

procedure TFrmMTGeraSCIAuto.CdsSCIAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If (CdsSCI.State = dsBrowse) Then
      Detalhe( CdsSCI.FieldByName('NUMSOLCOMPRA').AsInteger );
end;

procedure TFrmMTGeraSCIAuto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlParamIntegra.Free;
  UnidNegocio.Free;
  CentRespon.Free;
  GeraSCIAuto.Free;
end;

end.
