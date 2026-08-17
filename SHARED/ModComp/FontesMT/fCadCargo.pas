//***************************************************************************************
//Rotina             : dbcmbRegimeJorTrab.Items
//N. SIG..........   : 38475.60434
//Data da Alteração: : 19/12/2017
//Alteração Form:    : fCadCargo
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Inclusão de novos itens ao componente denominado dbcmbRegimeJorTrab
//										 (Regime de Jornada de Trabalho).
//***************************************************************************************
{
******************************************************************************
DFM.........: MontaSelect
Nº SIG......: 58922
Data........: 26/11/2017
Responsável.: Andre Imakawa
Descrição...: Correção na query do Monta Select
//******************************************************************************
//Nº SOL: 259921/18014 - ER134
//Nº PPM: 1217940
//Data da Alteração: 08/03/2016
//Alteração Form: Inclusão dos campos Tipo e Ativo.
//Responsável: Michelle Suellyn Mota
//Descrição: Inclusão do campo Tipo e campo Ativo para atender as alterações
//           do eSocial.
//******************************************************************************
Nº SOL: 229871/16137
Nº PPM: 407073
Data da Alteração: 02/10/2014
Alteração Form: inclusão do campo regime jornada de trabalho.
Responsável: Felipe A. Santos
Descrição: inclusão do campo regime jornada de trabalho.
********************************************************************************
RESPONSÁVEL.: Marcio Sanches Spinosa
Nº SOL......: 149111
Nº KINTANA..: 1066131
Data........: 12/12/2012
Descrição...: Inclusão do campo Faixa Salarial PCS
********************************************************************************
}

unit fCadCargo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, ExtCtrls, DBCtrls, wwdblook, Mask, CmEventosCadastro, ImgList, DBClient,
  fCadastroMT, TREdit, uCMClientDataSet, uCtrlCargo, uCtrlCBO, uCtrlGrupFunc, uCtrlGrpTrein,
  uCtrlFaixaSal, uCtrlGlobalRH, uCtrlTabelaHay, uCMTypes, wwdbedit,
  Wwdotdot, Wwdbcomb;

type
  TfrmCadCargo = class(TFrmCadastroMT)
    CdsGrupo: TCMClientDataSet;
    CdsFaixa: TCMClientDataSet;
    lblCod: TLabel;
    dbedCodigo: TDBEdit;
    lblPontosHay: TLabel;
    dbrePontosHay: TDBRealEdit;
    lblFaixaSal: TLabel;
    dblcFaixaSal: TwwDBLookupCombo;
    lblValorHay: TLabel;
    redValorHay: TRealEdit;
    Label2: TLabel;
    dbedTitulo: TDBEdit;
    Label3: TLabel;
    dbedCBO2002: TDBEdit;
    lblGrupo: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    lblDescricao: TLabel;
    dbmemDescr: TDBMemo;
    edCBO2002: TEdit;
    bbtnProcCBO2002: TBitBtn;
    MontaSelectCBO1994: TMontaSelect;
    MontaSelectCBO2002: TMontaSelect;
    lblFaixaSalarialPCS: TLabel;
    dbedtCODFAIXAPCS: TDBEdit;
    dsFaixa: TwwDataSource;
    lblRegimeJorTrab: TLabel;
    dbcmbRegimeJorTrab: TwwDBComboBox;
    dbrgrpFLGTIPO: TDBRadioGroup;
    dbchkFLGATIVO: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure bbtnProcCBO1994Click(Sender: TObject);
    procedure bbtnProcCBO2002Click(Sender: TObject);
    procedure dbedCBO1994Exit(Sender: TObject);
    procedure dbedCBO2002Exit(Sender: TObject);
    procedure dbedCBO1994Enter(Sender: TObject);
    procedure dbedCBO2002Enter(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dblcFaixaSalChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlCargo: TCtrlCargo;
    CtrlCBO: TCtrlCBO;
    CtrlGrupFunc: TCtrlGrupFunc;
    CtrlGrpTrein: TCtrlGrpTrein;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlTabelaHay: TCtrlTabelaHay;

    sIdCBO_OLD: string;
    IndPolitica: integer;
    iHelp : integer; // Felipe A. Santos SOL 229871.16137 PPM 407073
    procedure Sel(IdCargo: double);
    procedure SelCBO1994(IdCBO: string; MudarID: boolean = true);
    procedure SelCBO2002(IdCBO: string; MudarID: boolean = true);
    function  GravarRegistro: boolean;
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

uses uSistema, uMensErro, uCtrlPadroes, dCds, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadCargo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlCBO := TCtrlCBO.Create;
  CtrlCBO.InitializeAs(Padroes);

  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);

  CtrlGrpTrein := TCtrlGrpTrein.Create;
  CtrlGrpTrein.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);
  CtrlCargo.CdsCargo := Cds;

  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);

  if (Sistema.IdModulo in [MODFOL, MODBAS, MODCES]) then
    CdsFaixa.Data := CtrlFaixaSal.ListFaixaSal;

  Sel(-1);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('INDPOLITICA');
  IndPolitica := dmCds.Cds.FieldByName('INDPOLITICA').asInteger;

  lblFaixaSal.Visible  := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 0);
  dblcFaixaSal.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 0);

  lblPontosHay.Visible  := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);
  dbrePontosHay.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);

  lblValorHay.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);
  redValorHay.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);

  lblGrupo.Visible := (Sistema.IdModulo in [MODAVA, MODTRN, MODCES]);
  dblcGrupo.Visible := (Sistema.IdModulo in [MODAVA, MODTRN, MODCES]);

  // Felipe A. Santos SOL 229871.16137 - início
  lblRegimeJorTrab.Visible :=(Sistema.IdModulo in [MODFOL, MODBAS]);
  dbcmbRegimeJorTrab.Visible :=(Sistema.IdModulo in [MODFOL, MODBAS]);
  // Felipe A. Santos SOL 229871.16137 - fim

  case (Sistema.IdModulo) of
    MODAVA : HelpContext := 700002;
    MODBAS : HelpContext := 690009;
    MODCES : HelpContext := 740002;
    MODFOL : HelpContext := 210013;
    MODTRN : HelpContext := 720009;
  end;

  if (Sistema.IdModulo in [MODAVA, MODCES]) then
  begin
    lblGrupo.Caption := 'Grupo Funcional';
    dblcGrupo.DataField := 'CODGRPFUNC';
    dblcGrupo.LookupField := 'CODGRPFUNC';
    dblcGrupo.Selected.Clear;
    dblcGrupo.Selected.Add('DESCGRPFUNC'+#9+'40'+#9+'DESCGRPFUNC');
    CdsGrupo.Data := CtrlGrupFunc.ListGrupoFunc;
  end
  else
  if (Sistema.IdModulo = MODTRN) then
  begin
    lblGrupo.Caption := 'Grupo de Trein.';
    dblcGrupo.DataField := 'CODGRPTREIN';
    dblcGrupo.LookupField := 'CODGRPTREIN';
    dblcGrupo.Selected.Clear;
    dblcGrupo.Selected.Add('DESCGRPTREIN'+#9+'40'+#9+'DESCGRPTREIN');
    CdsGrupo.Data := CtrlGrpTrein.ListGrpTrein;
  end;

  if (Sistema.IdModulo in [MODAVA, MODTRN, MODCES]) then
  begin
    lblDescricao.Top := 156;
    dbmemDescr.Top := 170;
    Self.Height := 409;
  end;

  if (Sistema.IdModulo in [MODFOL, MODBAS]) then
  begin
  //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
//    lblDescricao.Top := 130;
    //lblDescricao.Top := 156; // Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    lblDescricao.Top := 192; // Michelle Mota - SOL: 259921.18014 - PPM: 1217940
//    dbmemDescr.Top := 144;
    //dbmemDescr.Top := 170;// Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    dbmemDescr.Top := 208;// Michelle Mota - SOL: 259921.18014 - PPM: 1217940
//    Self.Height := 382;
    Self.Height := 440;

    // Felipe A. Santos SOL 229871.16137 - início
    {lblFaixaSalarialPCS.Top := lblGrupo.Top;
    dbedtCODFAIXAPCS.Top := dblcGrupo.top;}

    // Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
    {lblFaixaSalarialPCS.Top := lblCod.Top;
    dbedtCODFAIXAPCS.Top := dbedCodigo.Top;
    lblFaixaSalarialPCS.Left := 194;
    dbedtCODFAIXAPCS.Left := lblFaixaSalarialPCS.Left + lblFaixaSalarialPCS.Width + 5; }
    
    lblFaixaSalarialPCS.Top := lblCod.Top;
    dbedtCODFAIXAPCS.Top := dbedCodigo.Top;
    lblFaixaSalarialPCS.Left := 390;
    dbedtCODFAIXAPCS.Left := lblFaixaSalarialPCS.Left + lblFaixaSalarialPCS.Width + 5;

    lblFaixaSal.Top := lblCod.Top;
    dblcFaixaSal.Top := dbedCodigo.Top;
    lblFaixaSal.Left := 184;
    dblcFaixaSal.Left := lblFaixaSal.Left + lblFaixaSal.Width + 5;

    dbrgrpflgtipo.Visible := True;
    dbchkflgativo.Visible := True;
    dbrgrpflgtipo.Top := 142;
    dbchkflgativo.Top := 155;
    // Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940

    lblRegimeJorTrab.Top := lblGrupo.Top;
    dbcmbRegimeJorTrab.Top := dblcGrupo.Top;

    bbtnAjuda.HelpContext := 210012;
    HelpContext := 210012;
    iHelp := 210012;      //William Santana - SOL 229871.16137 - PPM 407073
    // Felipe A. Santos SOL 229871.16137 - fim
  end;
 //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim

end;

procedure TfrmCadCargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlGrpTrein);
  FreeAndNil(CtrlGrupFunc);
  FreeAndNil(CtrlCBO);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlTabelaHay);
  inherited;
end;

procedure TfrmCadCargo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCargo.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Sender);
end;

procedure TfrmCadCargo.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadCargo.CmeCadastroAfterConfirma(Sender: TObject);
begin
 //inherited;
end;

procedure TfrmCadCargo.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCargo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCargo.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
  if (Accept) then
  begin
    // edCBO1994.Text := '';
    edCBO2002.Text := '';
  end;
end;

procedure TfrmCadCargo.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadCargo.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (IndPolitica = 1) then
    redValorHay.Value := CtrlTabelaHay.GetValorHay(Cds.FieldByName('IDCARGO').asInteger);
end;

procedure TfrmCadCargo.dbedCBO1994Enter(Sender: TObject);
begin
  // sIdCBO_OLD := dbedCBO1994.Text;
end;

procedure TfrmCadCargo.dbedCBO2002Enter(Sender: TObject);
begin
  sIdCBO_OLD := dbedCBO2002.Text;
end;

procedure TfrmCadCargo.dbedCBO1994Exit(Sender: TObject);
begin
{  if (sIdCBO_OLD <> dbedCBO1994.Text) then
  begin
    SelCBO1994(dbedCBO1994.Text);
    sIdCBO_OLD := dbedCBO1994.Text;
    if (edCBO1994.Text = '') then
      Cds.FieldByName('CBO').asString := '';
  end;
}
end;

procedure TfrmCadCargo.dbedCBO2002Exit(Sender: TObject);
begin
  if (sIdCBO_OLD <> dbedCBO2002.Text) then
  begin
    SelCBO2002(dbedCBO2002.Text);
    sIdCBO_OLD := dbedCBO2002.Text;
    if (edCBO2002.Text = '') then
      Cds.FieldByName('CBO2002').asString := '';
  end;
end;

procedure TfrmCadCargo.bbtnProcCBO1994Click(Sender: TObject);
begin
  MontaSelectCBO1994.Executar;
  if (MontaSelectCBO1994.RetornouValor) then
    SelCBO1994(MontaSelectCBO1994.ValoresChave[0]);
end;

procedure TfrmCadCargo.bbtnProcCBO2002Click(Sender: TObject);
begin
  MontaSelectCBO2002.Executar;
  if (MontaSelectCBO2002.RetornouValor) then
    SelCBO2002(MontaSelectCBO2002.ValoresChave[0]);
end;

procedure TfrmCadCargo.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedTitulo.Text) = '') then
  begin
    MsgDlg('Preencha o Título.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dbedTitulo.SetFocus;
  end
  else
  // Felipe A. Santos SOL 229871.16137 - início
  if (dbcmbRegimeJorTrab.Text = '') and (Sistema.IdModulo in [MODFOL, MODBAS]) then
  begin
    MsgDlg('Selecione o Regime de Jornada de Trabalho.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dbcmbRegimeJorTrab.SetFocus;
  end
  // Felipe A. Santos SOL 229871.16137 - fim
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadCargo.Sel(IdCargo: double);
begin
//Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
//     Cds.Data := CtrlCargo.ListCargo(IdCargo);
     Cds.Data := CtrlCargo.ListCargo(IdCargo, 0, 0, 0, '', '', (Sistema.IdModulo in [MODFOL]));

     if not cds.isEmpty then
     begin
       cdsFaixa.Locate('CODFAIXAPCS', cds.FieldByName('CODFAIXAPCS').AsString, []);
       dblcFaixaSal.OnChange(dblcFaixaSal);
     end;
//Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim

  SelCBO1994(Cds.FieldByName('CBO').asString);
  SelCBO2002(Cds.FieldByName('CBO2002').asString);
end;

procedure TfrmCadCargo.SelCBO1994(IdCBO: string; MudarID: boolean);
begin
  if (IdCBO <> '') then
  //begin
    dmCds.Cds.Data := CtrlCBO.ListGeral(StrToFloat(IdCBO));
    //edCBO1994.Text := dmCds.Cds.FieldByName('DESCRICAO').asString;
  //end
  //else
    //edCBO1994.Text := '';

  if (MudarID) and (Cds.State in [dsInsert,dsEdit]) then
    Cds.FieldByName('CBO').asString := IdCBO;
end;

procedure TfrmCadCargo.SelCBO2002(IdCBO: string; MudarID: boolean);
begin
  if (IdCBO <> '') then
  begin
    dmCds.Cds.Data := CtrlCBO.ListGeral(StrToFloat(IdCBO));
    edCBO2002.Text := dmCds.Cds.FieldByName('DESCRICAO').asString;
  end
  else
    edCBO2002.Text := '';

  if (MudarID) and (Cds.State in [dsInsert,dsEdit]) then
    Cds.FieldByName('CBO2002').asString := IdCBO;
end;

function TfrmCadCargo.GravarRegistro: boolean;
begin
  Result := CtrlCargo.GravarCargo;
  if not(Result) then
//Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Inicio
//    raise Exception.Create(CtrlCargo.MessageInfo);
    if (Pos('XPKCARGO', CtrlCargo.MessageInfo)> 0) then
       ShowMessage('Código já existente.');
    if (Pos('registro filho localizado', CtrlCargo.MessageInfo) > 0) then
       ShowMessage('Não é possível excluir o registro.');
//Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - fim
end;

procedure TfrmCadCargo.dblcFaixaSalChange(Sender: TObject);
begin
  //Marcio Sanches Spinosa SOL 149111 Kintana 1066131
  dbedtCODFAIXAPCS.Text := CdsFaixa.FieldByName('CODFAIXAPCS').AsString;
end;

procedure TfrmCadCargo.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao <> opApagar) then
  begin
     Sel(-1);
     CmeCadastro.AtualizaBotoes(Self);
  end;
end;
 //Marcio Sanches Spinosa SOL 149111 Kintana 1066131 - Fim
procedure TfrmCadCargo.sbtnProcurarClick(Sender: TObject);
begin
//  CdsFaixa.Data:= '';
  if (Sistema.IdModulo in [MODFOL, MODBAS, MODCES]) then
    CdsFaixa.Data := CtrlFaixaSal.ListFaixaSal;
  inherited;
//  dblcFaixaSal.OnChange(dblcFaixaSal);
end;
// Início - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
procedure TfrmCadCargo.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGATIVO').AsString := 'S';
  cds.FieldByName('FLGTIPO').AsString := 'C';
end;

procedure TfrmCadCargo.MontaSelectBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
begin
  inherited;
  sqlText := StringReplace(sqlText,'cargo.flgativo as c5','case cargo.flgativo when ''S'' then ''Ativo'' when ''N'' then ''Inativo'' end as C5',[rfReplaceAll, rfIgnoreCase]);
  sqlText := StringReplace(sqlText,'cargo.flgtipo as c6','case cargo.flgtipo when ''C'' then ''Cargo'' when ''F'' then ''Função'' end as C6',[rfReplaceAll, rfIgnoreCase]);
end;
// Término - Michelle Mota - SOL: 259921.18014 - PPM: 1217940
end.

