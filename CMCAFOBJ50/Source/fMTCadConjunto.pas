{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SOL         : 200681
Kintana     : 1939514
Responsável : Marcio Sanches Spinosa SOL 200681 Kintana 1939514
Data        : 15/02/2013
Descrição   : Ajuste para quando for alterar ou inserir, aceitar 02 casas decimais
no rateio e validar corretamente o 100%.
--------------------------------------------------------------------------------
Pendências  : 23854
Responsável : Gustavo Mendes
Data        : 29/10/2007
Descrição   : Na consulta de bens para um conjunto foi alterado a mensagem de
              retorno.
--------------------------------------------------------------------------------}

unit fMTCadConjunto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls,
  DBTables, Wwquery, uCMTreeViewMT, wwdbdatetimepicker, CMDateTimePicker,
  TREdit, uCtrlConjunto, uCtrlLocalizacoes, uCtrlResponsavel, uCtrlPadroes,
  uCmSqlParams;

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
    bbtnSelCCusto: TBitBtn;
    dbeParticipacao: TDBRealEdit;
    Label14: TLabel;
    Label7: TLabel;
    dbeDataInicio: TCMDateTimePicker;
    Label5: TLabel;
    cdsLocal: TCMClientDataSet;
    cdsResp: TCMClientDataSet;
    MSCentroCusto: TMontaSelect;
    Label3: TLabel;
    dbeDescCCusto: TwwDBEdit;
    dbrgInativo: TDBRadioGroup;
    CMSqlParams1: TCMSqlParams;
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
    procedure bbtnSelCCustoClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Conjunto    : TCtrlConjunto;
    Localizacao : TCtrlLocalizacoes;
    Responsavel : TCtrlResponsavel;
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

Uses uMensErro, uSistema, uCtrlParamIntegra ;

procedure TfrmMTCadConjunto.FormCreate(Sender: TObject);
begin
   inherited;
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   Conjunto.cds := cds;
   Conjunto.cdsRateioCustos := cdsDet;
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('CONJUNTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.INATIVO = 0');
   MSResponsavel.Filtro.Add('RESPONSAVEL.FLGATIVOFIXO = 1');
   MSCentroCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   MSCentroCusto.Filtro.Add('CENTCUST.ATIVO = '+#39+'S'+#39);
   SelConjunto(Sistema.IdEmpresa,0);
   SetUltConjunto(Sistema.IdEmpresa,0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.FormShow(Sender: TObject);
begin
   inherited;
   if not Conjunto.ValidarCentroCusto(Sistema.IdEmpresa) then
      MsgDlg(Conjunto.MessageInfo, 'Atenção', mtInformation, [mbOK], 0);
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
      cdsResp.Data  := Responsavel.ListaResponsavel(0);
      cdsDet.Data   := Conjunto.ListaRateioCustos(Sistema.IdEmpresa,0);
   end;
   TFloatField(cdsDet.FieldByName('CODCENTROCUSTO')).EditMask := ParamIntegra.MascaraCC + ';0;_';
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
   if cds.FieldByName('INATIVO').AsInteger = 0 then
      SetUltConjunto(Sistema.IdEmpresa, strtofloat(Conjunto.MessageInfo))
   else
      SetUltConjunto(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := Conjunto.AplicaOperacao('E');
   if cds.FieldByName('INATIVO').AsInteger = 0 then
      SetUltConjunto(Sistema.IdEmpresa, strtofloat(Conjunto.MessageInfo))
   else
      SetUltConjunto(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(Conjunto.MessageInfo) <> '' then
      MsgDlg(Conjunto.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelConjunto(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
      if cds.FieldByName('INATIVO').AsInteger = 0 then
         SetUltConjunto(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]))
      else
         SetUltConjunto(Sistema.IdEmpresa, 0);
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
   cds.FieldByName('ALUGADO').AsInteger := 0;
   cds.FieldByName('INATIVO').AsInteger := 0;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroEdit(Sender: TObject);
begin
   if Conjunto.BensnoConjunto(cds.FieldByName('IDCONJUNTO').AsFloat,
                              cds.FieldByName('IDPESSOA').AsFloat) then
   begin
      bbtnSelLocal.Enabled := False;
      bbtnSelResp.Enabled  := False;
      dbrgInativo.Enabled  := False;
      MsgDlg('Existem Bens Ativos associados ao Conjunto. Alteração Restrita', //23854
             'Informação',mtInformation,[mbOK],0);
   end;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroDelete(Sender: TObject);
begin
   if not Conjunto.BensnoConjunto(cds.FieldByName('IDCONJUNTO').AsFloat,
                                  cds.FieldByName('IDPESSOA').AsFloat) then
   begin
      if not Conjunto.TransfOK(cds.FieldByName('IDPESSOA').AsFloat,
                               cds.FieldByName('IDCONJUNTO').AsFloat) then
      begin
         MsgDlg('Conjunto registrado em Transferências. Coloque-o como Inativo!',
                'Erro',mtError,[mbOk],0);
      end else
      begin
         cdsDet.First;
         while not cdsDet.EOF do
            cdsDet.Delete;
         inherited;
      end;
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
      cds.FieldbyName('IDPESSOA').AsFloat := cdsLocal.FieldbyName('IDPESSOA').AsFloat;
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
      cdsResp.Data := Responsavel.ListaResponsavel(StrToFloat(MSResponsavel.ValoresChave[0]));
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
procedure TfrmMTCadConjunto.CmeDetalheInsert(Sender: TObject);
begin
   if cdsDet.IsEmpty then
   begin
      inherited;
      cdsDet.FieldByName('CODCENTROCUSTO').AsString := cdsLocal.FieldByName('CODCENTROCUSTO').AsString;
      cdsDet.FieldByName('IDEMPRESA').AsInteger     := cdsLocal.FieldByName('IDEMPRESA').AsInteger;
      cdsDet.FieldByName('DESCCCUSTO').AsString     := cdsLocal.FieldByName('DESCCCUSTO').AsString;
      cdsDet.FieldByName('DTAINICIO').AsDateTime    := Date;
      cdsDet.FieldByName('DTAFIM').Clear;
      cdsDet.FieldByName('PARTICIPACAO').AsFloat    := 100;
   end else
      inherited;
end;
//========================================================================================
procedure TfrmMTCadConjunto.bbtnSelCCustoClick(Sender: TObject);
begin
   inherited;
   MSCentroCusto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSCentroCusto.RetornouValor then
   begin
      cdsDet.FieldByName('CODCENTROCUSTO').AsString := trim(MSCentroCusto.ValoresChave[0]);
      cdsDet.FieldByName('IDEMPRESA').AsInteger     := strtoint(MSCentroCusto.ValoresChave[1]);
      cdsDet.FieldByName('DESCCCUSTO').AsString     := trim(MSCentroCusto.ValoresChave[2]);
      cdsDet.FieldByName('DTAFIM').Clear;
      cdsDet.FieldByName('CODEXTERNO').AsString     := trim(MSCentroCusto.ValoresChave[3]);
   end;
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
            bbtnSelCCusto.SetFocus;
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
   Accept := True;
   if (trim(dbeDescConjunto.Text) = '') then
   begin
      MsgDlg('Descrição do conjunto não foi preenchida','Erro',mtError,[mbOK],0);
      dbeDescConjunto.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeLocalizacao.Text) = '') then
   begin
       MsgDlg('Localização não foi preenchida','Erro',mtError,[mbOK],0);
       dbeLocalizacao.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeResponsavel.Text) = '') then
   begin
       MsgDlg('Responsável não foi preenchido','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
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
//      Marcio Sanches Spinosa SOL 200681 Kintana 1939514 - Inicio
//      if fTotperc <> 100 then
      if StrToFloat(FloatToStr(fTotperc)) <> 100 then
//      Marcio Sanches Spinosa SOL 200681 Kintana 1939514 - Fim
      begin
         MsgDlg('Soma dos Rateios de Custo está em ' + FloatToStr(fTotPerc) +
                '% e deve ser 100% ','Erro',mtError,[mbOK],0);
         Accept := False;
      end;
   end;
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
   //-------------------------------------------------------------------------------------   
   bbtnSelLocal.Enabled := True;
   bbtnSelResp.Enabled  := True;
   dbrgInativo.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTCadConjunto.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelConjunto(Sistema.IdEmpresa,0);
   bbtnSelLocal.Enabled := True;
   bbtnSelResp.Enabled  := True;
end;
//========================================================================================
procedure TfrmMTCadConjunto.dbgrdDetDblClick(Sender: TObject);
begin
   //inherited;
end;

end.

