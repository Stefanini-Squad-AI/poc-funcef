{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina      : (dfm MSBem dbePatrimonio)
Pendência   : 116473
Responsável : Edilaine
Data        : 25/06/2021
Descrição   : Alterar filtro de bem acrescentando Nº RFID (BEM.PLACA) e
              Nº Patrimônio (BEM.PATRIMONIO)
--------------------------------------------------------------------------------
Pendência   : 24911
Responsável : Daniel Simões
Data        : 27/03/2007
Descrição   : Passa a exibir informação de Status do Bem como está sendo exibido
              atualmente no form Cadastro de Bem.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fMTConsCadBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, 
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Mask, fcLabel,
  ComCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdbedit, DBCtrls, MontaSelect, Db,
  Wwdatsrc, DBTables, Wwquery, TB97Ctls, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, uCMClientDataSet, uCmSqlParams,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlConjunto, uCtrlBem,
  uCtrlBemCotacao, IvEMulti;

type
  TfrmMTConsCadBens = class(TfrmSairAjuda)
    Label3: TLabel;
    dbeDescConjunto: TDBMemo;
    Label4: TLabel;
    dbeDescLocalizacao: TwwDBEdit;
    Label5: TLabel;
    dbeNomeResponsavel: TwwDBEdit;
    dbgRateio: TwwDBGrid;
    Label6: TLabel;
    pgctlBem: TPageControl;
    TabIdent: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    lblStatus: TfcLabel;
    dbeDescClasse: TwwDBEdit;
    TabDocAquis: TTabSheet;
    Label49: TLabel;
    Label44: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label9: TLabel;
    Label48: TLabel;
    dbeFornec: TwwDBEdit;
    dbeTerceiro: TwwDBEdit;
    TabContab: TTabSheet;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    dbeDescGrupo: TwwDBEdit;
    dbeDescSubConta: TwwDBEdit;
    dbeAtivProj: TwwDBEdit;
    TabValores: TTabSheet;
    dbgBens: TwwDBGrid;
    dbeDesBem: TDBMemo;
    dbeDtaInclusao: TCMDateTimePicker;
    dbeIdNota: TwwDBEdit;
    dbeComplNota: TwwDBEdit;
    dbeDtaNota: TCMDateTimePicker;
    dbeDataIniDep: TCMDateTimePicker;
    dbeTaxaDep: TDBRealEdit;
    dbeValHistorico: TDBRealEdit;
    dbeSituacao: TwwDBEdit;
    bbtnSelBem: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    pnlPlaca: TPanel;
    Label13: TLabel;
    dbePlaca: TwwDBEdit;
    Label28: TLabel;
    dbeNumSerie: TwwDBEdit;
    Label43: TLabel;
    dbeOpcional: TwwDBEdit;
    bbtnLivros: TBitBtn;
    pnlLivros: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Ano: TLabel;
    bbtnRetornaPlaca: TBitBtn;
    dbePubAutor: TwwDBEdit;
    dbePubEditora: TwwDBEdit;
    dbePubAno: TwwDBEdit;
    Label50: TLabel;
    Label51: TLabel;
    dbeProcesso: TwwDBEdit;
    dbeEmpenho: TwwDBEdit;
    Panel1: TPanel;
    edControle: TEdit;
    dsBem: TwwDataSource;
    cdsBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    dsRateioN: TwwDataSource;
    cdsRateioN: TCMClientDataSet;
    sqlRateioN: TCMSqlParams;
    dsConjunto: TwwDataSource;
    cdsConjunto: TCMClientDataSet;
    MSConjunto: TMontaSelect;
    sqlBem: TCMSqlParams;
    Label54: TLabel;
    dbeDtaContab: TCMDateTimePicker;
    pnlValores: TPanel;
    fcLabel2: TfcLabel;
    fcLabel3: TfcLabel;
    fcLabel4: TfcLabel;
    fcLabel5: TfcLabel;
    fcLabel6: TfcLabel;
    fcLabel8: TfcLabel;
    fcLabel10: TfcLabel;
    fcLabel11: TfcLabel;
    fcLabel12: TfcLabel;
    eSoma1: TRealEdit;
    eSoma2: TRealEdit;
    eSoma4: TRealEdit;
    eSoma6: TRealEdit;
    eSoma7: TRealEdit;
    eSoma8: TRealEdit;
    edAquisicao1: TRealEdit;
    edAquisicao2: TRealEdit;
    edAquisicao4: TRealEdit;
    edAquisicao6: TRealEdit;
    edAquisicao7: TRealEdit;
    edAquisicao8: TRealEdit;
    edReaval1: TRealEdit;
    edReaval2: TRealEdit;
    edReaval4: TRealEdit;
    edReaval6: TRealEdit;
    edReaval7: TRealEdit;
    edReaval8: TRealEdit;
    cdsUltFechamento: TCMClientDataSet;
    sqlUltFechamento: TCMSqlParams;
    Dock972: TDock97;
    lblUltDep: TfcLabel;
    Toolbar971: TToolbar97;
    bbtnSelConjunto: TToolbarButton97;
    bbtnSelConjBem: TToolbarButton97;
    eCotacaoBem: TRealEdit;
    lblCotacaoBem: TfcLabel;
    dbePatrimonio: TwwDBEdit;
    Label2: TLabel;
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure dbgBensDblClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgBensTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure bbtnSelConjBemClick(Sender: TObject);
    procedure pgctlBemChange(Sender: TObject);
    procedure bbtnLivrosClick(Sender: TObject);
    procedure bbtnRetornaPlacaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsBemAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    Conjunto : TCtrlConjunto;
    Bem      : TCtrlBem;
    BemCotacao : TCtrlBemCotacao;
    procedure CalculaSaldoContabil;
  public
    { Public declarations }
  end;

var
  frmMTConsCadBens: TfrmMTConsCadBens;

implementation

{$R *.DFM}

uses uSistema, uMensErro;

//========================================================================================
procedure TfrmMTConsCadBens.FormCreate(Sender: TObject);
begin
   inherited;
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   BemCotacao := TCtrlBemCotacao.Create;
   BemCotacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   sqlUltFechamento.Prepare;
   sqlUltFechamento.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   sqlUltFechamento.Open;
   lblUltDep.Caption := 'Último Fechamento : ' + cdsUltFechamento.FieldByName('ULTDEP').AsString;
   cdsUltFechamento.Close;
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
   lblStatus.Caption := '';
end;
//========================================================================================
procedure TfrmMTConsCadBens.FormShow(Sender: TObject);
begin
   inherited;
   pnlFundo.Enabled := False;
   pgctlBem.ActivePage := TabIdent;
   pgctlBem.SendToBack;
   bbtnSelBem.Enabled := False;
   lblCotacaoBem.Caption := 'Valor de Mercado';
   bbtnSair.SetFocus;
end;
//========================================================================================
procedure TfrmMTConsCadBens.bbtnSelConjuntoClick(Sender: TObject);
begin
   bbtnSelBem.Enabled := False;
   dbgBens.Visible    := True;
   dbgBens.BringToFront;
   //-------------------------------------------------------------------------------------
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 StrToFloat(MSConjunto.ValoresChave[0]));
      cdsRateioN.Data  := Conjunto.ListaRateioCustos(cdsConjunto.FieldByName('IDPESSOA').AsFloat,
                                                     cdsConjunto.FieldByName('IDCONJUNTO').AsFloat);
      //----------------------------------------------------------------------------------
      sqlBem.Prepare;
      sqlBem.ParamByName('IDPESSOA').AsFloat   := cdsConjunto.FieldByName('IDPESSOA').AsFloat;
      sqlBem.ParamByName('IDCONJUNTO').AsFloat := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
      sqlBem.ParamByName('MOECODIGO').AsFloat  := ParamCAF.MOEDAOFICIAL;
      sqlBem.ParamByName('IDTAXADEP').AsFloat  := 1;
      sqlBem.Open;
      //----------------------------------------------------------------------------------
      pnlFundo.Enabled := True;
      dbgBens.SetFocus;
   end else
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
      cdsRateioN.Data  := Conjunto.ListaRateioCustos(Sistema.IdEmpresa, 0);
      //----------------------------------------------------------------------------------
      sqlBem.Prepare;
      sqlBem.ParamByName('IDPESSOA').AsFloat   := Sistema.IdEmpresa;
      sqlBem.ParamByName('IDCONJUNTO').AsFloat := 0;
      sqlBem.ParamByName('MOECODIGO').AsFloat  := ParamCAF.MOEDAOFICIAL;
      sqlBem.ParamByName('IDTAXADEP').AsFloat  := 1;
      sqlBem.Open;
      pnlFundo.Enabled := False;
   end;
   bbtnSelConjunto.Down := False;
end;
//========================================================================================
procedure TfrmMTConsCadBens.bbtnSelConjBemClick(Sender: TObject);
begin
   bbtnSelBem.Enabled := False;
   dbgBens.Visible    := True;
   dbgBens.BringToFront;
   //-------------------------------------------------------------------------------------
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 StrToFloat(MSBem.ValoresChave[5]));
      cdsRateioN.Data  := Conjunto.ListaRateioCustos(cdsConjunto.FieldByName('IDPESSOA').AsFloat,
                                                     cdsConjunto.FieldByName('IDCONJUNTO').AsFloat);
      //----------------------------------------------------------------------------------
      sqlBem.Prepare;
      sqlBem.ParamByName('IDPESSOA').AsFloat   := cdsConjunto.FieldByName('IDPESSOA').AsFloat;
      sqlBem.ParamByName('IDCONJUNTO').AsFloat := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
      sqlBem.ParamByName('MOECODIGO').AsFloat  := ParamCAF.MOEDAOFICIAL;
      sqlBem.ParamByName('IDTAXADEP').AsFloat  := 1;
      sqlBem.Open;
      //----------------------------------------------------------------------------------
      cdsBem.Locate('IDBEM', StrToInt(MSBem.ValoresChave[1]),[]);
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      pnlFundo.Enabled := True;
      dbgBens.OnDblClick(Self);
   end else
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa, 0);
      cdsRateioN.Data  := Conjunto.ListaRateioCustos(Sistema.IdEmpresa, 0);
      //----------------------------------------------------------------------------------
      sqlBem.Prepare;
      sqlBem.ParamByName('IDPESSOA').AsFloat   := Sistema.IdEmpresa;
      sqlBem.ParamByName('IDCONJUNTO').AsFloat := 0;
      sqlBem.ParamByName('MOECODIGO').AsFloat  := ParamCAF.MOEDAOFICIAL;
      sqlBem.ParamByName('IDTAXADEP').AsFloat  := 1;
      sqlBem.Open;
      pnlFundo.Enabled := False;
   end;
   bbtnSelConjBem.Down := False;
end;
//========================================================================================
procedure TfrmMTConsCadBens.cdsBemAfterScroll(DataSet: TDataSet);
begin
  inherited;

// Daniel - 24911 - Início -----------------------------------------------------
  if (cdsBem.FieldByname('BAIXATOTAL').AsString='S') then begin
    lblStatus.Caption    := 'Baixado';
    lblStatus.Font.Color := clRed;
  end else begin
    if (cdsBem.FieldByname('FLGSAIDATEMP').AsInteger=1) then begin
      lblStatus.Caption    := 'Em Saída Temporária';
      lblStatus.Font.Color := clRed;
    end else begin
      if (cdsBem.FieldByname('FLGPENHORA').AsInteger=1) then begin
        lblStatus.Caption    := 'Penhorado';
        lblStatus.Font.Color := clRed;
      end else begin
        lblStatus.Caption    := 'Ativo';
        lblStatus.Font.Color := clBlue;
      end;
    end;
  end;
// Daniel - 24911 - Fim --------------------------------------------------------

  //-------------------------------------------------------------------------------------
  if cdsBem.FieldByname('CONTROLE').AsString = 'T' then
  begin
    edControle.Text := 'Total';
  end else
  begin
    edControle.Text := 'Físico';
  end;
end;
//========================================================================================
procedure TfrmMTConsCadBens.CalculaSaldoContabil;
var
   fValOrg, fCmBem,
   fDepLanc, fCmDep,
   fReavValOrg, fReavCmBem,
   fReavDepLanc, fReavCmDep,
   fUltReavValOrg, fUltReavCmBem,
   fUltReavDepLanc, fUltReavCmDep,
   fDepLancAtu, fUltReavDepLancAtu          : Extended;
   iIdGrupo, iIdLocalizacao, iIdResponsavel : Integer;
   dDataCotacao : TDateTime;

begin
   if Bem.SaldoContabilBem(cdsBem.FieldByName('IDPESSOA').AsInteger,
                           cdsBem.FieldByName('IDBEM').AsInteger,
                           date,
                           ParamCAF.MOEDAOFICIAL, 1,
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
      edAquisicao4.Value := fCmBem + fReavCmBem;
      edAquisicao6.Value := fDepLanc + fReavDepLanc;
      edAquisicao7.Value := fCmDep + fReavCmDep;
      edAquisicao8.Value := fValOrg + fCmBem - fDepLanc - fCmDep +
                            fReavValOrg + fReavCmBem - fReavDepLanc - fReavCmDep;
      edReaval1.Value := 0;
      edReaval2.Value := fUltReavValOrg;
      edReaval4.Value := fUltReavCmBem;
      edReaval6.Value := fUltReavDepLanc;
      edReaval7.Value := fUltReavCmDep;
      edReaval8.Value := fUltReavValOrg + fUltReavCmBem - fUltReavDepLanc - fUltReavCmDep;
      eSoma1.Value := edAquisicao1.Value + edReaval1.Value;
      eSoma2.Value := edAquisicao2.Value + edReaval2.Value;
      eSoma4.Value := edAquisicao4.Value + edReaval4.Value;
      eSoma6.Value := edAquisicao6.Value + edReaval6.Value;
      eSoma7.Value := edAquisicao7.Value + edReaval7.Value;
      eSoma8.Value := edAquisicao8.Value + edReaval8.Value;
      //----------------------------------------------------------------------------------
      eCotacaoBem.Value := BemCotacao.Ultima(cdsBem.FieldByName('IDPESSOA').AsFloat, cdsBem.FieldByName('IDBEM').AsFloat, dDataCotacao);
      if dDataCotacao > 0 then
         lblCotacaoBem.Caption := 'Valor de Mercado em ' + datetostr(dDataCotacao)
      else
         lblCotacaoBem.Caption := 'Valor de Mercado';
   end;
end;
//========================================================================================
procedure TfrmMTConsCadBens.dbgBensDblClick(Sender: TObject);
begin
   inherited;
   CalculaSaldoContabil;
   //-------------------------------------------------------------------------------------
   bbtnSelBem.Enabled  := True;
   dbgBens.SendToBack;
   dbgBens.Visible     := False;
   pgctlBem.ActivePage := TabIdent;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTConsCadBens.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   bbtnSelBem.Enabled := False;
   dbgBens.Visible    := True;
   dbgBens.BringToFront;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTConsCadBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   Bem.Free;
   Conjunto.Free;
   BemCotacao.Free;
end;
//========================================================================================
procedure TfrmMTConsCadBens.dbgBensTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;
   cdsBem.Close;
   //-------------------------------------------------------------------------------------
   if aFieldName = 'PLACA' then
      sqlBem.SQL.Strings[32] := 'ORDER BY B.PLACA'
   else
   if aFieldName = 'DESBEM' then
      sqlBem.SQL.Strings[32] := 'ORDER BY B.DESBEM'
   else
   if aFieldName = 'DTAINCLUSAO' then
      sqlBem.SQL.Strings[32] := 'ORDER BY B.DTAINCLUSAO, B.DESBEM'
   else
      sqlBem.SQL.Strings[32] := ' ';
   //-------------------------------------------------------------------------------------
   sqlBem.Prepare;
   sqlBem.ParamByName('IDPESSOA').AsFloat   := cdsConjunto.FieldByName('IDPESSOA').AsFloat;
   sqlBem.ParamByName('IDCONJUNTO').AsFloat := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat;
   sqlBem.ParamByName('MOECODIGO').AsFloat  := ParamCAF.MOEDAOFICIAL;
   sqlBem.ParamByName('IDTAXADEP').AsFloat  := 1;
   sqlBem.Open;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTConsCadBens.pgctlBemChange(Sender: TObject);
begin
   inherited;
   pnlPlaca.BringToFront;
end;
//========================================================================================
procedure TfrmMTConsCadBens.bbtnLivrosClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.SendToBack;
end;
//========================================================================================
procedure TfrmMTConsCadBens.bbtnRetornaPlacaClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.BringToFront;
end;

end.
