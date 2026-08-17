unit FCadEveCaixaCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uCmSqlParams, uCtrlEventoCaixaCota,
  wwdblook, Mask, wwdbedit, DBCtrls, uCtrlPadroes, uMensErro, uCMTypes,
  uCtrlInvestCotas, TREdit;

type
  TFrmCadEveCaixaCota = class(TFrmCadastroGridMTInv)
    CMSqlParams: TCMSqlParams;
    CdsRegra: TCMClientDataSet;
    CdsTipoInvest: TCMClientDataSet;
    CdsTipoOperacao: TCMClientDataSet;
    CdsTipoDespInvest: TCMClientDataSet;
    DbeDescricao: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DbLCTipoOperacao: TwwDBLookupCombo;
    Label1: TLabel;
    DbLCTipoInvest: TwwDBLookupCombo;
    Panel2: TPanel;
    dbchkCotiza: TDBCheckBox;
    dbchkCota: TDBCheckBox;
    dbrAtivoPassivo: TDBRadioGroup;
    Panel3: TPanel;
    dbchkCaixa: TDBCheckBox;
    dbrSomaDiminui: TDBRadioGroup;
    dbchkCpmf: TDBCheckBox;
    Label5: TLabel;
    DdLCTipoDespesa: TwwDBLookupCombo;
    dbrFlgManualAut: TDBRadioGroup;
    Label6: TLabel;
    DbEIdentificador: TDBEdit;
    dblRegra: TwwDBLookupCombo;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbLCTipoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLCTipoInvestEnter(Sender: TObject);
    procedure DbLCTipoInvestExit(Sender: TObject);
    procedure dbchkCotaClick(Sender: TObject);
    procedure dbchkCaixaClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure DbLCTipoOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DbLCTipoOperacaoEnter(Sender: TObject);
    procedure DbLCTipoOperacaoExit(Sender: TObject);
  private
    { Private declarations }
    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;
    CtrlInvestCotas : TCtrlInvestCotas;
    bModif : Boolean;
    sRegAnt : string;    
  public
    { Public declarations }
  end;

var
  FrmCadEveCaixaCota: TFrmCadEveCaixaCota;

implementation

{$R *.DFM}

procedure TFrmCadEveCaixaCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
   CtrlEventoCaixaCota.InitializeAs(Padroes);
   CtrlEventoCaixaCota.CdsEventoCaixaCota := Cds;

   CtrlInvestCotas := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlInvestCotas.CdsTipoInvest := CdsTipoInvest;
   CtrlInvestCotas.CdsTipoOperacao := CdsTipoOperacao;
   CtrlInvestCotas.CdsTipoDespInvest := CdsTipoDespInvest;
   CtrlInvestCotas.CdsRegra := CdsRegra;

end;

procedure TFrmCadEveCaixaCota.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlEventoCaixaCota);
   FreeAndNil(CtrlInvestCotas);
end;

procedure TFrmCadEveCaixaCota.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlEventoCaixaCota.AplicaAtualEventoCaixaCota;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlEventoCaixaCota.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmCadEveCaixaCota.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlEventoCaixaCota.AplicaAtualEventoCaixaCota;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlEventoCaixaCota.MessageInfo,'Erro',mtError,[mbOk],0);

   Cds.Data := CtrlEventoCaixaCota.ListEventoCaixaCota;
end;

procedure TFrmCadEveCaixaCota.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlEventoCaixaCota.AplicaAtualEventoCaixaCota;
   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlEventoCaixaCota.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmCadEveCaixaCota.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := False;

   if Trim(DbeDescricao.Text) = '' then
   begin
      MsgDlg('Informe a Descrição do Evento.', 'Warning', mtWarning, [mbOk], 0);
      if DbeDescricao.CanFocus then
         DbeDescricao.SetFocus;
      Exit;
   end;

   if ((not dbchkCota.Checked) and (not dbchkCaixa.Checked)) then
   begin
      MsgDlg('Informe se o evento afeta a Cota ou Caixa.', 'Warning', mtWarning, [mbOk], 0);
      if dbchkCota.Checked then
      begin
         if dbchkCaixa.CanFocus then
            dbchkCaixa.SetFocus;
      end
      else if dbchkCaixa.Checked then
      begin
         if dbchkCota.CanFocus then
            dbchkCota.SetFocus;
      end;
      Exit;
   end;

   if dbchkCota.Checked then
   begin
      if dbrAtivoPassivo.ItemIndex < 0 then
      begin
         MsgDlg('Informe qual a Classificação na Cota.', 'Warning', mtWarning, [mbOk], 0);
         if dbrAtivoPassivo.CanFocus then
            dbrAtivoPassivo.SetFocus;
         Exit;
      end;
   end;

   if dbchkCaixa.Checked then
   begin
      if dbrSomaDiminui.ItemIndex < 0 then
      begin
         MsgDlg('Informe qual a Classificação no Caixa.', 'Warning', mtWarning, [mbOk], 0);
         if dbrSomaDiminui.CanFocus then
            dbrSomaDiminui.SetFocus;
         Exit;
      end;
   end;

   Accept := True;
end;

procedure TFrmCadEveCaixaCota.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDEVENTOCAIXACOTA',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadEveCaixaCota.FormShow(Sender: TObject);
begin
  inherited;
   CdsTipoInvest.Data := CtrlInvestCotas.ListTipoInvest;
   CdsTipoOperacao.Data := CtrlInvestCotas.ListTipoOperacao;
   CdsTipoDespInvest.Data := CtrlInvestCotas.ListDespXTipoOper;
   CdsRegra.Data := CtrlInvestCotas.ListRegra;
   Cds.Data := CtrlEventoCaixaCota.ListEventoCaixaCota;   
end;

procedure TFrmCadEveCaixaCota.DbLCTipoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if ((modified) and (Trim(DbLCTipoInvest.Text) <> '') ) then
   begin
      CdsTipoOperacao.Data   := CtrlInvestCotas.ListTipoOperacao(StrToInt(DbLCTipoInvest.LookupValue));
      CdsTipoDespInvest.Data := CtrlInvestCotas.ListDespXTipoOper(StrToInt(DbLCTipoInvest.LookupValue));
   end;
end;

procedure TFrmCadEveCaixaCota.DbLCTipoInvestEnter(Sender: TObject);
begin
  inherited;
   sRegAnt := DbLCTipoInvest.LookupValue;
end;

procedure TFrmCadEveCaixaCota.DbLCTipoInvestExit(Sender: TObject);
begin
  inherited;
   if ((Not bModif) and (Trim(DbLCTipoInvest.Text) <> '') and (sRegAnt <> DbLCTipoInvest.LookupValue)) then
   begin
      CdsTipoOperacao.Data   := CtrlInvestCotas.ListTipoOperacao(StrToInt(DbLCTipoInvest.LookupValue));
      CdsTipoDespInvest.Data := CtrlInvestCotas.ListDespXTipoOper(StrToInt(DbLCTipoInvest.LookupValue));
   end;
end;

procedure TFrmCadEveCaixaCota.dbchkCotaClick(Sender: TObject);
begin
  inherited;
  if dbchkCota.Checked then
  begin
     dbrAtivoPassivo.Visible := True;
     dbchkCotiza.Visible := True;
  end
  else
  begin
     dbrAtivoPassivo.Visible := False;
     dbchkCotiza.Visible := False;
     if ds.State in [dsInsert, dsEdit] then
     begin
        Cds.FieldByName('STAATIVOPASSIVO').Clear;
        Cds.FieldByName('STACOTIZA').Clear;
     end;
  end;
end;

procedure TFrmCadEveCaixaCota.dbchkCaixaClick(Sender: TObject);
begin
  inherited;
  if dbchkCaixa.Checked then
     dbrSomaDiminui.Visible := True
  else
  begin
     dbrSomaDiminui.Visible := False;
     if ds.State in [dsInsert, dsEdit] then
        Cds.FieldByName('STASOMADIMINUI').Clear;
  end;
end;

procedure TFrmCadEveCaixaCota.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlEventoCaixaCota.ListEventoCaixaCota;
end;

procedure TFrmCadEveCaixaCota.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   dbchkCota.Checked       := False;
   dbchkCotiza.Checked     := False;
   dbchkCaixa.Checked      := False;
   dbchkCpmf.Checked       := False;

   dbrFlgManualAut.Value   := 'A';

   dbchkCotiza.Visible     := True;
   dbrAtivoPassivo.Visible := True;
   dbrSomaDiminui.Visible  := True;  
end;

procedure TFrmCadEveCaixaCota.DbLCTipoOperacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if ((modified) and ((Trim(DbLCTipoInvest.Text) <> '') and (Trim(DbLCTipoOperacao.Text) <> ''))) then
      CdsTipoDespInvest.Data := CtrlInvestCotas.ListDespXTipoOper(StrToInt(DbLCTipoInvest.LookupValue),
                                                                  StrToInt(DbLCTipoOperacao.LookupValue));
end;

procedure TFrmCadEveCaixaCota.DbLCTipoOperacaoEnter(Sender: TObject);
begin
  inherited;
   sRegAnt := DbLCTipoOperacao.LookupValue;
end;

procedure TFrmCadEveCaixaCota.DbLCTipoOperacaoExit(Sender: TObject);
begin
  inherited;
   if ((Not bModif) and (Trim(DbLCTipoInvest.Text) <> '') and
                        ((Trim(DbLCTipoOperacao.Text) <> '') and (sRegAnt <> DbLCTipoOperacao.LookupValue))) then
      CdsTipoDespInvest.Data := CtrlInvestCotas.ListDespXTipoOper(StrToInt(DbLCTipoInvest.LookupValue),
                                                                  StrToInt(DbLCTipoOperacao.LookupValue));
end;

end.
