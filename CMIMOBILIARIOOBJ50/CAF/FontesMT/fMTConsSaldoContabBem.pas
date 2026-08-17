unit fMTConsSaldoContabBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, DB, Wwdatsrc, DBClient, uCMClientDataSet,
  MontaSelect, TREdit, Mask, wwdbedit, fcLabel, TB97Tlwn,
  uCmSqlParams, uCtrlGrupoContab, uCtrlBem, uCtrlParamCAF, uCtrlBemCotacao,
  IvEMulti;

type
  TfrmMTConsSaldoContabBem = class(TfrmOkCancelar)
    Dock973: TDock97;
    ToolWindow971: TToolWindow97;
    fcLabel1: TfcLabel;
    eDataMov: TCMDateTimePicker;
    pnlDados: TPanel;
    Label17: TLabel;
    Label24: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    edPlaca: TEdit;
    spdPesquisa: TBitBtn;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    pnlValores: TPanel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    fcLabel4: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel6: TfcLabel;
    fcLabel7: TfcLabel;
    fcLabel8: TfcLabel;
    fcLabel9: TfcLabel;
    fcLabel10: TfcLabel;
    fcLabel11: TfcLabel;
    fcLabel12: TfcLabel;
    eSoma1: TRealEdit;
    eSoma2: TRealEdit;
    eSoma4: TRealEdit;
    eSoma3: TRealEdit;
    eSoma5: TRealEdit;
    eSoma6: TRealEdit;
    eSoma7: TRealEdit;
    eSoma8: TRealEdit;
    cdsBem: TCMClientDataSet;
    dsBem: TwwDataSource;
    fcLabel13: TfcLabel;
    fcLabel14: TfcLabel;
    dbcmbPais: TwwDBLookupCombo;
    cdsPais: TCMClientDataSet;
    dsPais: TwwDataSource;
    dbcmbMoeda: TwwDBLookupCombo;
    dsMoeda: TwwDataSource;
    cdsMoeda: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    edAquisicao1: TRealEdit;
    edAquisicao2: TRealEdit;
    edAquisicao3: TRealEdit;
    edAquisicao4: TRealEdit;
    edAquisicao5: TRealEdit;
    edAquisicao6: TRealEdit;
    edAquisicao7: TRealEdit;
    edAquisicao8: TRealEdit;
    edReaval1: TRealEdit;
    edReaval2: TRealEdit;
    edReaval3: TRealEdit;
    edReaval4: TRealEdit;
    edReaval5: TRealEdit;
    edReaval6: TRealEdit;
    edReaval7: TRealEdit;
    edReaval8: TRealEdit;
    MSBem: TMontaSelect;
    eCotacaoBem: TRealEdit;
    lblCotacaoBem: TfcLabel;
    procedure FormCreate(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
  private
    { Private declarations }
    ParamCAF    : TCtrlParamCAF;
    Bem         : TCtrlBem;
    GrupoContab : TCtrlGrupoContab;
    BemCotacao : TCtrlBemCotacao;
    //------------------------------------------------------------------------------------
    Procedure LimpaTela;
    Procedure CalculaSaldoContabil;
  public
    { Public declarations }
  end;

var
  frmMTConsSaldoContabBem: TfrmMTConsSaldoContabBem;

implementation

{$R *.dfm}

uses uMensErro, uSistema, uCtrlPadroes ;

procedure TfrmMTConsSaldoContabBem.FormCreate(Sender: TObject);
var
   iAnoFim, iMesFim, iDiaFim,
   iAno, iMes, iDia : Word;

begin
   inherited;
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   BemCotacao := TCtrlBemCotacao.Create;
   BemCotacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   cdsMoeda.Data := ParamCAF.ListaCAFMoedas(Sistema.IdEmpresa);
   cdsPais.Data := ParamCAF.ListaCAFPaises(Sistema.IdEmpresa);
   cdsMoeda.Locate('IDTIPOMOEDA', 1, []);
   cdsPais.First;
   dbcmbMoeda.Text := cdsMoeda.FieldByName('MOEDESC').AsString;
   dbcmbPais.Text := cdsPais.FieldByName('NOMEPAIS').AsString;
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   DecodeDate(Date, iAno, iMes, iDia);
   DecodeDate(DiasUteis.UltDiaMes(iAno, iMes), iAnoFim, iMesFim, iDiaFim);
   eDataMov.Date := EncodeDate(iAnoFim, iMesFim, iDiaFim);
end;

procedure TfrmMTConsSaldoContabBem.LimpaTela;
begin
   cdsBem.Data := Bem.ListaBem(0,0);
   edPlaca.Text := '';
   cdsMoeda.Data := ParamCAF.ListaCAFMoedas(Sistema.IdEmpresa);
   cdsPais.Data := ParamCAF.ListaCAFPaises(Sistema.IdEmpresa);
   cdsMoeda.Locate('IDTIPOMOEDA', 1, []);
   cdsPais.First;
   dbcmbMoeda.Text := cdsMoeda.FieldByName('MOEDESC').AsString;
   dbcmbPais.Text := cdsPais.FieldByName('NOMEPAIS').AsString;
   //-------------------------------------------------------------------------------------
   edAquisicao1.Value := 0;
   edAquisicao2.Value := 0;
   edAquisicao3.Value := 0;
   edAquisicao4.Value := 0;
   edAquisicao5.Value := 0;
   edAquisicao6.Value := 0;
   edAquisicao7.Value := 0;
   edAquisicao8.Value := 0;
   edReaval1.Value := 0;
   edReaval2.Value := 0;
   edReaval3.Value := 0;
   edReaval4.Value := 0;
   edReaval5.Value := 0;
   edReaval6.Value := 0;
   edReaval7.Value := 0;
   edReaval8.Value := 0;
   eSoma1.Value := 0;
   eSoma2.Value := 0;
   eSoma3.Value := 0;
   eSoma4.Value := 0;
   eSoma5.Value := 0;
   eSoma6.Value := 0;
   eSoma7.Value := 0;
   eSoma8.Value := 0;
   eCotacaoBem.Value := 0;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabBem.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsBem.Data  := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
      //----------------------------------------------------------------------------------
      cdsMoeda.Locate('IDTIPOMOEDA', 1, []);
      cdsPais.First;
      dbcmbMoeda.Text := cdsMoeda.FieldByName('MOEDESC').AsString;
      dbcmbPais.Text  := cdsPais.FieldByName('NOMEPAIS').AsString;
      CalculaSaldoContabil;
      eDataMov.SetFocus;
   end else
      LimpaTela;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabBem.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaTela;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabBem.edPlacaExit(Sender: TObject);
var
   iIdBem : Integer;

begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      iIdBem := Bem.PlacaIdBem(Sistema.IdEmpresa, edPlaca.Text);
      if iIdBem <= 0 then
      begin
         MsgDlg('Placa não Localizada','Erro', mtError, [mbOk], 0)
      end else
      begin
         cdsBem.Data := Bem.ListaBem(Sistema.IdEmpresa, iIdBem);
         //-------------------------------------------------------------------------------
         cdsMoeda.Locate('IDTIPOMOEDA', 1, []);
         cdsPais.First;
         dbcmbMoeda.Text := cdsMoeda.FieldByName('MOEDESC').AsString;
         dbcmbPais.Text  := cdsPais.FieldByName('NOMEPAIS').AsString;
         CalculaSaldoContabil;
         eDataMov.SetFocus;
      end
   end else
      LimpaTela;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabBem.CalculaSaldoContabil;
var
   fValOrg, fCmBem, fDepLanc, fCmDep,
   fReavValOrg, fReavCmBem, fReavDepLanc, fReavCmDep,
   fUltReavValOrg, fUltReavCmBem, fUltReavDepLanc, fUltReavCmDep,
   fDepLancAtu, fUltReavDepLancAtu : Extended;
   iIdGrupo, iIdLocalizacao, iIdResponsavel : Integer;

begin
   if Bem.SaldoContabilBem(cdsBem.FieldByName('IDPESSOA').AsInteger,
                           cdsBem.FieldByName('IDBEM').AsInteger,
                           eDataMov.Date,
                           cdsMoeda.FieldByName('MOECODIGO').AsInteger,
                           cdsPais.FieldByName('IDCAFPAISES').AsInteger,
                           fValOrg, fCmBem, fDepLanc, fCmDep,
                           fReavValOrg, fReavCmBem,
                           fReavDepLanc, fReavCmDep,
                           fUltReavValOrg, fUltReavCmBem,
                           fUltReavDepLanc, fUltReavCmDep,
                           fDepLancAtu, fUltReavDepLancAtu,
                           iIdGrupo, iIdLocalizacao, iIdResponsavel) then
   begin
      edAquisicao1.Value := fValorg;
      edAquisicao2.Value := fReavValOrg;
      edAquisicao3.Value := 0;
      edAquisicao4.Value := fCmBem + fReavCmBem;
      edAquisicao5.Value := fDepLancAtu;
      edAquisicao6.Value := fDepLanc + fReavDepLanc;
      edAquisicao7.Value := fCmDep + fReavCmDep;
      edAquisicao8.Value := fValOrg + fCmBem - fDepLanc - fCmDep +
                            fReavValOrg + fReavCmBem - fReavDepLanc - fReavCmDep;
      edReaval1.Value := 0;
      edReaval2.Value := fUltReavValOrg;
      edReaval3.Value := 0;
      edReaval4.Value := fUltReavCmBem;
      edReaval5.Value := fUltReavDepLancAtu;
      edReaval6.Value := fUltReavDepLanc;
      edReaval7.Value := fUltReavCmDep;
      edReaval8.Value := fUltReavValOrg + fUltReavCmBem -
                         fUltReavDepLanc - fUltReavCmDep;
      eSoma1.Value := edAquisicao1.Value + edReaval1.Value;
      eSoma2.Value := edAquisicao2.Value + edReaval2.Value;
      eSoma3.Value := edAquisicao3.Value + edReaval3.Value;
      eSoma4.Value := edAquisicao4.Value + edReaval4.Value;
      eSoma5.Value := edAquisicao5.Value + edReaval5.Value;
      eSoma6.Value := edAquisicao6.Value + edReaval6.Value;
      eSoma7.Value := edAquisicao7.Value + edReaval7.Value;
      eSoma8.Value := edAquisicao8.Value + edReaval8.Value;
      //----------------------------------------------------------------------------------
      eCotacaoBem.Value := BemCotacao.Valor(cdsBem.FieldByName('IDPESSOA').AsFloat,
                                            cdsBem.FieldByName('IDBEM').AsFloat,
                                            eDataMov.Date);
   end;
end;

procedure TfrmMTConsSaldoContabBem.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnSair.Enabled := False;
   Screen.Cursor := crSQLWait;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   CalculaSaldoContabil;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
   bbtnConfirmar.Enabled := True;
   bbtnSair.Enabled := True;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   GrupoContab.Free;
   Bem.Free;
   Bemcotacao.Free;
end;

end.
