unit fMTCadConjunto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  DBTables, Wwquery, uCMTreeViewMT, wwdbdatetimepicker, CMDateTimePicker,
  TREdit, uCtrlConjunto, uCtrlLocalizacoes, uCtrlResponsavel, uCtrlCentroCusto;

type
  TfrmMTCadConjunto = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    dsLocal: TwwDataSource;
    MSLocal: TMontaSelect;
    dsResp: TwwDataSource;
    MSResponsavel: TMontaSelect;
    Label1: TLabel;
    dbeDescConjunto: TDBMemo;
    RgAlugado: TDBRadioGroup;
    Label2: TLabel;
    dbeLocalizacao: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    dbeResponsavel: TwwDBEdit;
    Label4: TLabel;
    bbtnSelResp: TBitBtn;
    Label13: TLabel;
    dbeCentroCusto: TwwDBEdit;
    bbtnTreeCcusto: TBitBtn;
    dbeParticipacao: TDBRealEdit;
    Label14: TLabel;
    Label7: TLabel;
    dbeDataInicio: TCMDateTimePicker;
    Label5: TLabel;
    cdsLocal: TCMClientDataSet;
    cdsResp: TCMClientDataSet;
    dsCentroCusto: TwwDataSource;
    cdsCentroCusto: TCMClientDataSet;
    treeCentroCusto: TCMTreeViewMT;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnTreeCcustoClick(Sender: TObject);
    procedure treeCentroCustoDblClick(Sender: TObject);
    procedure treeCentroCustoExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
  private
    { Private declarations }
    Conjunto    : TCtrlConjunto;
    Localizacao : TCtrlLocalizacoes;
    Responsavel : TCtrlResponsavel;
    CentroCusto : TCtrlCentroCusto;
    procedure SelConjunto(fIdPessoa, fIdConjunto : Extended);
    procedure SetUltConjunto(fIdPessoa, fIdConjunto : Extended);
  public
    fUltIdPessoa,
    fUltIdConjunto : Extended;
    { Public declarations }
  end;

var
  frmMTCadConjunto: TfrmMTCadConjunto;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uIntegraBack;

procedure TfrmMTCadConjunto.FormCreate(Sender: TObject);
begin
   inherited;
   Conjunto := TCtrlConjunto.Create;
   Conjunto.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   Conjunto.cds             := cds;
   Conjunto.cdsRateioCustos := cdsDet;
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   //-------------------------------------------------------------------------------------
   CentroCusto := TCtrlCentroCusto.Create;
   CentroCusto.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   treeCentroCusto.Mascara := IntegraBack.MascaraCC;
   cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,1);
   treeCentroCusto.MontaArvore;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CONJUNTO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   SelConjunto(Sistema.IdEmpresa,0);
   SetUltConjunto(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TFrmMTCadConjunto.SelConjunto(fIdPessoa, fIdConjunto : Extended);
begin
   cds.Data := Conjunto.ListaConjunto(fIdPessoa,fIdConjunto);
   if not cds.IsEmpty then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(cds.FieldByName('IDPESSOA').AsFloat,
                                                    cds.FieldByName('IDLOCALIZACAO').AsFloat);
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      cdsDet.Data := Conjunto.ListaRateioCustos(cds.FieldByName('IDPESSOA').AsFloat,
                                                cds.FieldByName('IDCONJUNTO').AsFloat);
   end else
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa,0);
      cdsResp.Data := Responsavel.ListaResponsavel(0);
      cdsDet.Data := Conjunto.ListaRateioCustos(Sistema.IdEmpresa,0);
   end;
   TFloatField(cdsDet.FieldByName('CODCENTROCUSTO')).EditMask := IntegraBack.MascaraCC + ';0;_';
end;
//========================================================================================
procedure TFrmMTCadConjunto.SetUltConjunto(fIdPessoa, fIdConjunto : Extended);
begin
   fUltIdPessoa   := fIdPessoa;
   fUltIdConjunto := fIdConjunto;
end;
//========================================================================================
procedure TfrmMTCadConjunto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Conjunto.Free;
   Localizacao.Free;
   Responsavel.Free;
   CentroCusto.Free;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Conjunto.AplicaOperacao('S');
   SetUltConjunto(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Conjunto.AplicaOperacao('E');
   SetUltConjunto(Sistema.IdEmpresa, strtofloat(Conjunto.MessageInfo));
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Conjunto.AplicaOperacao('E');
   SetUltConjunto(Sistema.IdEmpresa, strtofloat(Conjunto.MessageInfo));
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(Conjunto.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelConjunto(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
      SetUltConjunto(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
   end;   
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroInsert(Sender: TObject);
begin
   SelConjunto(Sistema.IdEmpresa,0);
   inherited;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroDelete(Sender: TObject);
begin
   if not Conjunto.BensnoConjunto(cds.FieldByName('IDCONJUNTO').AsFloat,
                                  cds.FieldByName('IDPESSOA').AsFloat) then
   begin
      cdsDet.First;
      while not cdsDet.EOF do
         cdsDet.Delete;
      inherited;
   end else
   begin
      MsgDlg(Conjunto.MessageInfo,'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmMTCadConjunto.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(StrToFloat(MSLocal.ValoresChave[1]),
                                                    StrToFloat(MSLocal.ValoresChave[0]));
      if cds.FieldByName('IDRESPONSAVEL').IsNull then
      begin
         cdsResp.Data := Responsavel.ListaResponsavel(cdsLocal.FieldByName('IDRESPONSAVEL').AsFloat);
      end else
      begin
         cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      end;
      cds.FieldbyName('IDLOCALIZACAO').AsFloat := cdsLocal.FieldbyName('IDLOCALIZACAO').AsFloat;
      cds.FieldbyName('IDPESSOA').AsFloat      := cdsLocal.FieldbyName('IDPESSOA').AsFloat;
      cds.FieldbyName('IDRESPONSAVEL').AsFloat := cdsLocal.FieldbyName('IDRESPONSAVEL').AsFloat;
   end;
end;
//========================================================================================
procedure TfrmMTCadConjunto.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResponsavel.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResponsavel.RetornouValor then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(StrToFloat(MSLocal.ValoresChave[0]));
      cds.FieldbyName('IDRESPONSAVEL').AsFloat := cdsResp.FieldbyName('IDRESPONSAVEL').AsFloat;
   end else
   if not cds.FieldByName('IDRESPONSAVEL').IsNull then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      cds.FieldbyName('IDRESPONSAVEL').AsFloat := cdsResp.FieldbyName('IDRESPONSAVEL').AsFloat;
   end else
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(0);
      cds.FieldbyName('IDRESPONSAVEL').Clear;
   end;
end;
//========================================================================================
procedure TfrmMTCadConjunto.bbtnTreeCcustoClick(Sender: TObject);
begin
   inherited;
   treeCentroCusto.Visible := not treeCentroCusto.Visible;
   if treeCentroCusto.Visible then
      treeCentroCusto.SetFocus;
end;
//========================================================================================
procedure TfrmMTCadConjunto.treeCentroCustoDblClick(Sender: TObject);
begin
   inherited;
   if cdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString = 'A' then
   begin
      treeCentroCusto.Visible := False;
      dbeCentroCusto.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTCadConjunto.treeCentroCustoExit(Sender: TObject);
begin
   inherited;
   TreeCentroCusto.Visible := False;
   cdsDet.FieldByName('CODCENTROCUSTO').AsString := cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
   cdsDet.FieldByName('IDEMPRESA').AsInteger     := cdsCentroCusto.FieldByName('IDEMPRESA').AsInteger;
   cdsDet.FieldByName('DESCCCUSTO').Text         := cdsCentroCusto.FieldByName('NOME').AsString;
   cdsDet.FieldByName('DTAFIM').Clear;
   dbeCentroCusto.SetFocus;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if cdsDet.State in [dsInsert,dsEdit] then
      begin
         if (trim(dbeCentroCusto.Text) = '') Then
         begin
            MsgDlg('Centro de Custo não foi Selecionado','Erro',mtError,[mbOK],0);
            bbtnTreeCCusto.SetFocus;
            exit;
         end else
         if (dbeParticipacao.Value = 0) then
         begin
            MsgDlg('Percentual não foi preenchido','Erro',mtError,[mbOK],0);
            dbeParticipacao.SetFocus;
            exit;
         end else
         if (dbeDataInicio.Text = '') then
         begin
            MsgDlg('Data de Inclusao não foi preenchida','Erro',mtError,[mbOK],0);
            dbeDataInicio.SetFocus;
            exit;
         end;
      end;
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
var
   fTotPerc : Double;

begin
   Accept := False;
   if (trim(dbeDescConjunto.Text) = '') then
   begin
      MsgDlg('Descrição do conjunto não foi preenchida','Erro',mtError,[mbOK],0);
      dbeDescConjunto.SetFocus;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeLocalizacao.Text) = '') then
   begin
       MsgDlg('Localização não foi preenchida','Erro',mtError,[mbOK],0);
       dbeLocalizacao.SetFocus;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeResponsavel.Text) = '') then
   begin
       MsgDlg('Responsável não foi preenchido','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
   end else
   //-------------------------------------------------------------------------------------
   begin
      fTotPerc := 0;
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         fTotPerc := fTotPerc + cdsDet.FieldByName('PARTICIPACAO').asFloat;
         cdsDet.Next;
      end;
      if (fTotperc <> 100) then
      begin
         MsgDlg('Soma dos Rateios de Custo está em ' + FloatToStr(fTotPerc) +
                '% e deve ser 100% ','Erro',mtError,[mbOK],0);
      end;
   end;
   Accept := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelConjunto(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelConjunto(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.dbgrdDetDblClick(Sender: TObject);
begin
   //inherited;
end;

end.
