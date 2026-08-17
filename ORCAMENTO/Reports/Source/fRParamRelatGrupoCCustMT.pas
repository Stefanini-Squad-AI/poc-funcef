//Alterações:
{ --------------------------------------------------------------------------------------------------
Rotinas   : Várias
Data      : 30/06/2004 (término)
Autor     : David Ayrolla
Pendencia : 16822
Descrição : Permitir que o relatório só leve em consideração para efeito de cálculo de percentual
            realizado os dados referentes a até certo período, permitindo análise horizontal.
---------------------------------------------------------------------------------------------------}

unit fRParamRelatGrupoCCustMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ComCtrls, CMDBLookupCombo, Mask, wwdbedit,
  Wwdbspin, wwdblook, uFuncoesOrcamento, mPlanoOrcamentarioMT;

type
  TfrmRParamRelatGrupoCCustMT = class(TfrmParamReports_Padrao)
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label4: TLabel;
    dblcCentRespConta: TwwDBLookupCombo;
    cbZerados: TCheckBox;
    Label6: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    Label10: TLabel;
    seGrauGrupo: TwwDBSpinEdit;
    Label11: TLabel;
    dblcGrupoIni: TwwDBLookupCombo;
    Label12: TLabel;
    dblcGrupoFim: TwwDBLookupCombo;
    lblCenario: TLabel;
    dblcCenario: TCMDBLookupCombo;
    pcParametros: TPageControl;
    tbsParametros1: TTabSheet;
    gbParametros: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    edNome1: TEdit;
    edConteudo1: TEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    edNome2: TEdit;
    edConteudo2: TEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    edNome3: TEdit;
    edConteudo3: TEdit;
    sePosIni4: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    edNome4: TEdit;
    edConteudo4: TEdit;
    tbsParametros2: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    lblPlanoPrevDes: TLabel;
    lblPatroDes: TLabel;
    dblkCCusto: TwwDBLookupCombo;
    dblkAtivProj: TwwDBLookupCombo;
    dblkPlanoPrev: TwwDBLookupCombo;
    dblkPatro: TwwDBLookupCombo;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    cdsCenRespConta: TCMClientDataSet;
    sqlCenRespConta: TCMSqlParams;
    cdsMoeda: TCMClientDataSet;
    sqlMoeda: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoFim: TCMClientDataSet;
    sqlGrupoFim: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    sqlCenario: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsPlanoPrev: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    rgSinal: TRadioGroup;
    cdsPeriodoFim: TCMClientDataSet;
    sqlPeriodoFim: TCMSqlParams;
    GrpAnaliseHorizontal: TGroupBox;
    Label15: TLabel;
    dblkPeriodoFim: TwwDBLookupCombo;
    CkbPeriodoInicial: TCheckBox;
    procedure dblkExercicioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkPeriodoIniClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamRelatGrupoCCustMT: TfrmRParamRelatGrupoCCustMT;

implementation

Uses
  USistema, UData, UCtrlOrcamento, UFuncaoGeral, UModulo, UMensErro;

{$R *.DFM}

Procedure TfrmRParamRelatGrupoCCustMT.FormCreate( Sender: TObject);
Begin
  Inherited;

  //Preenche as combo-boxes
  MostraStatusRelatGrupoCCust( 'Abrindo - Exercício' );
  with sqlExercicio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Período Inicial' );
  with sqlPeriodoIni do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Período Final' );
  with sqlPeriodoFim do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    ParamByName('PERIODOANT').asInteger := 1;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Centro de Responsabilidade' );
  with sqlCenRespConta do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Moeda' );
  with sqlMoeda do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Grupo Inicial' );
  with sqlGrupoIni do begin
    Prepare;
    Open;
    cdsGrupoIni.First;
    dblcGrupoIni.LookupValue := cdsGrupoIni.FieldByName('CODGRUPOORC').AsString;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Grupo Final' );

  with sqlGrupoFim do begin
    Prepare;
    Open;
    cdsGrupoFim.Last;
    dblcGrupoFim.LookupValue := cdsGrupoFim.FieldByName('CODGRUPOORC').AsString;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Plano Previdenciário' );
  with sqlPlanoPrev do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Patrocinadora' );
  with sqlPatro do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Centro de Custo' );
  with sqlCCusto do begin
    Prepare;
    ParamByName('IDEMPRESA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Atividade' );
  with sqlAtivProj do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Cenário' );
  with sqlCenario do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Planos' );
  with molPlanoOrcamentario,sqlPlanoOrcamen do
  begin
     Prepare;
     Open;
  end;

  MostraStatusRelatGrupoCCust( 'Abrindo - Grupos' );
  with sqlGrupoIni do begin
    cdsGrupoIni.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
    cdsGrupoIni.First;
    dblcGrupoIni.LookupValue := cdsGrupoIni.FieldByName('CODGRUPOORC').AsString;
  end;

  with sqlGrupoFim do begin
    cdsGrupoFim.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
    cdsGrupoFim.Last;
    dblcGrupoFim.LookupValue := cdsGrupoFim.FieldByName('CODGRUPOORC').AsString;
  end;

  seGrauGrupo.MaxValue := FuncaoGeral.CalcGrauMax(Modulo.sMascaraGrupo);
  seGrauGrupo.Value    := seGrauGrupo.MaxValue;
  seGrauGrupo.MinValue := 1;

  MostraStatusRelatGrupoCCust( '' );

End;

procedure TfrmRParamRelatGrupoCCustMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
  //Preenche a combo-box de período
  if Trim(dblkExercicio.text) <> '' then begin
    with sqlPeriodoIni do begin
      cdsPeriodoIni.Close;
      cdsPeriodoFim.Close;
      dblkPeriodoIni.Text := '';
      dblkPeriodoFim.Text := '';
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;
  end;
end;

Procedure TfrmRParamRelatGrupoCCustMT.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  // Verifica se o período final para a análise horizontal está a mais de
  // 6 meses do período inicial
  if (cdsPeriodoFim.FieldByname('PERIODO').AsInteger - cdsPeriodoIni.FieldByname('PERIODO').AsInteger) > 5 then
    begin
      MsgDlg('O número de períodos para análise não pode ultrapassar 6 meses','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
      Exit;
    end;

  if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then begin
    MsgDlg('O plano Orçamentário deve ser definido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else If ( Trim( dblkExercicio.Text ) = '' ) Then Begin
    MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  End Else if (Trim(dblkPeriodoIni.text) = '') then begin
    MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else begin
    if OrcamentoBackMT.DiasNoPeriodo(StrToInt(dblkExercicio.text),
       StrToInt(dblkPeriodoIni.lookupvalue)) = 0 then begin
      MsgDlg('O Período Inicial não existe para o Exercício selecionado.',
             'Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
    end else begin
      Cmp_Padrao.ParamValues[0].AsInteger  :=
                                            StrToInt(dblkExercicio.LookupValue);
      Cmp_Padrao.ParamValues[1].AsInteger  :=
                                           StrToInt(dblkPeriodoIni.LookupValue);
      Cmp_Padrao.ParamValues[2].AsString   := dblcCentRespConta.LookupValue;
      Cmp_Padrao.ParamValues[3].AsBoolean  := cbZerados.Checked;
      if Trim(dblcMoeda.Text) = '' then
        Cmp_Padrao.ParamValues[4].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[4].AsInteger := StrToInt(dblcMoeda.LookupValue);
      Cmp_Padrao.ParamValues[5].AsInteger  := Trunc(seGrauGrupo.Value);
      Cmp_Padrao.ParamValues[6].AsString   := dblcGrupoIni.LookupValue;
      Cmp_Padrao.ParamValues[7].AsString   := dblcGrupoFim.LookupValue;
      if Trim(dblcCenario.Text) = '' then
        Cmp_Padrao.ParamValues[8].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[8].AsInteger :=
                                              StrToInt(dblcCenario.LookupValue);
      Cmp_Padrao.ParamValues[9].AsInteger  := Trunc(sePosIni1.Value);
      Cmp_Padrao.ParamValues[10].AsInteger := Trunc(sePosFim1.Value);
      Cmp_Padrao.ParamValues[11].AsString  := Trim(edNome1.Text);
      Cmp_Padrao.ParamValues[12].AsString  := Trim(edConteudo1.Text);
      Cmp_Padrao.ParamValues[13].AsInteger := Trunc(sePosIni2.Value);
      Cmp_Padrao.ParamValues[14].AsInteger := Trunc(sePosFim2.Value);
      Cmp_Padrao.ParamValues[15].AsString  := Trim(edNome2.Text);
      Cmp_Padrao.ParamValues[16].AsString  := Trim(edConteudo2.Text);
      Cmp_Padrao.ParamValues[17].AsInteger := Trunc(sePosIni3.Value);
      Cmp_Padrao.ParamValues[18].AsInteger := Trunc(sePosFim3.Value);
      Cmp_Padrao.ParamValues[19].AsString  := Trim(edNome3.Text);
      Cmp_Padrao.ParamValues[20].AsString  := Trim(edConteudo3.Text);
      Cmp_Padrao.ParamValues[21].AsInteger := Trunc(sePosIni4.Value);
      Cmp_Padrao.ParamValues[22].AsInteger := Trunc(sePosFim4.Value);
      Cmp_Padrao.ParamValues[23].AsString  := Trim(edNome4.Text);
      Cmp_Padrao.ParamValues[24].AsString  := Trim(edConteudo4.Text);
      Cmp_Padrao.ParamValues[25].AsString  := dblkCCusto.LookupValue;
      Cmp_Padrao.ParamValues[30].AsInteger := rgSinal.ItemIndex;

      Cmp_Padrao.ParamValues[31].AsString := dblkPeriodoFim.LookupValue;

      Cmp_Padrao.ParamValues[32].AsBoolean := CkbPeriodoInicial.Checked;

      if Trim(dblkAtivProj.Text) = '' then
        Cmp_Padrao.ParamValues[26].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[26].AsInteger :=
                                             StrToInt(dblkAtivProj.LookupValue);
      if Trim(dblkPlanoPrev.Text) = '' then
        Cmp_Padrao.ParamValues[27].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[27].AsInteger :=
                                            StrToInt(dblkPlanoPrev.LookupValue);
      if Trim(dblkPatro.Text) = '' then
        Cmp_Padrao.ParamValues[28].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[28].AsInteger := StrToInt(dblkPatro.LookupValue);
      Cmp_Padrao.ParamValues[29].AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    end;
  end;
end;
//************************************************
procedure TfrmRParamRelatGrupoCCustMT.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  with sqlGrupoIni do begin
    cdsGrupoIni.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
    cdsGrupoIni.First;
    dblcGrupoIni.LookupValue := cdsGrupoIni.FieldByName('CODGRUPOORC').AsString;
  end;

  with sqlGrupoFim do begin
    cdsGrupoFim.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
    cdsGrupoFim.Last;
    dblcGrupoFim.LookupValue := cdsGrupoFim.FieldByName('CODGRUPOORC').AsString;
  end;

end;

procedure TfrmRParamRelatGrupoCCustMT.dblkPeriodoIniClick(Sender: TObject);
begin
  inherited;
  //Preenche as combo-boxes de período
  if Trim(dblkExercicio.text) <> '' then begin
    with sqlPeriodoFim do begin
      cdsPeriodoFim.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      ParamByName('PERIODOANT').asString := cdsPeriodoIni.FieldByName('PERIODO').AsString;
      Open;
    end;
  end;
end;

End.
