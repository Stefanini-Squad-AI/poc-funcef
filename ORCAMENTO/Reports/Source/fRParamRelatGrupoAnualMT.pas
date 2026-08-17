unit fRParamRelatGrupoAnualMT;
{=========================================================================================
 Autor     : Marcus Oliveira
 Pendência : 20288
 Data      : 03/08/2007
 Descrição : Passado os parametro do Plano, Patro, C.Custo e Ativ/Proj
=========================================================================================
 Autor     : Rodolpho da Silva
 Pendência : 20737
 Data      : 09/10/2006
 Descrição : Considerar os sinais do grupo (ou não) de acordo com um novo parâmetro criado
=========================================================================================}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ComCtrls, CMDBLookupCombo, Mask, wwdbedit,
  Wwdbspin, wwdblook, uFuncoesOrcamento, mPlanoOrcamentarioMT;

type
  TfrmRParamRelatGrupoAnualMT = class(TfrmParamReports_Padrao)
    bbtnGerarTXT: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    rgImpValores: TRadioGroup;
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
    rgUsuXCCCR: TRadioGroup;
    pcParametros: TPageControl;
    tbsParametros1: TTabSheet;
    gbParametros: TGroupBox;
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
    Label1: TLabel;
    Label13: TLabel;
    lblPlanoPrevDes: TLabel;
    lblPatroDes: TLabel;
    dblkCCusto: TwwDBLookupCombo;
    dblkAtivProj: TwwDBLookupCombo;
    dblkPlanoPrev: TwwDBLookupCombo;
    dblkPatro: TwwDBLookupCombo;
    cdsExercicio: TCMClientDataSet;
    sqlExercicio: TCMSqlParams;
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
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsPlanoPrev: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    rdgpNegativos: TRadioGroup;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    rdgConsideraSinal: TRadioGroup;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure rgImpValoresClick(Sender: TObject);
    procedure PassaParametros(bGeraTxt: boolean);
    procedure bbtnGerarTXTClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamRelatGrupoAnualMT: TfrmRParamRelatGrupoAnualMT;

implementation

uses UFuncaoGeral, UMensErro, USistema, UModulo;
{$R *.DFM}

procedure TfrmRParamRelatGrupoAnualMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Preenche as combo-boxes

  pcParametros.ActivePageIndex := 0;

  MostraStatusRelatGrupoAnual( 'Abrindo - Exercício' );
  with sqlExercicio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Exercício' );
  with sqlCenRespConta do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Moeda' );
  with sqlMoeda do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Cenário' );
  with sqlCenario do begin
    Prepare;
    Open;
  end;
  dblcCenario.Enabled     := False;
  dblcCenario.LookupValue := '';
  dblcCenario.Text        := '';

  MostraStatusRelatGrupoAnual( 'Abrindo - Plano Previdenciário' );
  with sqlPlanoPrev do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Patrocinadora' );
  with sqlPatro do begin
    Prepare;
    Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Centro de Custo' );
  with sqlCCusto do begin
    Prepare;
    ParamByName('IDEMPRESA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Atividade/Projeto' );
  with sqlAtivProj do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Planos' );
  with molPlanoOrcamentario,sqlPlanoOrcamen do
  begin
     Prepare;
     Open;
  end;

  MostraStatusRelatGrupoAnual( 'Abrindo - Grupos' );
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

  MostraStatusRelatGrupoAnual( '' );
end;

procedure TfrmRParamRelatGrupoAnualMT.rgImpValoresClick(Sender: TObject);
begin
  inherited;
  if rgImpValores.ItemIndex = 2 then begin
    dblcCenario.Enabled := True;
  end else begin
    dblcCenario.Enabled     := False;
    dblcCenario.LookupValue := '';
    dblcCenario.Text        := '';
  end;
end;

procedure TfrmRParamRelatGrupoAnualMT.PassaParametros(bGeraTxt: boolean);
begin
  if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then begin
    MsgDlg('O plano Orçamentário deve ser definido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else if (rgImpValores.ItemIndex = 2) and (Trim(dblcCenario.Text) = '') then begin
    MsgDlg('O Cenário deve ser preenchido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
    dblcCenario.SetFocus;
  end else begin
    if trim(dblkExercicio.Text) = '' then begin
      MsgDlg('Obrigatório indicar o exercício.','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
    end else begin
      Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
      Cmp_Padrao.ParamValues[1].AsInteger  := rgImpValores.ItemIndex;
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
      Cmp_Padrao.ParamValues[9].AsInteger  := rgUsuXCCCR.ItemIndex;
      Cmp_Padrao.ParamValues[10].AsInteger := Trunc(sePosIni1.Value);
      Cmp_Padrao.ParamValues[11].AsInteger := Trunc(sePosFim1.Value);
      Cmp_Padrao.ParamValues[12].AsString  := Trim(edNome1.Text);
      Cmp_Padrao.ParamValues[13].AsString  := Trim(edConteudo1.Text);
      Cmp_Padrao.ParamValues[14].AsInteger := Trunc(sePosIni2.Value);
      Cmp_Padrao.ParamValues[15].AsInteger := Trunc(sePosFim2.Value);
      Cmp_Padrao.ParamValues[16].AsString  := Trim(edNome2.Text);
      Cmp_Padrao.ParamValues[17].AsString  := Trim(edConteudo2.Text);
      Cmp_Padrao.ParamValues[18].AsInteger := Trunc(sePosIni3.Value);
      Cmp_Padrao.ParamValues[19].AsInteger := Trunc(sePosFim3.Value);
      Cmp_Padrao.ParamValues[20].AsString  := Trim(edNome3.Text);
      Cmp_Padrao.ParamValues[21].AsString  := Trim(edConteudo3.Text);
      Cmp_Padrao.ParamValues[22].AsInteger := Trunc(sePosIni4.Value);
      Cmp_Padrao.ParamValues[23].AsInteger := Trunc(sePosFim4.Value);
      Cmp_Padrao.ParamValues[24].AsString  := Trim(edNome4.Text);
      Cmp_Padrao.ParamValues[25].AsString  := Trim(edConteudo4.Text);


      //Centro de Custo
      Cmp_Padrao.ParamValues[26].AsString  := dblkCCusto.LookupValue;

      //Atividade de Projeto
      if Trim(dblkAtivProj.Text) = '' then
        Cmp_Padrao.ParamValues[27].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[27].AsInteger :=
                                             StrToInt(dblkAtivProj.LookupValue);
      if Trim(dblkPlanoPrev.Text) = '' then
        Cmp_Padrao.ParamValues[28].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[28].AsInteger :=
                                            StrToInt(dblkPlanoPrev.LookupValue);
      if Trim(dblkPatro.Text) = '' then
        Cmp_Padrao.ParamValues[29].AsInteger := 0
      else
        Cmp_Padrao.ParamValues[29].AsInteger := StrToInt(dblkPatro.LookupValue);
      Cmp_Padrao.ParamValues[30].AsBoolean := bGeraTxt;

      If ( rdgpNegativos.ItemIndex = 0 ) Then Begin

        Cmp_Padrao.ParamValues[31].AsString  := 'P';

      End Else Begin

        Cmp_Padrao.ParamValues[31].AsString := 'H';
      End;
      Cmp_Padrao.ParamValues[32].AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);

      Cmp_Padrao.ParamValues[33].AsInteger := rdgConsideraSinal.ItemIndex;

      Cmp_Padrao.ParamValues[34].AsString :=  dblkCCusto.Text;
      Cmp_Padrao.ParamValues[35].AsString :=  dblkAtivProj.Text;
      Cmp_Padrao.ParamValues[36].AsString :=  dblkPlanoPrev.Text;
      Cmp_Padrao.ParamValues[37].AsString :=  dblkPatro.Text;

    end;
  end;
end;

procedure TfrmRParamRelatGrupoAnualMT.bbtnGerarTXTClick(Sender: TObject);
begin
  inherited;
  PassaParametros(True);
end;

procedure TfrmRParamRelatGrupoAnualMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  PassaParametros(False);
end;

procedure TfrmRParamRelatGrupoAnualMT.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
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
