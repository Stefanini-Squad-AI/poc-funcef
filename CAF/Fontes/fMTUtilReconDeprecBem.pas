unit fMTUtilReconDeprecBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, wwriched,
  MontaSelect, DB, DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlBem, uCtrlUtilImplantacao,
  wwdblook, IvEMulti;

type
  TfrmMTUtilReconDeprecBem = class(TfrmOkCancelar)
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    sqlSelBem: TCMSqlParams;
    Label4: TLabel;
    edPlaca: TwwDBEdit;
    edDescBem: TwwDBEdit;
    bbtnSelBem: TBitBtn;
    Label1: TLabel;
    eDataInicioDep: TCMDateTimePicker;
    Panel2: TPanel;
    Label2: TLabel;
    eDtaIni: TCMDateTimePicker;
    eDtaFim: TCMDateTimePicker;
    Panel1: TPanel;
    ckbEstornaBaixa: TCheckBox;
    GroupBox1: TGroupBox;
    edDataBaixa: TCMDateTimePicker;
    cdsGrupo: TCMClientDataSet;
    sqlGrupo: TCMSqlParams;
    cdsUltFec: TCMClientDataSet;
    sqlUltFec: TCMSqlParams;
    cdsBaixa: TCMClientDataSet;
    sqlBaixa: TCMSqlParams;
    Label3: TLabel;
    Label5: TLabel;
    cdsMotivoBaixa: TCMClientDataSet;
    sqlMotivoBaixa: TCMSqlParams;
    cmbMotivoBaixa: TwwDBLookupCombo;
    Panel3: TPanel;
    ckbRemBemDup: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eDtaIniChange(Sender: TObject);
    procedure eDtaFimEnter(Sender: TObject);
    procedure eDataInicioDepExit(Sender: TObject);
    procedure eDtaIniExit(Sender: TObject);
    procedure eDtaFimExit(Sender: TObject);
    procedure ckbRemBemDupExit(Sender: TObject);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    Bem : TCtrlBem;
    Implantacao : TCtrlUtilImplantacao;
    Procedure SelBem(fPessoa, fBem : Extended);
  public
    { Public declarations }
  end;

var
  frmMTUtilReconDeprecBem: TfrmMTUtilReconDeprecBem;

implementation

{$R *.dfm}

Uses uMensErro, uSistema;

procedure TfrmMTUtilReconDeprecBem.FormCreate(Sender: TObject);
begin
   inherited;
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Implantacao := TCtrlUtilImplantacao.Create;
   Implantacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   sqlMotivoBaixa.Open;
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
end;

Procedure TfrmMTUtilReconDeprecBem.SelBem(fPessoa, fBem : Extended);
var
   iAno, iMes, iDia,
   iAnoFim, iMesFim, iDiaFim : Word;
begin
   cdsSelBem.Close;
   sqlSelBem.Prepare;
   sqlSelBem.ParamByName('IDBEM').AsFloat     := fBem;
   sqlSelBem.ParamByName('IDPESSOA').AsFloat  := fPessoa;
   sqlSelBem.ParamByName('MOECODIGO').AsFloat := ParamCAF.MOEDAOFICIAL;
   sqlSelBem.ParamByName('IDTAXADEP').AsFloat := 1;
   sqlSelBem.Open;
   //-------------------------------------------------------------------------------------
   eDataInicioDep.Date := cdsSelBem.FieldByName('DATAINICIODEP').asDateTime;
   eDtaIni.Date := cdsSelBem.FieldByName('DATAINICIODEP').asDateTime;
   //-------------------------------------------------------------------------------------
   cdsGrupo.Close;
   sqlGrupo.Prepare;
   sqlGrupo.ParamByName('IDGRUPO').AsInteger := cdsSelBem.FieldByName('IDGRUPO').AsInteger;
   sqlGrupo.ParamByName('IDPESSOA').AsInteger := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
   sqlGrupo.Open;
   if not cdsGrupo.FieldByName('DATAULTFEC').IsNull then
   begin
      if cdsGrupo.FieldByName('DATAULTFEC').AsDateTime > eDataInicioDep.Date then
      begin
         DecodeDate(cdsGrupo.FieldByName('DATAULTFEC').AsDateTime, iAno, iMes, iDia);
      end else
      begin
         cdsUltFec.Close;
         sqlUltFec.Prepare;
         sqlUltFec.ParamByName('IDPESSOA').AsInteger := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
         sqlUltFec.Open;
         DecodeDate(cdsUltFec.FieldByName('DATA').AsDateTime, iAno, iMes, iDia);
      end;
   end else
   begin
      cdsUltFec.Close;
      sqlUltFec.Prepare;
      sqlUltFec.ParamByName('IDPESSOA').AsInteger := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
      sqlUltFec.Open;
      DecodeDate(cdsUltFec.FieldByName('DATA').AsDateTime, iAno, iMes, iDia);
   end;
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaFim.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
   //-------------------------------------------------------------------------------------
   ckbEstornaBaixa.Checked := (cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S');
   cdsBaixa.Close;
   sqlBaixa.Prepare;
   sqlBaixa.ParamByName('IDBEM').AsInteger := cdsSelBem.FieldByName('IDBEM').AsInteger;
   sqlBaixa.ParamByName('IDPESSOA').AsInteger := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
   sqlBaixa.Open;
end;

procedure TfrmMTUtilReconDeprecBem.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
      SelBem(strtofloat(MSBem.ValoresChave[0]), strtofloat(MSBem.ValoresChave[1]))
   else
      bbtnSelBem.SetFocus;
end;

procedure TfrmMTUtilReconDeprecBem.bbtnConfirmarClick(Sender: TObject);
var
   dDataBaixa : TDateTime;
   iMotivoBaixa : Integer;

begin
   inherited;
   if ckbEstornaBaixa.Checked then
      if cdsBaixa.IsEmpty or (cdsSelBem.FieldByName('BAIXATOTAL').AsString <> 'S') then
         ckbEstornaBaixa.Checked := False;
   //-------------------------------------------------------------------------------------
   if edDataBaixa.Text <> '' then
   begin
      if cmbMotivoBaixa.Text = '' then
      begin
         MsgDlg('Selecione o motivo da baixa !', 'Erro', mtError, [mbOk], 0);
         cmbMotivoBaixa.SetFocus;
         Exit;
      end else
      begin
         dDataBaixa := edDataBaixa.Date;
         iMotivoBaixa := cdsMotivoBaixa.FieldByName('IDMOTIVOBAIXA').AsInteger;
      end;
   end else
   begin
      dDataBaixa := -1;
      iMotivoBaixa := -1;
   end;
   //-------------------------------------------------------------------------------------
   if ckbRemBemDup.Checked then
   begin
      if MsgDlg('Os dados e movimentações do Bem Selecionado serão APAGADOS de forma PERMANENTE da Base de Dados.' + #13 + #13 +
                'Confirma a operação ?', 'Atenção', mtWarning, [mbYes, mbNo], 0) = mrNo then
      begin
         ckbRemBemDup.Checked := False;
         bbtnSelBem.SetFocus;
      end;
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crSQLWait;
   if not Implantacao.ExecutaReconDeprecBem(cdsSelBem.FieldByName('IDMODULO').AsFloat,
                                            cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                            Sistema.IdUsuario,
                                            cdsSelBem.FieldByName('IDBEM').Asfloat,
                                            ParamCAF.MOEDAOFICIAL, 1,
                                            eDtaIni.Date, eDtaFim.Date,
                                            ckbEstornaBaixa.Checked,
                                            cdsBaixa.FieldByName('DATAMOVIMENTACAO').AsDateTime,
                                            dDataBaixa, iMotivoBaixa,
                                            ckbRemBemDup.Checked) then
   begin
      MsgDlg('Reconstrução não Realizada!' + #13 +
             'Causa : ' + Implantacao.MessageInfo, 'Erro', mtError, [mbOk], 0)
   end else
   begin
      SelBem(cdsSelBem.FieldByName('IDPESSOA').AsFloat, cdsSelBem.FieldByName('IDBEM').Asfloat);
      MsgDlg('Reconstrução Realizada.', 'Informação', mtInformation, [mbOk], 0)
   end;
   ckbRemBemDup.Checked := False;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

procedure TfrmMTUtilReconDeprecBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsSelBem.Close;
   cdsGrupo.Close;
   cdsUltFec.Close;
   cdsBaixa.Close;
   Bem.Free;
   Implantacao.Free;
   ParamCAF.Free;
end;

procedure TfrmMTUtilReconDeprecBem.eDtaIniExit(Sender: TObject);
var
   iAno, iMes, iDia,
   iAnoFim, iMesFim, iDiaFim : Word;
begin
   inherited;
   if bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaIni.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      eDtaIni.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if eDtaIni.Date < cdsSelBem.FieldByName('DATAINICIODEP').AsDateTime then
      eDtaIni.Date := cdsSelBem.FieldByName('DATAINICIODEP').AsDateTime;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaIni.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaIni.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

procedure TfrmMTUtilReconDeprecBem.eDtaFimExit(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   if bbtnSair.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaFim.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      eDtaFim.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if eDtaFim.Date > cdsGrupo.FieldByName('DATAULTFEC').AsDateTime then
      eDtaFim.Date := cdsGrupo.FieldByName('DATAULTFEC').AsDateTime;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaFim.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaFim.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

procedure TfrmMTUtilReconDeprecBem.eDtaIniChange(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   if eDtaIni.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaIni.Text = '' then
      exit;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaIni.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaIni.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

procedure TfrmMTUtilReconDeprecBem.eDtaFimEnter(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia           : Word;

begin
   inherited;
   if eDtaFim.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   if eDtaFim.Text = '' then
      exit;
   //-------------------------------------------------------------------------------------
   DecodeDate(eDtaFim.Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDtaFim.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

procedure TfrmMTUtilReconDeprecBem.eDataInicioDepExit(Sender: TObject);
begin
   inherited;
   eDtaIni.Date := eDataInicioDep.Date;
end;

procedure TfrmMTUtilReconDeprecBem.ckbRemBemDupExit(Sender: TObject);
begin
   inherited;
   if ckbRemBemDup.Checked then
   begin
      if MsgDlg('Os dados e movimentações do Bem Selecionado serão APAGADOS de forma PERMANENTE da Base de Dados.' + #13 + #13 +
                'Confirma a operação ?', 'Atenção', mtWarning, [mbYes, mbNo], 0) = mrNo then
      begin
         ckbRemBemDup.Checked := False;
         ckbRemBemDup.SetFocus;
      end;
   end;
end;

end.
