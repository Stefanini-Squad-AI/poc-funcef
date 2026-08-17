{
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}

{--------------------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Data     : 14.08.2007
Pendência: 26047
Descrição: Alterei para que apenas os centros de responsabilidade pertencentes ao usuário
           sejam carrgado na lista de centros de responsabilidade.
----------------------------------------------------------------------------------------}


unit FMTEfetivCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, wwdblook, CMDBLookupCombo, Wwdatsrc, DBCtrls,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, DBClient,
  uCMClientDataSet, uCtrlCaixaPequeno,uCtrlListCAPCAR,uCtrlUnidNegocio,
  uCtrlCentroCusto,uCtrlCentRespon, TREdit;

type
  TFrmMTEfetivCaixaPeq = class(TfrmSairAjuda)
    BtnEfetiva: TBitBtn;
    Label1: TLabel;
    dblcCaixaPeq: TCMDBLookupCombo;
    dsLanc: TwwDataSource;
    edFavo: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dsTot: TwwDataSource;
    dsCxPeq: TwwDataSource;
    edDataEfet: TCMDateTimePicker;
    lblDataLanc: TLabel;
    barProc: TProgressBar;
    lbProc: TLabel;
    ToolbarSep971: TToolbarSep97;
    Label4: TLabel;
    memObs: TMemo;
    edRef: TEdit;
    Label5: TLabel;
    chkEncerra: TCheckBox;
    pgc: TPageControl;
    TabLanc: TTabSheet;
    TabEncerra: TTabSheet;
    Panel1: TPanel;
    Grdlanc: TwwDBGrid;
    Panel4: TPanel;
    Panel3: TPanel;
    memHist: TDBMemo;
    Panel2: TPanel;
    Label6: TLabel;
    dblcTipoDoc: TCMDBLookupCombo;
    Label7: TLabel;
    dblcForma: TCMDBLookupCombo;
    dblcTipRec: TCMDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    Label10: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    Label11: TLabel;
    dblcCCust: TwwDBLookupCombo;
    cdsCentroCusto: TCMClientDataSet;
    cdsTipoReceb: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    cdsTipoCobranca: TCMClientDataSet;
    cdsTipoDocRec: TCMClientDataSet;
    cdsCxPeq: TCMClientDataSet;
    cdsCliente: TCMClientDataSet;
    cdsFornecedor: TCMClientDataSet;
    cdsTot: TCMClientDataSet;
    cdsLanc: TCMClientDataSet;
    edValTot: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure dblcCaixaPeqCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnEfetivaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CaixaPequeno : TCtrlCaixaPequeno;
    ListCAPCAR   : TCtrlListCAPCAR;
    UnidNegocio  : TCtrlUnidNegocio;
    CentroCusto  : TCtrlCentroCusto;
    CentRespon   : TCtrlCentRespon;
    Procedure SelLanc( iIdCaixaPeq : LongInt);
    Function  BuscaCliente( n : LongInt ) : Boolean;
    Procedure Progresso(vParams : Array of Variant);
  public
    { Public declarations }
  end;

var
  FrmMTEfetivCaixaPeq : TFrmMTEfetivCaixaPeq;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uDatabase, dBaseDados,uCtrlParamIntegra,uModulo;

procedure TFrmMTEfetivCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  CaixaPequeno := TCtrlCaixaPequeno.Create;
  CaixaPequeno.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  ListCAPCAR := TCtrlListCAPCAR.Create;
  ListCAPCAR.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  CentRespon := TCtrlCentRespon.Create;
  CentRespon.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //
  CaixaPequeno.Progresso := Progresso;
  CaixaPequeno.CdsCaixaPequeno := cdsLanc;

  cdsTipoCobranca.Data := ListCAPCAR.ListaFormaRecPag('R',Sistema.idEmpresa);

  cdsTipoDocRec.Data   := ListCAPCAR.ListaTipoDoc('R',True);
  cdsTipoReceb.Data    := ListCAPCAR.ListaTipoRecebDesemb('R',Sistema.idEmpresa,tasSoAnalitica,tocpNome);
  cdsAtivProj.Data     := UnidNegocio.ListaUnidNegocio(Sistema.idEmpresa,0,'',tapSoAnaliticaAP,toapNome);
  cdsCentroCusto.Data  := CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,0,'',tccSoAnalitica,toccNome);

  cdsCentroRespon.Data := CentRespon.ListaCentResponAtrib_Usu(sistema.IdUsuario,
                                                              sistema.idEmpresa);

  cdsCxPeq.Data        := CaixaPequeno.ListaCaixaPequeno(Sistema.IdEmpresa,Sistema.IdUsuario,0,False);
  //
  SelLanc(-1);
  edDataEfet.Date := Date;
  lbProc.Visible  := False;
  barProc.Visible := False;
end;

Procedure TFrmMTEfetivCaixaPeq.SelLanc( iIdCaixaPeq : LongInt);
Begin
  //cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(iIdCaixaPeq,0);
  // Vander Campos - SOL: 172384/9603 - Nº KINTANA..: 1661662
  cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(iIdCaixaPeq,0, Modulo.iIdPlanoPrev, Modulo.iIdPatro);

  TFloatField(cdsLanc.FieldByName('VLRLANC')).DisplayFormat := '#,##0.00';
  cdsTot.Data := CaixaPequeno.ListaTotalLancCxPeq(iIdCaixaPeq,0);
  If iIdCaixaPeq > 0 Then
     Begin
        cdsFornecedor.Data := ListCapCar.ListaDadosForn(Sistema.idEmpresa,cdsCxPeq.FieldByName('IDFORCLI').asFloat);
     End;
End;

procedure TFrmMTEfetivCaixaPeq.dblcCaixaPeqCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
    Begin
        if (dblcCaixaPeq.Text) <> '' Then
           SelLanc( StrToInt(dblcCaixaPeq.LookupValue))
        Else
           SelLanc(-1);
    End;
end;

procedure TFrmMTEfetivCaixaPeq.BtnEfetivaClick(Sender: TObject);
begin
  inherited;
  If MsgDlg('Confirma a efetivação','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
     Begin
        If MsgDlg('Confirma efetivação do bordero','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
          Begin
             If ((chkEncerra.Checked) And (MsgDlg('Confirma o Encerramento do Caixa pequeno','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes)) or ((not chkEncerra.Checked)) Then
                Begin
                   if Trim(dblcCaixaPeq.Text) ='' Then
                     Begin
                         MsgDlg('Caixa pequeno não selecionado','Erro',mtError,[mbOk],0);
                         dblcCaixaPeq.SetFocus;
                     End
                   Else
                   If Trim(edDataEfet.Text) = '' then
                     Begin
                        MsgDlg('Obrigatório preencher a data de efetivação','Erro',mtError,[mbOk],0);
                        edDataEfet.SetFocus;
                     end
                   Else
                   If edDataEfet.Date > Date then
                      Begin
                         MsgDlg('Data não pode ser maior que hoje','Erro',mtError,[mbOk],0);
                         edDataEfet.SetFocus;
                     end
                   Else
                   if cdsLanc.IsEmpty Then
                     Begin
                        MsgDlg('Não há lançamento para efetivar','Erro',mtError,[mbOk],0);
                        dblcCaixaPeq.SetFocus;
                     End
                   Else
                   If (chkEncerra.Checked) Then
                      Begin
                         if (not BuscaCliente(cdsCxPeq.FieldByName('IDFORCLI').AsInteger) ) Then
                           Begin
                              MsgDlg('o Fornecedor Não é um cliente, Para  que se possa encerrar o caixa pequeno','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcCaixaPeq.SetFocus;
                              exit;
                           End;
                         if Trim(dblcTipoDoc.Text) ='' Then
                           Begin
                              MsgDlg('Tipo de Documento não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcTipoDoc.SetFocus;
                              exit;
                           End;
                         if Trim(dblcForma.Text) ='' Then
                           Begin
                              MsgDlg('Tipo de Cobrança','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcForma.SetFocus;
                              exit;
                           End;
                         if Trim(dblcTipRec.Text) ='' Then
                           Begin
                              MsgDlg('Tipo de Recebimento não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcTipRec.SetFocus;
                              exit;
                           End;
                         if Trim(dblcCentRespon.Text) ='' Then
                           Begin
                              MsgDlg('Centro de Responsabilidade não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcCentRespon.SetFocus;
                              exit;
                           End;
                         if Trim(dblcAtiv.Text) ='' Then
                           Begin
                              MsgDlg('Atividade/Projeto não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcAtiv.SetFocus;
                              exit;
                           End;
                         if Trim(dblcCCust.Text) ='' Then
                           Begin
                              MsgDlg('Centro de Custo não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcCCust.SetFocus;
                              exit;
                           End;
                      End;
                   lbProc.Visible   := True;
                   barProc.Visible  := True;
                   Application.ProcessMessages;
                   //CaixaPequeno.CreateThreadProgresso;
                   if not CaixaPequeno.EfetivaCaixaPequeno(CaixaPequeno.ProgressFileName,edDataEfet.Text,
                            dblcTipRec.LookUpValue,dblcCCust.LookUpValue,dblcCentRespon.LookUpValue,edRef.Text,
                            memObs.Text,StrToIntDef(dblcCaixaPeq.LookupValue,0),StrToIntDef(dblcTipoDoc.LookupValue,0),
                            StrToIntDef(dblcForma.LookupValue,0),StrToIntDef(dblcAtiv.LookupValue,0),ParamIntegra.uNidNegoc,
                            Sistema.idUsuario,Sistema.idEmpresa,Sistema.IdEspAcesso,
                            Modulo.iIdPlanoPrev,Modulo.iIdPatro,Sistema.idModulo,
                            cdsCxPeq.FieldByName('IDFORCLI').asFloat,
                            cdsCxPeq.FieldByName('VLRTOTCAIXAPEQ').asFloat,
                            cdsTot.FieldByName('TOTAL').asFloat,
                            chkEncerra.Checked,Sistema.UsaPlanoPatro,ParamIntegra.IntegraContab) then
                   begin
                      //CaixaPequeno.FreeThreadProgresso;
                      MsgDlg('Efetivação não efetuada. '+CaixaPequeno.MessageInfo,'Erro',mtError,[mbOk],0);
                   end else begin
                      //CaixaPequeno.FreeThreadProgresso;
                      MsgDlg(CaixaPequeno.MessageInfo,'Aviso',mtWarning,[mbOk],0);
                      dblcCaixaPeq.SetFocus;
                   end;
                   lbProc.Visible   := False;
                   barProc.Visible  := False;
                   SelLanc(StrToInt(dblcCaixaPeq.LookupValue));
                End;
          End;
     End;
end;

procedure TFrmMTEfetivCaixaPeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CaixaPequeno.Free;
  ListCAPCAR.Free;
  UnidNegocio.Free;
  CentroCusto.Free;
  CentRespon.Free;
end;

function TFrmMTEfetivCaixaPeq.BuscaCliente(n: Integer): Boolean;
begin
   cdsCliente.Data := ListCapCAr.ListaDadosCliente(Sistema.idEmpresa,n,'',False);
   Result:= Not cdsCliente.IsEmpty;
end;

procedure TFrmMTEfetivCaixaPeq.Progresso(vParams: array of Variant);
begin
   Try
     barProc.Max      := vParams[1];
     barProc.Position := vParams[2];
   finally
     Repaint;
   End;
end;

end.

