Unit
  FGeraDadosMT2;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, ExtCtrls, StdCtrls, TREdit, Spin, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, DBTables, Parser10, IvDictio,
  IvMulti, IvEMulti, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, wwdblook, Mask,
  wwdbedit, Wwdbspin, DBClient, uCMClientDataSet, uCtrlGeraDados;

Type
  TfrmGeraDadosMT2 = Class(TfrmOkCancelar)
    lblExercicio: TLabel;
    lblPeriodo: TLabel;
    rgrpTipo: TRadioGroup;
    imgAguarde: TImage;
    pbAguarde: TProgressBar;
    Panel1: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ds: TwwDataSource;
    dsNaoCalculadas: TwwDBGrid;
    Label1: TLabel;
    pnlAguarde: TPanel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    cbCalcMes: TCheckBox;
    Label3: TLabel;
    cbBuscaSaldoAnterior: TCheckBox;
    Label7: TLabel;
    sePosIni1: TwwDBSpinEdit;
    Label8: TLabel;
    sePosFim1: TwwDBSpinEdit;
    Label9: TLabel;
    edConteudo1: TEdit;
    dblcCenario: TwwDBLookupCombo;
    lblCenario: TLabel;
    CdsNaoCalculadas : TCMClientDataSet;
    CdsExercicio     : TCMClientDataSet;
    CdsPeriodoIni: TCMClientDataSet;
    CdsCenario       : TCMClientDataSet;
    edtData: TEdit;
    edtTipo: TEdit;
    edtConta: TEdit;
    edtStatus: TEdit;
    pnlErroNaGeracao: TPanel;
    memErroNaGeracao: TRichEdit;

    {Procedimentos Definidos}
    function  VerIficaPeriodo(iExercicio, iPeriodo:integer):boolean;

    {Procedimentos Delphi}
    Procedure FormShow(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure qryNaoCalculadasCalcFields(DataSet: TDataSet);
    Procedure dblkExercicioClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure dblcCenarioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modIfied: Boolean);
    Procedure daRepaint(Sender: TObject);
    Procedure memErroNaGeracaoChange(Sender: TObject);
  Private
    { Private declarations }

    CtrlGeraDados : TCtrlGeraDados;
  Public
    { Public declarations }

    Procedure MostraMensagem( pMensagem : String );
  End;

Var
   frmGeraDadosMT2: TfrmGeraDadosMT2;
   iPeriodoIni, iPeriodoFim : Integer;

Implementation

Uses
  UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo, uData, uString,
  {uBiblioteca, - tavares pendência 14671} uIntegraBack;

{$R *.DFM}


{------------------------------------------------------------------------------}
{                                                                              }
{ Geração de Dados                                                             }
{                                                                              }
{ Autor : Antônio Jorge M.Rodrigues                                            }
{ Data de Início  : 21/12/98                                                   }
{ Data de Término : 24/12/98                                                   }
{ Última Revisão  : 04 a 05/01/99 (AJ) - inclusão do cálculo recursivo em      }
{                                        todos os tipos de contas              }
{                   13/01/99 (AJ e Rosane) - Correção no cálculo de fórmulas   }
{                   24/08/99 (AJ) - Inclusão do Cálculo Arquivos Genéricos e   }
{                                   Condicional                                }
{------------------------------------------------------------------------------}
//************************************************
Procedure TfrmGeraDadosMT2.FormCreate(Sender: TObject);
Begin
  Inherited;
  pnlErroNaGeracao.Visible := False;
  CtrlGeraDados := TCtrlGeraDados.Create;
  CtrlGeraDados.Initialize( DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlGeraDados.CdsNaoCalculadas := CdsNaoCalculadas;
  CtrlGeraDados.CdsExercicio     := CdsExercicio;
  CtrlGeraDados.CdsPeriodoIni    := CdsPeriodoIni;
  CtrlGeraDados.CdsCenario       := CdsCenario;

  CtrlGeraDados.IdEmpresa        := Sistema.IdEmpresa;
  CtrlGeraDados.IdModulo         := Sistema.IdModulo;
  CtrlGeraDados.IdUsuario        := Sistema.IdUsuario;
  CtrlGeraDados.IPlanoOrc        := Modulo.iPlanoOrc;
  CtrlGeraDados.sGeraMes         := Modulo.sGeraMes;
  CtrlGeraDados.pbAguarde        := pbAguarde;

  CtrlGeraDados.edtData          := edtData;
  CtrlGeraDados.edtTipo          := edtTipo;
  CtrlGeraDados.edtConta         := edtConta;
  CtrlGeraDados.edtStatus        := edtstatus;
  CtrlGeraDados.memErroNaGeracao := memErroNaGeracao;
  CtrlGeraDados.PrefixoServidor  := Sistema.PrefixoServidor;

  CtrlGeraDados.AbreQueries;
End;
//************************************************
Procedure TfrmGeraDadosMT2.FormShow(Sender: TObject);
Begin
  Inherited;
  //Preenche as combo-boxes
  CtrlGeraDados.AbreQueriesShow( Sistema.idEmpresa,
                                 Year(Date) );
  pnlAguarde.caption := '';
  edtData.Text       := '';
  edtTipo.Text       := '';
  edtConta.Text      := '';
End;
//************************************************
Procedure TfrmGeraDadosMT2.FormClose(Sender: TObject; var Action: TCloseAction);
Begin
  CtrlGeraDados.FechaQueries;
  Inherited;
End;
//************************************************
Function TfrmGeraDadosMT2.VerIficaPeriodo( iExercicio,
                                           iPeriodo : Integer ) : Boolean;
Begin
  //VerIfica a existência do Exercício e do Período informados
  If ( CtrlGeraDados.VerIficaPeriodo( Sistema.IdEmpresa,
                                      iExercicio,
                                      iPeriodo,
                                      dblkExercicio.Text ) ) Then Begin
    Result := True;
  End Else Begin

    MsgDlg( CtrlGeraDados.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
    Result := false;
  End;
End;
//************************************************
procedure TfrmGeraDadosMT2.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;

   edtStatus.Tag          := -1;
   edtStatus.Text := 'Aguarde, fechando tabelas do Banco de Dados...';

   If not pnlAguarde.visible Then Begin
      pnlAguarde.visible     := true;
      bbtnConfirmar.enabled  := true;
      dblkExercicio.enabled  := true;
      dblkPeriodo.enabled    := true;
      rgrpTipo.enabled       := true;

      screen.cursor          := crDefault;
   End;
End;
//************************************************
procedure TfrmGeraDadosMT2.qryNaoCalculadasCalcFields(DataSet: TDataSet);
Begin
   Inherited;
   with CdsNaoCalculadas do Begin
      //Tipos de Cálculo do Realizado
      If FieldByName('TIPOCALCREALIZADO').asString = 'V' Then Begin
         FieldByName('TIPOREAL').asString := 'Valor Informado Manualmente';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'P' Then Begin
         FieldByName('TIPOREAL').asString := 'Contabilidade';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'M' Then Begin
         FieldByName('TIPOREAL').asString := 'Fórmula';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'F' Then Begin
         FieldByName('TIPOREAL').asString := 'Composição de Outras Contas';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'X' Then Begin
         FieldByName('TIPOREAL').asString := 'Fluxo de Caixa';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'I' Then Begin
         FieldByName('TIPOREAL').asString := 'Valor Fixo Informado';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'G' Then Begin
         FieldByName('TIPOREAL').asString := 'Arquivos Genéricos';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'A' Then Begin
         FieldByName('TIPOREAL').asString := 'Valor Acumulado';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'T' Then Begin
         FieldByName('TIPOREAL').asString := 'Título';
      End;
      If FieldByName('TIPOCALCREALIZADO').asString = 'C' Then Begin
         FieldByName('TIPOREAL').asString := 'Condicional';
      End;

      //Tipos de Cálculo do Orçado
      If FieldByName('TIPOCALCORCADO').asString = 'V' Then Begin
         FieldByName('TIPOORC').asString := 'Valor Informado Manualmente';
      End;
      If FieldByName('TIPOCALCORCADO').asString = 'M' Then Begin
         FieldByName('TIPOORC').asString := 'Fórmula';
      End;
      If FieldByName('TIPOCALCORCADO').asString = 'F' Then Begin
         FieldByName('TIPOORC').asString := 'Composição de Outras Contas';
      End;
      If FieldByName('TIPOCALCORCADO').asString = 'I' Then Begin
         FieldByName('TIPOORC').asString := 'Valor Fixo Informado';
      End;
      If FieldByName('TIPOCALCORCADO').asString = 'A' Then Begin
         FieldByName('TIPOORC').asString := 'Valor Acumulado';
      End;
      If FieldByName('TIPOCALCORCADO').asString = 'T' Then Begin
         FieldByName('TIPOORC').asString := 'Título';
      End;
      If FieldByName('TIPOCALCORCADO').asString = 'C' Then Begin
         FieldByName('TIPOORC').asString := 'Condicional';
      End;
   End;
End;
//************************************************
Procedure TfrmGeraDadosMT2.dblkExercicioClick(Sender: TObject);
Begin
  Inherited;
  //Preenche a combo-box de período
  If dblkExercicio.text <> '' Then Begin

    CtrlGeraDados.AbrePeriodo( Sistema.idEmpresa,
                               StrToInt(dblkExercicio.text) );
  End;
End;
//************************************************
procedure TfrmGeraDadosMT2.dblcCenarioCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modIfied: Boolean);
Begin
  Inherited;
  If trim(dblcCenario.Text) <> '' Then Begin
     rgrpTipo.ItemIndex := 0;
     cbCalcMes.Checked  := True;
     rgrpTipo.Enabled   := False;
     cbCalcMes.Enabled  := False;
  end else Begin
     rgrpTipo.Enabled   := True;
     cbCalcMes.Enabled  := True;
  End;
End;
//************************************************
Procedure TfrmGeraDadosMT2.MostraMensagem( pMensagem : String );
Begin

  If ( pMensagem = 'Operation aborted' ) Then Begin

    MsgDlg('Processo cancelado', 'Erro', mtError, [mbOk], 0);

  End Else Begin

    MsgDlg('Erro ao gerar os Dados' + #13 + #10 + pMensagem, 'Erro', mtError, [mbOk], 0);
  End;
End;
//************************************************
Procedure TfrmGeraDadosMT2.daRepaint(Sender: TObject);
Begin
  Inherited;

  edtData.Repaint;
  edtTipo.Repaint;
  edtConta.Repaint;
End;
//************************************************
Procedure TfrmGeraDadosMT2.memErroNaGeracaoChange(Sender: TObject);
Begin
  Inherited;

  pnlErroNaGeracao.Visible := True;
  pnlErroNaGeracao.BringToFront;
  pnlErroNaGeracao.Repaint;
End;
//************************************************
Procedure TfrmGeraDadosMT2.bbtnConfirmarClick(Sender: TObject);
Begin
  Inherited;
  If ( Trim( dblkExercicio.text ) = '' ) Then Begin

    MsgDlg('Selecione um exercício','Exercício',mtError,[mbOk],0);
    dblkExercicio.SetFocus;
    Exit;
  End;

  If ( Trim( edConteudo1.Text ) <> '' ) And
     ( ( ( sePosFim1.Value = 0 ) Or ( sePosIni1.Value = 0 ) ) Or
     ( ( Length( Trim( edConteudo1.Text ) ) - 1 ) <> ( sePosFim1.Value - sePosIni1.Value ) ) ) Then Begin

    MsgDlg( 'Há uma inconsistência entre os campos "Inicial", "Dígitos" e "Conteúdo".' + #13 + #10 +
            'O sistema a corrigirá. Por favor, verIfique se está de acordo com sua necessidade.', 'Aviso', mtWarning, [ mbOk ], 0 );

    sePosIni1.Value := 1;
    sePosFim1.Value := Length( edConteudo1.Text );
  End;

  If trim(dblkPeriodo.Text) <> '' Then Begin
    iPeriodoIni := StrToInt(dblkPeriodo.LookupValue);
    iPeriodoFim := StrToInt(dblkPeriodo.LookupValue);
  End Else Begin
    CdsPeriodoIni.First;
    iPeriodoIni := CdsPeriodoIni.FieldByName( 'PERIODO' ).AsInteger;
    CdsPeriodoIni.Last;
    iPeriodoFim := CdsPeriodoIni.FieldByName( 'PERIODO' ).AsInteger;
    If MsgDlg('Confirma a Geração do Ano Inteiro?','Confirmação',mtConfirmation,[mbNo,mbYes],0) = mrNo Then
      exit;
  End;

  Try
    pnlAguarde.visible     := false;
    bbtnConfirmar.enabled  := false;
    dblkExercicio.enabled  := false;
    dblkPeriodo.enabled    := false;
    rgrpTipo.enabled       := false;
    edtStatus.Tag          := 0;
    screen.cursor          := crHourglass;


    CtrlGeraDados.iPeriodoIni := iPeriodoIni;
    CtrlGeraDados.iPeriodoFim := iPeriodoFim;

    CtrlGeraDados.ConfirmarClick( Sistema.idEmpresa,
                                 cbBuscaSaldoAnterior.checked,
                                 cbCalcMes.Checked,
                                 edConteudo1.Text,
                                 rgrpTipo.items[ rgrpTipo.ItemIndex ],
                                 dblkExercicio.text,
                                 Trunc( sePosIni1.Value ),
                                 Trunc( sePosFim1.Value ),
                                 IntegraBack.Plano,
                                 rgrpTipo.ItemIndex,
                                 dblcCenario.Text,
                                 dblkExercicio.LookupValue,
                                 dblcCenario.LookupValue );

  Finally

    MsgDlg( CtrlGeraDados.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );

    pnlAguarde.visible     := true;
    bbtnConfirmar.enabled  := true;
    dblkExercicio.enabled  := true;
    dblkPeriodo.enabled    := true;
    rgrpTipo.enabled       := true;
    screen.cursor          := crDefault;
  End;
End;
//************************************************
End.

