unit FRParamPlanoTrabalho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, CMDBLookupCombo,
  uCmSqlParams, wwdblook, Db, DBClient, uCMClientDataSet, Mask, wwdbedit,
  Wwdbspin, Math, uFuncoesOrcamento,
  uCtrlPlanoTrabalho, uCtrlTransacoesPorGrupo, uCtrlPadroes, uCtrlPeriodoOrcamen;

type
  TfrmRParamPlanoTrabalho = class(TfrmParamReports_Padrao)
    cdsPlanoTrabalho: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsPlanoPrevConta: TCMClientDataSet;
    cdsPatroConta: TCMClientDataSet;
    cdsCenario: TCMClientDataSet;
    CdsExercicio: TCMClientDataSet;
    lblExercicio: TLabel;
    dblcExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    dblcCenario: TCMDBLookupCombo;
    lblCenario: TLabel;
    pnlPlanoPatroP: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatro: TwwDBLookupCombo;
    cdsCenRespConta: TCMClientDataSet;
    Label4: TLabel;
    dblcCentRespConta: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    edtExpoente: TwwDBSpinEdit;
    sttDividirPor: TStaticText;
    cdsAtivProj: TCMClientDataSet;
    Label13: TLabel;
    dblkAtivProj: TwwDBLookupCombo;
    Label21: TLabel;
    dblcPlanoTrabalho: TwwDBLookupCombo;
    CMSqlParams1: TCMSqlParams;
    procedure edtExpoenteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }

    CtrlPlanoTrabalho      : TCtrlPlanoTrabalho;
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo;
    CtrlPeriodoOrcamen     : TCtrlPeriodoOrcamen;

  public
    { Public declarations }
  end;



var
  frmRParamPlanoTrabalho: TfrmRParamPlanoTrabalho;

Implementation

Uses
  uSistema, uMensErro;

{$R *.DFM}
//************************************************
Procedure TfrmRParamPlanoTrabalho.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlPlanoTrabalho := TCtrlPlanoTrabalho.Create;
  CtrlPlanoTrabalho.InitializeAs(Padroes);

  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);

  CtrlPeriodoOrcamen     := TCtrlPeriodoOrcamen.Create;
  CtrlPeriodoOrcamen.InitializeAs(Padroes);
  sttDividirPor.Caption := '1';
End;



//************************************************
Procedure TfrmRParamPlanoTrabalho.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  FreeAndNil(CtrlPlanoTrabalho);
  FreeAndNil(CtrlTransacoesPorGrupo);
  FreeAndNil(CtrlPeriodoOrcamen);
  Inherited;
End;



//************************************************
Procedure TfrmRParamPlanoTrabalho.edtExpoenteChange(Sender: TObject);
Begin
  Inherited;
  sttDividirPor.Caption := FloatToStr( Power( 10, edtExpoente.Value ) );
End;



//************************************************
Procedure TfrmRParamPlanoTrabalho.FormShow(Sender: TObject);
Begin
  Inherited;
  CdsPlanoTrabalho.Data  := CtrlPlanoTrabalho.ListaPlanoTrabalho(Sistema.IdUsuario,Sistema.IdEmpresa);
  CdsExercicio.Data      := CtrlPeriodoOrcamen.Exercicios(Sistema.IdEmpresa,true);
  CdsCentroCusto.Data    := CtrlTransacoesPorGrupo.ListaCCusto(Sistema.IdEmpresa);
  cdsCenRespConta.Data   := CtrlTransacoesPorGrupo.ListaCRespon(Sistema.IdEmpresa);
  cdsPlanoPrevConta.Data := CtrlTransacoesPorGrupo.ListaPlano;
  cdsPatroConta.Data     := CtrlTransacoesPorGrupo.ListaPatro;
  cdsCenario.Data        := CtrlTransacoesPorGrupo.ListaCenario;
  cdsAtivProj.Data       := CtrlTransacoesPorGrupo.ListaAtivProj(Sistema.idEmpresa,tuAmbos);

End;



//************************************************
Procedure TfrmRParamPlanoTrabalho.bbtnConfirmarClick(Sender: TObject);
Begin

  If ( Trim( dblcExercicio.LookupValue ) <> '' ) Then Begin

    Try

      Cmp_Padrao.ParamValues[ 0 ].AsString := dblcExercicio.LookupValue;

      If ( Trim( dblcPlanoTrabalho.LookupValue ) = '' ) Then Begin
        Cmp_Padrao.ParamValues[ 1 ].AsString := '-2';
      End Else Begin
        Cmp_Padrao.ParamValues[ 1 ].AsString := dblcPlanoTrabalho.LookupValue;
      End;

      If ( Trim( dblcCentroCusto.LookupValue ) = '' ) Then Begin
        Cmp_Padrao.ParamValues[ 2 ].AsString := '-2';
      End Else Begin
        Cmp_Padrao.ParamValues[ 2 ].AsString := dblcCentroCusto.LookupValue;
      End;

      If ( Trim( dblcCentRespConta.LookupValue ) = '' ) Then Begin
        Cmp_Padrao.ParamValues[ 3 ].AsString := '-2';
      End Else Begin
        Cmp_Padrao.ParamValues[ 3 ].AsString := dblcCentRespConta.LookupValue;
      End;

      If ( Trim( dblkAtivProj.LookupValue ) = '' ) Then Begin
        Cmp_Padrao.ParamValues[ 4 ].AsString := '-2';
      End Else Begin
        Cmp_Padrao.ParamValues[ 4 ].AsString := dblkAtivProj.LookupValue;
      End;

      If ( Trim( dblcPlanoPrev.LookupValue ) = '' ) Then Begin
        Cmp_Padrao.ParamValues[ 5 ].AsString := '-2';
      End Else Begin
        Cmp_Padrao.ParamValues[ 5 ].AsString := dblcPlanoPrev.LookupValue;
      End;

      If ( Trim( dblcPatro.LookupValue ) = '' ) Then Begin
        Cmp_Padrao.ParamValues[ 6 ].AsString := '-2';
      End Else Begin
        Cmp_Padrao.ParamValues[ 6 ].AsString := dblcPatro.LookupValue;
      End;

      If ( Trim( dblcCenario.LookupValue ) = '' ) Then Begin
        Cmp_Padrao.ParamValues[ 7 ].AsString := '-2';
      End Else Begin
        Cmp_Padrao.ParamValues[ 7 ].AsString := dblcCenario.LookupValue;
      End;

      Cmp_Padrao.ParamValues[ 8 ].AsString := FloatToStr( edtExpoente.Value );

      Inherited;
    Except
      On E : Exception Do Begin

        MsgDlg( 'Ocorreu o seguinte erro: ' + E.Message, 'Erro', mtError, [ mbOk ], 0 );
      End;
    End;
  End;
End;
//************************************************
End.
