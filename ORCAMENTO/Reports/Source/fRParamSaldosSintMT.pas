{ ------------------------------------------------------------------------------
Rotina......: formCreate
Nº SOL......: 163982/7003
Nº KINTANA..: 1489901
Data........: 22/11/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
-------------------------------------------------------------------------------}
{******************************************************************************}
{* Marcio Motta - 31/03/2005                                                  *}
{* Pendência 18032                                                            *}
{******************************************************************************}

unit fRParamSaldosSintMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, ComCtrls, CMTree, TREdit,
  CMDBLookupCombo, wwdbedit, Wwdbspin, Mask, wwdblook, MontaSelect,
  mPlanoOrcamentarioMT,
  uCtrlTransacoesPorGrupo, uCtrlPadroes;

type
  TfrmRParamSaldosSintMT = class(TfrmParamReports_Padrao)
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label6: TLabel;
    dblkPeriodoFim: TwwDBLookupCombo;
    lblGrupo: TLabel;
    lblCenario: TLabel;
    dblcCenario: TCMDBLookupCombo;
    lblValoresPor: TLabel;
    reDividirPor: TRealEdit;
    dsGrupo: TwwDataSource;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsCenario: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    sqlPeriodoIni: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    sqlGrupo: TCMSqlParams;
    sqlCenario: TCMSqlParams;
    cdsPeriodoIniPERIODO: TFloatField;
    cdsPeriodoIniNOMEPERIODO: TStringField;
    cdsGrupoIDGRUPOORCAMEN: TFloatField;
    cdsGrupoNOMEGRUPOORCAMEN: TStringField;
    cdsGrupoFLGANALSINT: TStringField;
    cdsGrupoCODGRUPOORC: TStringField;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    cboGrupoOrcamen: TwwDBLookupCombo;
    CdsPlano: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    cboCCusto: TwwDBLookupCombo;
    Label1: TLabel;
    cboAtvProj: TwwDBLookupCombo;
    Label2: TLabel;
    cboPlano: TwwDBLookupCombo;
    Label5: TLabel;
    cboPatro: TwwDBLookupCombo;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo: TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;

var
  frmRParamSaldosSintMT: TfrmRParamSaldosSintMT;

implementation

uses UModulo, uData, uSistema, uFuncaoGeral, UCtrlOrcamento, uMensErro;

{$R *.DFM}

procedure TfrmRParamSaldosSintMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);

  CdsPlano.Data    := CtrlTransacoesPorGrupo.ListaPlano;
  CdsPatro.Data    := CtrlTransacoesPorGrupo.ListaPatro;
  CdsCCusto.Data   := CtrlTransacoesPorGrupo.ListaCCusto(Sistema.IdEmpresa);
  //Vinicius Maciel - SOL 163982/7003 - KTN 1489901
  //CdsAtivProj.Data := CtrlTransacoesPorGrupo.ListaAtivProj(Sistema.IdEmpresa,tuAnalitico);
  CdsAtivProj.Data := CtrlTransacoesPorGrupo.ListaAtivProj(Sistema.IdEmpresa,tuAnalitico,'S');
  //Vinicius Maciel - SOL 163982/7003 - KTN 1489901 - FIM
  with sqlExercicio do
    begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
    end;

  with sqlPeriodoIni do
    begin
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := Year(Date);
      Open;
    end;

  with sqlPeriodoFim do
    begin
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := Year(Date);
      Open;
    end;

  sqlCenario.Prepare;
  sqlCenario.Open;

  with molPlanoOrcamentario,sqlPlanoOrcamen do
    begin
       Prepare;
       Open;
    end;

  with sqlGrupo do
    begin
      cdsGrupo.Close;
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Open;
    end;

end;




procedure TfrmRParamSaldosSintMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
  //Preenche a combobox de período
  if Trim(dblkExercicio.text) <> '' then
    begin
      with sqlPeriodoIni do
        begin
          cdsPeriodoIni.Close;
          Prepare;
          ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
          ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
          Open;
        end;

      with sqlPeriodoFim do
        begin
          cdsPeriodoFim.Close;
          Prepare;
          ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
          ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
          Open;
        end;
   end;
end;







procedure TfrmRParamSaldosSintMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then
   begin
     MsgDlg('O plano Orçamentário deve ser definido.','Erro',mtError,[mbOk],0);
     ModalResult := mrNone;
     Exit;
   end;

   if (Trim(dblkPeriodoIni.text) = '') or (Trim(dblkPeriodoFim.text) = '') then
   begin
     MsgDlg('Os Períodos devem ser preenchidos.','Erro',mtError,[mbOk],0);
     ModalResult := mrNone;
     Exit;
   end;

   if StrToInt(dblkPeriodoIni.lookupvalue) > StrToInt(dblkPeriodoFim.lookupvalue) then
   begin
     MsgDlg('O Período Inicial deve ser menor ou igual ao Período Final.', 'Erro',mtError,[mbOk],0);
     ModalResult := mrNone;
     Exit;
   end;

   if OrcamentoBackMT.DiasNoPeriodo(StrToInt(dblkExercicio.text),StrToInt(dblkPeriodoIni.lookupvalue)) = 0 then
   begin
     MsgDlg('O Período Inicial não existe para o Exercício selecionado.', 'Erro',mtError,[mbOk],0);
     ModalResult := mrNone;
     Exit;
   end;

   if OrcamentoBackMT.DiasNoPeriodo(StrToInt(dblkExercicio.text),StrToInt(dblkPeriodoFim.lookupvalue)) = 0 then
   begin
     MsgDlg('O Período Final não existe para o Exercício selecionado.', 'Erro',mtError,[mbOk],0);
     ModalResult := mrNone;
     Exit;
   end;




   Cmp_Padrao.ParamValues[0].AsInteger := StrToInt(dblkExercicio.LookupValue);
   Cmp_Padrao.ParamValues[1].AsInteger := StrToInt(dblkPeriodoIni.LookupValue);
   Cmp_Padrao.ParamValues[2].AsInteger := StrToInt(dblkPeriodoFim.LookupValue);
   Cmp_Padrao.ParamValues[3].AsString  := '';//##
   Cmp_Padrao.ParamValues[4].AsString  := '';//##

   // Monta a string de parâmetros obrigatórios
   Cmp_Padrao.ParamValues[15].AsString := 'Período: ' + dblkPeriodoIni.Text + ' a ' + dblkPeriodoFim.Text + ' / ' + dblkExercicio.Text + '      ';

   // Grupo
   if (Trim(cboGrupoOrcamen.Text) = '') then
      Cmp_Padrao.ParamValues[5].AsInteger := -1
   else
   begin
      Cmp_Padrao.ParamValues[5].AsInteger := StrToIntDef(cboGrupoOrcamen.LookupValue,-1);
      Cmp_Padrao.ParamValues[16].AsString := 'Grupo Orçamentário: ' + cboGrupoOrcamen.Text + '      ';
   end;

   Cmp_Padrao.ParamValues[6].AsInteger := 0;//##


   if reDividirPor.Value = 0 then
     Cmp_Padrao.ParamValues[9].AsFloat := 1
   else
     Cmp_Padrao.ParamValues[9].AsFloat := reDividirPor.Value;

   // Plano Orc.
   if trim(molPlanoOrcamentario.cboPlanoOrcamen.Text) = '' then
      Cmp_Padrao.ParamValues[10].AsInteger := -1
   else
   begin
      Cmp_Padrao.ParamValues[10].AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Cmp_Padrao.ParamValues[15].AsString  := Cmp_Padrao.ParamValues[15].AsString + 'Plano Orçamentário: ' + molPlanoOrcamentario.cboPlanoOrcamen.Text;
   end;

   // Plano Prev.
   Cmp_Padrao.ParamValues[11].AsString := cboPlano.LookupValue;
   if trim(cboPlano.Text) <> '' then
      Cmp_Padrao.ParamValues[16].AsString := Cmp_Padrao.ParamValues[16].AsString + 'Plano Prev.: ' + cboPlano.Text + '      ';

   // Patro
   Cmp_Padrao.ParamValues[12].AsString := cboPatro.LookupValue;
   if trim(cboPatro.Text) <> '' then
      Cmp_Padrao.ParamValues[16].AsString := Cmp_Padrao.ParamValues[16].AsString + 'Patrocinadora: ' + cboPatro.Text + '      ';

   // C.Custo
   Cmp_Padrao.ParamValues[13].AsString := cboCCusto.LookupValue;
   if trim(cboCCusto.Text) <> '' then
      Cmp_Padrao.ParamValues[16].AsString := Cmp_Padrao.ParamValues[16].AsString + 'C.Custo: ' + cboCCusto.Text + '      ';

   // Atv.Proj
   Cmp_Padrao.ParamValues[14].AsString := cboAtvProj.LookupValue;
   if trim(cboAtvProj.Text) <> '' then
      Cmp_Padrao.ParamValues[16].AsString := Cmp_Padrao.ParamValues[16].AsString + 'Ativ.Projeto: ' + cboAtvProj.Text + '      ';

   // Cenário
   if Trim(dblcCenario.Value) <> '' then
   begin
     Cmp_Padrao.ParamValues[8].AsInteger := StrToInt(dblcCenario.LookupValue);
     Cmp_Padrao.ParamValues[16].AsString := Cmp_Padrao.ParamValues[16].AsString + 'Cenário: ' + dblcCenario.Text + '      ';
   end
   else
     Cmp_Padrao.ParamValues[8].AsInteger := 0;

end;




procedure TfrmRParamSaldosSintMT.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with sqlGrupo do
    begin
      cdsGrupo.Close;
      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Open;
    end;
end;




procedure TfrmRParamSaldosSintMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlTransacoesPorGrupo);
  inherited;
end;

end.
