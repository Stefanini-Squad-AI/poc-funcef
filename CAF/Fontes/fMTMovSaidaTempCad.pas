unit fMTMovSaidaTempCad;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, wwdblook, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlMovSaidaTemporaria, uCtrlTipoSaidaTemp,
  uCtrlLocalizacoes, uCtrlResponsavel, uCtrlDomBem, IvEMulti;

type
  TfrmMTMovSaidaTempCad = class(TFrmCadastroMestreDetMT)
    dsLocal: TwwDataSource;
    dsSelMotivo: TwwDataSource;
    dsResp: TwwDataSource;
    cdsDet: TCMClientDataSet;
    Label5: TLabel;
    dbcmbSelMotivo: TwwDBLookupCombo;
    Label34: TLabel;
    dbeLocalizacao: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    Label1: TLabel;
    dbeData: TCMDateTimePicker;
    Termo: TLabel;
    dbeTermo: TwwDBEdit;
    Label4: TLabel;
    dbeResponsavel: TwwDBEdit;
    Label6: TLabel;
    dbeObs: TDBMemo;
    bbtnSelResp: TBitBtn;
    MSResp: TMontaSelect;
    sqlDet: TCMSqlParams;
    cdsLocal: TCMClientDataSet;
    cdsSelMotivo: TCMClientDataSet;
    cdsResp: TCMClientDataSet;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    Label26: TLabel;
    bbtnSelBem: TBitBtn;
    Label22: TLabel;
    dbeDesBem: TDBMemo;
    Label2: TLabel;
    dbeConjunto: TwwDBEdit;
    Label7: TLabel;
    dbeDescLocalizacao: TwwDBEdit;
    Label17: TLabel;
    dbeNomeResp: TwwDBEdit;
    dbeDescGrupo: TwwDBEdit;
    Label3: TLabel;
    dbePlaca: TwwDBEdit;
    MSLocal : TMontaSelect;
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
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    SaidaTemporaria : TCtrlMovSaidaTemporaria;
    TipoSaidaTemp   : TCtrlTipoSaidaTemp;
    Localizacao     : TCtrlLocalizacoes;
    Responsavel     : TCtrlResponsavel;
    Bem             : TCtrlDomBem;
    procedure SelSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria : Extended);
  public
    { Public declarations }
  end;

var
  frmMTMovSaidaTempCad: TfrmMTMovSaidaTempCad;

implementation

{$R *.dfm}

Uses uMensErro, uSistema;

procedure TfrmMTMovSaidaTempCad.FormCreate(Sender: TObject);
begin
   inherited;
   SaidaTemporaria := TCtrlMovSaidaTemporaria.Create;
   SaidaTemporaria.InitializeAs(Padroes);
   SaidaTemporaria.cds              := cds;
   SaidaTemporaria.cdsSaidaTempBens := cdsDet;
   //-------------------------------------------------------------------------------------
   TipoSaidaTemp := TCtrlTipoSaidaTemp.Create;
   TipoSaidaTemp.InitializeAs(Padroes);
   cdsSelMotivo.Data := TipoSaidaTemp.ListaTipoSaidaTemp;
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('SAIDATEMPORARIA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   SelSaidaTemporaria(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TFrmMTMovSaidaTempCad.SelSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria : Extended);
begin
   cds.Data := SaidaTemporaria.ListaSaidaTemporaria(fIdPessoa, fIdSaidaTemporaria);
   if not cds.IsEmpty then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(cds.FieldByName('IDPESSOA').AsFloat,
                                                    cds.FieldByName('IDLOCALIZACAO').AsFloat);
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      cdsDet.Data := SaidaTemporaria.ListaSaidaTempBens(cds.FieldByName('IDPESSOA').AsFloat,
                                                        cds.FieldByName('IDSAIDATEMPORARIA').AsFloat);
   end else
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa,0);
      cdsResp.Data  := Responsavel.ListaResponsavel(0);
      cdsDet.Data   := SaidaTemporaria.ListaSaidaTempBens(Sistema.IdEmpresa,0);
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Responsavel.Free;
   Localizacao.Free;
   TipoSaidaTemp.Free;
   Bem.Free;
   SaidaTemporaria.Free;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := SaidaTemporaria.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := SaidaTemporaria.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := SaidaTemporaria.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(SaidaTemporaria.MessageInfo) <> '' then
      MsgDlg(SaidaTemporaria.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelSaidaTemporaria(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroInsert(Sender: TObject);
begin
   SelSaidaTemporaria(0,0);
   inherited;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroEdit(Sender: TObject);
begin
   if cds.FieldbyName('STPFLGEXEC').AsInteger = 0 then
      inherited
   else
      MsgDlg('Não é possível alterar um Termo de Saída Temporária já processado!',
             'Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroDelete(Sender: TObject);
begin
   if cds.FieldbyName('STPFLGEXEC').AsInteger = 0 then
   begin
      cdsDet.First;
      while not cdsDet.EOF do
         cdsDet.Delete;
      inherited;
   end else
   begin
      MsgDlg('Não é possível remover um Termo de Saída Temporária já processado!',
             'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(StrToFloat(MSLocal.ValoresChave[1]),
                                                    StrToFloat(MSLocal.ValoresChave[0]));
      cds.FieldbyName('IDLOCALIZACAO').AsFloat := cdsLocal.FieldbyName('IDLOCALIZACAO').AsFloat;
      cds.FieldbyName('IDPESSOA').AsFloat      := cdsLocal.FieldbyName('IDPESSOA').AsFloat;
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResp.RetornouValor then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(StrToFloat(MSResp.ValoresChave[0]));
      cds.FieldbyName('IDRESPONSAVEL').AsFloat := cdsResp.FieldbyName('IDRESPONSAVEL').AsFloat;
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      //----------------------------------------------------------------------------------
      if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MsgDlg('Bem Baixado!','Erro',mtError,[mbOK],0);
         cdsSelBem.Data := Bem.ListaBem(0, 0);
      end else
      if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MsgDlg('Bem em Saída Temporária!','Erro',mtError,[mbOk],0);
         cdsSelBem.Data := Bem.ListaBem(0, 0);
      end else
      begin
         cdsDet.FieldByName('IDPESSOA').AsFloat := cdsSelBem.FieldByName('IDPESSOA').AsFloat;
         cdsDet.FieldByName('IDBEM').AsFloat := cdsSelBem.FieldByName('IDBEM').AsFloat;
         cdsDet.FieldByName('PLACA').AsFloat := cdsSelBem.FieldByName('PLACA').AsFloat;
         cdsDet.FieldByName('DESBEM').AsString := cdsSelBem.FieldByName('DESBEM').AsString;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if cdsDet.State in [dsInsert,dsEdit] then
      begin
         if dbePlaca.Text = '' then
         begin
            MsgDlg('Bem não Selecionado','Erro',mtError,[mbOK],0);
            bbtnSelBem.SetFocus;
            exit;
         end;
      end;
   end;
   inherited;
   cdsSelBem.Data := Bem.ListaBem(0, 0);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := True;
   if trim(dbeTermo.Text) = '' then
   begin
      MsgDlg('Número do Termo não foi preenchido','Erro',mtError,[mbOK],0);
      dbeTermo.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeData.Text) = '' then
   begin
      MsgDlg('Data de Saída dos Bens do Termo não foi preenchida','Erro',mtError,[mbOK],0);
      dbeData.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeLocalizacao.Text) = '' then
   begin
       MsgDlg('Local de Destino dos Bens não foi selecionado','Erro',mtError,[mbOK],0);
       dbeLocalizacao.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbeResponsavel.Text) = '' then
   begin
       MsgDlg('Responsável pela Saída dos Bens não foi selecionado','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if trim(dbcmbSelMotivo.Text) = '' then
   begin
       MsgDlg('Motivo da Saída não foi selecionado','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   if Accept then
      inherited;
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelSaidaTemporaria(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelSaidaTemporaria(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTMovSaidaTempCad.dbgrdDetDblClick(Sender: TObject);
begin
   //inherited;
end;

end.
