unit FRParamRateioPlanoTrabalhoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls,
  CMProcuraMask, wwdblook, CMDBLookupCombo, Db, uCmSqlParams, DBClient,
  uCMClientDataSet, uFuncoesOrcamento, uSistema, uData,
  MontaSelect, uModulo, ComCtrls, mPlanoOrcamentarioMT,
  uCtrlPlanoTrabalho, uCtrlTransacoesPorGrupo, uCtrlPadroes, uCtrlPeriodoOrcamen;

type
  TfrmRParamRateioPlanoTrabalho = class(TfrmParamReports_Padrao)
    cdsCentroCusto: TCMClientDataSet;
    cdsPlanoTrabalho: TCMClientDataSet;
    cdsCriterio: TCMClientDataSet;
    cdsPatroConta: TCMClientDataSet;
    cdsPlanoPrevConta: TCMClientDataSet;
    cdsCenario: TCMClientDataSet;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    dtsGrupo: TDataSource;
    lblCenario: TLabel;
    dblcCenario: TCMDBLookupCombo;
    dbeGrupo: TCMProcuraMask;
    Label21: TLabel;
    dblcPlanoTrabalho: TwwDBLookupCombo;
    pnlPlanoPatroP: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    dblcPatro: TwwDBLookupCombo;
    lblCriterio: TLabel;
    dblcCriterio: TwwDBLookupCombo;
    MontaSelectGrupo: TMontaSelect;
    Label1: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    lblExercicio: TLabel;
    dblcExercicio: TwwDBLookupCombo;
    CdsExercicio: TCMClientDataSet;
    molPlanoOrcamentario: TmolPlanoOrcamentario;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molPlanoOrcamentariocboPlanoOrcamenCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }

    CtrlPlanoTrabalho      : TCtrlPlanoTrabalho;
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo;
    CtrlPeriodoOrcamen     : TCtrlPeriodoOrcamen;

  public
    { Public declarations }
  end;

var
  frmRParamRateioPlanoTrabalho: TfrmRParamRateioPlanoTrabalho;

Implementation

Uses
  uMensErro;

{$R *.DFM}
//************************************************
Procedure TfrmRParamRateioPlanoTrabalho.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlPlanoTrabalho := TCtrlPlanoTrabalho.Create;
  CtrlPlanoTrabalho.InitializeAs(Padroes);

  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);

  CtrlPeriodoOrcamen     := TCtrlPeriodoOrcamen.Create;
  CtrlPeriodoOrcamen.InitializeAs(Padroes);
End;




//************************************************
Procedure TfrmRParamRateioPlanoTrabalho.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  FreeAndNil(CtrlPlanoTrabalho);
  FreeAndNil(CtrlTransacoesPorGrupo);
  FreeAndNil(CtrlPeriodoOrcamen);
  Inherited;
End;



//************************************************
Procedure TfrmRParamRateioPlanoTrabalho.FormShow(Sender: TObject);
Begin
  Inherited;
  try
     dbeGrupo.Mascara := Modulo.sMascaraGrupo;

     MostraStatusRelatRateioPlano( 'Abrindo - Plano de Trabalho' );
     CdsPlanoTrabalho.Data := CtrlPlanoTrabalho.ListaPlanoTrabalho(Sistema.IdUsuario,Sistema.IdEmpresa);

     MostraStatusRelatRateioPlano( 'Abrindo - Exercício' );
     CdsExercicio.Data := CtrlPeriodoOrcamen.Exercicios(Sistema.IdEmpresa,true);


     MostraStatusRelatRateioPlano( 'Abrindo - Centro de Custo' );
     CdsCentroCusto.Data := CtrlTransacoesPorGrupo.ListaCCusto(Sistema.IdEmpresa);

     MostraStatusRelatRateioPlano( 'Abrindo - Plano Previdenciário' );
     cdsPlanoPrevConta.Data := CtrlTransacoesPorGrupo.ListaPlano;

     MostraStatusRelatRateioPlano( 'Abrindo - Patrocinadora' );
     cdsPatroConta.Data := CtrlTransacoesPorGrupo.ListaPatro;

     MostraStatusRelatRateioPlano( 'Abrindo - Critério' );
     CdsCriterio.Data := CtrlTransacoesPorGrupo.ListaCriterio(Sistema.idEmpresa);

     MostraStatusRelatRateioPlano( 'Abrindo - Cenário' );
     cdsCenario.Data := CtrlTransacoesPorGrupo.ListaCenario;

     MostraStatusRelatRateioPlano( 'Abrindo - Planos' );
     with molPlanoOrcamentario,sqlPlanoOrcamen do
     begin
        Prepare;
        Open;
     end;

     MostraStatusRelatRateioPlano( 'Abrindo - Grupos' );
     With sqlGrupo Do Begin
       Prepare;
       ParamByName('CODGRUPOORC').AsString     := '';
       ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
       cdsGrupo.Data := Data;
       MontaSelectGrupo.Filtro.Add('IDPLANOORCAMEN = ' + molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
     End;

  finally
     MostraStatusRelatRateioPlano( '' );
  end;
End;
//************************************************
Procedure TfrmRParamRateioPlanoTrabalho.bbtnConfirmarClick( Sender: TObject);
Begin

  Try
    Cmp_Padrao.ParamValues[ 0 ].AsString  := dblcPlanoTrabalho.LookupValue;

    if Trim(molPlanoOrcamentario.cboPlanoOrcamen.text) = '' then begin
       MsgDlg('O plano Orçamentário deve ser definido.','Erro',mtError,[mbOk],0);
       Exit;
    end;

    If cdsGrupo.IsEmpty Then Begin
      Cmp_Padrao.ParamValues[ 1 ].AsInteger := -2;
    End Else Begin
      Cmp_Padrao.ParamValues[ 1 ].AsInteger := cdsGrupo.FieldByName('IDGRUPOORCAMEN').AsInteger;
    End;

    If ( Trim( dblcCentroCusto.LookupValue ) = '' ) Then Begin
      Cmp_Padrao.ParamValues[ 2 ].AsInteger := -2;
    End Else Begin
      Cmp_Padrao.ParamValues[ 2 ].AsInteger := StrToInt( dblcCentroCusto.LookupValue);
    End;

    If ( Trim( dblcPlanoPrev.LookupValue ) = '' ) Then Begin
      Cmp_Padrao.ParamValues[ 3 ].AsInteger := -2;
    End Else Begin
      Cmp_Padrao.ParamValues[ 3 ].AsInteger := StrToInt(dblcPlanoPrev.LookupValue);
    End;

    If ( Trim( dblcPatro.LookupValue ) = '' ) Then Begin
      Cmp_Padrao.ParamValues[ 4 ].AsInteger := -2;
    End Else Begin
      Cmp_Padrao.ParamValues[ 4 ].AsInteger := StrToInt(dblcPatro.LookupValue);
    End;

    If ( Trim( dblcCriterio.LookupValue ) = '' ) Then Begin
      Cmp_Padrao.ParamValues[ 5 ].AsInteger := -2;
    End Else Begin
      Cmp_Padrao.ParamValues[ 5 ].AsInteger := StrToInt( dblcCriterio.LookupValue );
    End;

    If ( Trim( dblcCenario.LookupValue ) = '' ) Then Begin
      Cmp_Padrao.ParamValues[ 6 ].AsInteger := -2
    End Else Begin
      Cmp_Padrao.ParamValues[ 6 ].AsInteger := StrToInt( dblcCenario.LookupValue );
    End;

    If ( Trim( dblcExercicio.LookupValue ) = '' ) Then Begin
      Cmp_Padrao.ParamValues[ 7 ].AsInteger := -2
    End Else Begin
      Cmp_Padrao.ParamValues[ 7 ].AsInteger := StrToInt( dblcExercicio.LookupValue );
    End;

    Cmp_Padrao.ParamValues[8].AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);

    Inherited;
  Except
    On E : Exception Do Begin

      MsgDlg( 'Ocorreu o seguinte erro: ' + E.Message, 'Erro', mtError, [ mbOk ], 0 );
    End;
  End;
End;
//************************************************
procedure TfrmRParamRateioPlanoTrabalho.molPlanoOrcamentariocboPlanoOrcamenCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  With sqlGrupo Do Begin
    cdsGrupo.Close;
    Prepare;
    ParamByName('CODGRUPOORC').AsString     := '';
    ParamByName('IDPLANOORCAMEN').AsInteger := StrToInt(molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
    cdsGrupo.Data := Data;
    MontaSelectGrupo.Filtro.Delete(1);
    MontaSelectGrupo.Filtro.Add('IDPLANOORCAMEN = ' + molPlanoOrcamentario.cboPlanoOrcamen.LookupValue);
  End;

end;

End.
