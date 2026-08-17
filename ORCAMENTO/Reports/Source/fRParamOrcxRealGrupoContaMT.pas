unit fRParamOrcxRealGrupoContaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, TREdit, mPlanoOrcamentarioMT, Mask,
  wwdbedit, Wwdbspin, ComCtrls, ExtCtrls, wwdblook, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, uSistema, uData, uModulo, uMensErro,
  uCtrlOrcamento, uFuncoesOrcamento;

type
  TfrmParamOrcXRealGrupoContaMT = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    dblcCentRespConta: TwwDBLookupCombo;
    dblcGrupoIni: TwwDBLookupCombo;
    dblcGrupoFim: TwwDBLookupCombo;
    rgUsuXCCCR: TRadioGroup;
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
    rdgpNegativos: TRadioGroup;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    rgSinal: TRadioGroup;
    dblkPeriodoFim: TwwDBLookupCombo;
    reDividirPor: TRealEdit;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    sqlPeriodoFim: TCMSqlParams;
    sqlCenRespConta: TCMSqlParams;
    sqlMoeda: TCMSqlParams;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    sqlGrupoFim: TCMSqlParams;
    cdsGrupoFim: TCMClientDataSet;
    cdsCenario: TCMClientDataSet;
    sqlCenario: TCMSqlParams;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsCenRespConta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkPeriodoIniClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamOrcXRealGrupoContaMT: TfrmParamOrcXRealGrupoContaMT;

implementation

{$R *.DFM}

procedure TfrmParamOrcXRealGrupoContaMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Preenche as combo-boxes
  pcParametros.ActivePageIndex := 0;

  MostraStatusRelatGrupo( 'Abrindo - Exercício' );
  with sqlExercicio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Período Inicial' );
  with sqlPeriodoIni do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Período Final' );
  with sqlPeriodoFim do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    ParamByName('PERIODOANT').asInteger := 1;
    Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Centro de Responsabilidade' );
  with sqlCenRespConta do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Grupo Inicial' );
  with sqlGrupoIni do begin
    Prepare;
    Open;
    cdsGrupoIni.First;
    dblcGrupoIni.LookupValue := cdsGrupoIni.FieldByName('CODGRUPOORC').AsString;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Período Final' );
  with sqlGrupoFim do begin
    Prepare;
    Open;
    cdsGrupoFim.Last;
    dblcGrupoFim.LookupValue := cdsGrupoFim.FieldByName('CODGRUPOORC').AsString;
   end;

  MostraStatusRelatGrupo( 'Abrindo - Plano Previdenciário' );
  with sqlPlanoPrev do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Patrocinadora' );
  with sqlPatro do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Centro de Custo' );
  with sqlCCusto do begin
    Prepare;
    ParamByName('IDEMPRESA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Atividade/Projeto' );
  with sqlAtivProj do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;


  MostraStatusRelatGrupo( 'Abrindo - Planos' );
  with molPlanoOrcamentario,sqlPlanoOrcamen do
  begin
     Prepare;
     Open;
  end;

  MostraStatusRelatGrupo( 'Abrindo - Grupos' );
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

  MostraStatusRelatGrupo( '' );
end;

procedure TfrmParamOrcXRealGrupoContaMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmParamOrcXRealGrupoContaMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then begin
    MsgDlg('O plano Orçamentário deve ser definido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else if (Trim(dblkPeriodoIni.text) = '') then begin
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
      Cmp_Padrao.ParamValues[2].AsString    := dblcCentRespConta.LookupValue;
      Cmp_Padrao.ParamValues[3].AsString    := dblcGrupoIni.LookupValue;
      Cmp_Padrao.ParamValues[4].AsString    := dblcGrupoFim.LookupValue;
      Cmp_Padrao.ParamValues[5].AsFloat     := reDividirPor.Value;
      Cmp_Padrao.ParamValues[6].AsInteger   := rgUsuXCCCR.ItemIndex;
      Cmp_Padrao.ParamValues[7].AsInteger   := Trunc(sePosIni1.Value);
      Cmp_Padrao.ParamValues[8].AsInteger   := Trunc(sePosFim1.Value);
      Cmp_Padrao.ParamValues[9].AsString    := Trim(edNome1.Text);
      Cmp_Padrao.ParamValues[10].AsString   := Trim(edConteudo1.Text);
      Cmp_Padrao.ParamValues[11].AsInteger  := Trunc(sePosIni2.Value);
      Cmp_Padrao.ParamValues[12].AsInteger  := Trunc(sePosFim2.Value);
      Cmp_Padrao.ParamValues[13].AsString   := Trim(edNome2.Text);
      Cmp_Padrao.ParamValues[14].AsString   := Trim(edConteudo2.Text);
      Cmp_Padrao.ParamValues[15].AsInteger  := Trunc(sePosIni3.Value);
      Cmp_Padrao.ParamValues[16].AsInteger  := Trunc(sePosFim3.Value);
      Cmp_Padrao.ParamValues[17].AsString   := Trim(edNome3.Text);
      Cmp_Padrao.ParamValues[18].AsString  := Trim(edConteudo3.Text);
      Cmp_Padrao.ParamValues[19].AsInteger  := Trunc(sePosIni4.Value);
      Cmp_Padrao.ParamValues[20].AsInteger  := Trunc(sePosFim4.Value);
      Cmp_Padrao.ParamValues[21].AsString   := Trim(edNome4.Text);
      Cmp_Padrao.ParamValues[22].AsString   := Trim(edConteudo4.Text);
      Cmp_Padrao.ParamValues[23].AsString   := dblkCCusto.LookupValue;

      if Trim(dblkAtivProj.Text) = '' then
        Cmp_Padrao.ParamValues[24].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[24].AsInteger :=
                                             StrToInt(dblkAtivProj.LookupValue);

      if Trim(dblkPlanoPrev.Text) = '' then
        Cmp_Padrao.ParamValues[25].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[25].AsInteger :=
                                            StrToInt(dblkPlanoPrev.LookupValue);

      If Trim(dblkPatro.Text) = '' then
        Cmp_Padrao.ParamValues[26].AsInteger := 0
      Else
        Cmp_Padrao.ParamValues[26].AsInteger := StrToInt(dblkPatro.LookupValue);

      If ( rdgpNegativos.ItemIndex = 0 ) Then Begin
        Cmp_Padrao.ParamValues[27].AsString  := 'P';
      End Else Begin
        Cmp_Padrao.ParamValues[27].AsString := 'H';

      Cmp_Padrao.ParamValues[29].AsInteger := rgSinal.ItemIndex;

      end;
      Cmp_Padrao.ParamValues[28].AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
      Cmp_Padrao.ParamValues[30].AsString := dblkPeriodoFim.LookupValue;
    End;
  End;
end;

procedure TfrmParamOrcXRealGrupoContaMT.dblkPeriodoIniClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmParamOrcXRealGrupoContaMT.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
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

end.
