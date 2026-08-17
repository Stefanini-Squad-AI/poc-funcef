//===============================================================================================================
//Analista : Marcus Oliveira
//Pendência: 22003
//Descrição: Passado o plano e patro
//===============================================================================================================
unit fRParamAtivGestor2MT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, mPlanoOrcamentarioMT,
  rAtivGestor2;

type
  TfrmRParamAtivGestor2MT = class(TfrmParamReports_Padrao)
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label6: TLabel;
    dblkPeriodoFim: TwwDBLookupCombo;
    Label4: TLabel;
    dblcCentRespConta: TwwDBLookupCombo;
    rdgOrdenacao: TRadioGroup;
    lblValoresPor: TLabel;
    reDividirPor: TRealEdit;
    cbMovimento: TCheckBox;
    rgUsuXCCCR: TRadioGroup;
    sqlExercicio: TCMSqlParams;
    cdsExercicio: TCMClientDataSet;
    sqlPeriodoIni: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoFim: TCMClientDataSet;
    sqlCenRespConta: TCMSqlParams;
    cdsCenRespConta: TCMClientDataSet;
    Label2: TLabel;
    cboGrupoOrcamen: TwwDBLookupCombo;
    sqlGrupoOrcamen: TCMSqlParams;
    CdsGrupoOrcamen: TCMClientDataSet;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    Label5: TLabel;
    cmbPlano: TwwDBLookupCombo;
    Label7: TLabel;
    cmbPatro: TwwDBLookupCombo;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamAtivGestor2MT: TfrmRParamAtivGestor2MT;

implementation

uses USistema, UData, UCtrlOrcamento, UMensErro;

{$R *.DFM}

procedure TfrmRParamAtivGestor2MT.FormCreate(Sender: TObject);
begin
  inherited;
  with sqlPlano do begin
    Prepare;
    Open;
  end;

  with sqlPatro do begin
    Prepare;
    Open;
  end;

  //Preenche as combo-boxes
  with sqlExercicio do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
    Open;
  end;

  with sqlPeriodoIni do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;
  with sqlPeriodoFim do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
    ParamByName('EXERCICIO').asInteger := Year(Date);
    Open;
  end;
  with sqlCenRespConta do begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
    Open;
  end;
  with sqlGrupoOrcamen do begin
    Prepare;
    Open;
  end;
  with molPlanoOrcamentario,sqlPlanoOrcamen do
  begin
     Prepare;
     Open;
  end;

  with sqlGrupoOrcamen do begin
    cdsGrupoOrcamen.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;
end;

procedure TfrmRParamAtivGestor2MT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
  //Preenche a combo-box de período
  if Trim(dblkExercicio.text) <> '' then begin
    with sqlPeriodoIni do begin
      cdsPeriodoIni.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;
    with sqlPeriodoFim do begin
      cdsPeriodoFim.Close;
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
      Open;
    end;
  end;
end;

procedure TfrmRParamAtivGestor2MT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then begin
    MsgDlg('O plano Orçamentário deve ser definido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else if (Trim(dblkPeriodoIni.text) = '') or (Trim(dblkPeriodoFim.text) = '') then
     begin
    MsgDlg('Os Períodos devem ser preenchidos.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else begin
    if StrToInt(dblkPeriodoIni.lookupvalue) >
       StrToInt(dblkPeriodoFim.lookupvalue) then begin
      MsgDlg('O Período Inicial deve ser menor ou igual ao Período Final.',
             'Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
    end else begin
      if OrcamentoBackMT.DiasNoPeriodo(StrToInt(dblkExercicio.text),
         StrToInt(dblkPeriodoIni.lookupvalue)) = 0 then begin
        MsgDlg('O Período Inicial não existe para o Exercício selecionado.',
               'Erro',mtError,[mbOk],0);
        ModalResult := mrNone;
      end else begin
        if OrcamentoBackMT.DiasNoPeriodo(StrToInt(dblkExercicio.text),
           StrToInt(dblkPeriodoFim.lookupvalue)) = 0 then begin
          MsgDlg('O Período Final não existe para o Exercício selecionado.',
                 'Erro',mtError,[mbOk],0);
          ModalResult := mrNone;
        end else begin
          Cmp_Padrao.ParamValues[0].AsInteger :=
                                            StrToInt(dblkExercicio.LookupValue);
          Cmp_Padrao.ParamValues[1].AsInteger :=
                                           StrToInt(dblkPeriodoIni.LookupValue);
          Cmp_Padrao.ParamValues[2].AsInteger :=
                                           StrToInt(dblkPeriodoFim.LookupValue);
          Cmp_Padrao.ParamValues[3].AsString  := dblcCentRespConta.LookupValue;

          Cmp_Padrao.ParamValues[12].AsString := cdsCenRespConta.FieldByName('NOME').AsString;

          Cmp_Padrao.ParamValues[4].AsInteger := rdgOrdenacao.ItemIndex;
          Cmp_Padrao.ParamValues[5].AsFloat   := reDividirPor.Value;
          Cmp_Padrao.ParamValues[6].AsBoolean := cbMovimento.Checked;
          Cmp_Padrao.ParamValues[7].AsInteger := rgUsuXCCCR.ItemIndex;
          Cmp_Padrao.ParamValues[8].AsString  := cboGrupoOrcamen.LookupValue;

          Cmp_Padrao.ParamValues[9].AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
          Cmp_Padrao.ParamValues[10].AsString := CdsGrupoOrcamen.FieldByName('CODGRUPOORC').AsString;
          Cmp_Padrao.ParamValues[11].AsString := CdsGrupoOrcamen.FieldByName('FLGANALSINT').AsString;

          Cmp_Padrao.ParamValues[13].AsString := cmbPlano.LookupValue;
          Cmp_Padrao.ParamValues[14].AsString := cmbPatro.LookupValue;
          Cmp_Padrao.ParamValues[15].AsString := cmbPlano.Text;
          Cmp_Padrao.ParamValues[16].AsString := cmbPatro.Text;


        end;
      end;
    end;
  end;
end;

procedure TfrmRParamAtivGestor2MT.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with sqlGrupoOrcamen do begin
    cdsGrupoOrcamen.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    Open;
  end;

end;

end.
