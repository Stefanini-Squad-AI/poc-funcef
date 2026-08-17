{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit
  FCriaRelatorioMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, Wwdotdot,
  Wwdbcomb, Wwdbspin, Mask, wwdbedit, uCtrlCriaRelatorio, uCMTypes, DBGrids;

Type
  TfrmCriaRelatorioMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeNome: TwwDBEdit;
    dbeNomeComplementar: TwwDBEdit;
    spnIncrementos: TwwDBSpinEdit;
    lblCodigoConta: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtNomeConta: TEdit;
    edtNomeConta100: TEdit;
    bbtnBuscaConta: TBitBtn;
    bbtnBuscaConta100: TBitBtn;
    dbcbSeparador: TwwDBComboBox;
    dbcbIndentacao: TwwDBComboBox;
    spnDecimais: TwwDBSpinEdit;
    dbrLinha: TDBRealEdit;
    dbeCodigoConta: TwwDBEdit;
    dbeCodigo100: TwwDBEdit;
    cdsDetalhe: TCMClientDataSet;
    MontaSelectConta: TMontaSelect;
    DataSource1: TDataSource;
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure bbtnBuscaConta100Click(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dbeCodigoContaExit(Sender: TObject);
    procedure dbeCodigo100Exit(Sender: TObject);
  Private
    { Private declarations }

    iProxLinha        : LongInt;
    CtrlCriaRelatorio : TCtrlCriaRelatorio;

  Public
    { Public declarations }
  End;

Var
  frmCriaRelatorioMT: TfrmCriaRelatorioMT;

Implementation

Uses
  UMensErro, uDatabase, DBaseDados, uSistema, uModulo, UCtrlOrcamento;

{$R *.DFM}
//************************************************
Procedure TfrmCriaRelatorioMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  CtrlCriaRelatorio := TCtrlCriaRelatorio.Create;

  CtrlCriaRelatorio.Initialize( DtmBaseDados.dbBaseDados, True,
                                Sistema.ConnectionType,   Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,  True, nil, nil, False );

  //Atribui os ClientDataSets locais a serem persistidos pelos objetos de negócios
  CtrlCriaRelatorio.CdsCriaRelatorio  := Cds;
  CtrlCriaRelatorio.CdsLinhasRelatOrc := CdsDetalhe;

  Cds.Data        := CtrlCriaRelatorio.Procurar( -1 );
  cdsDetalhe.Data := CtrlCriaRelatorio.ProcurarDetalhe( -1 );
End;
//************************************************
Procedure TfrmCriaRelatorioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
Begin
  Inherited;

  CtrlCriaRelatorio.Free;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;

  cdsDetalhe.Close;
  Cds.Close;
  cds.Data        := CtrlCriaRelatorio.Procurar( -1 );
  cdsDetalhe.Data := CtrlCriaRelatorio.ProcurarDetalhe( -1 );

  //Define o valor default do No. de Incrementos
  Cds.Edit;
  Cds.FieldByName('SEQUENCIA').asInteger := 10;
  Cds.Post;
  
  //Cria o número da próxima linha
  iProxLinha      := CtrlCriaRelatorio.PegaProximaLinha( -1 );

  dbeNome.SetFocus;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;

  iProxLinha := CtrlCriaRelatorio.PegaProximaLinha( Cds.FieldByName( 'IDRELATORC' ).AsFloat );
  dbeNome.SetFocus;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;

  If MontaSelect.RetornouValor Then  Begin

    cds.Data        := CtrlCriaRelatorio.Procurar( StrtoFloat( MontaSelect.ValoresChave[ 0 ] ) );
    cdsDetalhe.Data := CtrlCriaRelatorio.ProcurarDetalhe( StrtoFloat( MontaSelect.ValoresChave[ 0 ] ) );
  End;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroBeforeConfirma(sender: TObject; Var Accept: Boolean);
Begin

  Accept := False;
  If ( dbeNome.Text = '' ) Then  Begin

    MsgDlg( 'Nome do Relatório não informado.', 'Erro', mtError, [mbOk], 0 );
    dbeNome.SetFocus;
    Exit;
  End;

  Accept := True;
  Inherited;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
Begin
  Accept := CtrlCriaRelatorio.GravarCriaRelatorio;
  Inherited;
  cdsDetalhe.Data := CtrlCriaRelatorio.ProcurarDetalhe( cds.FieldByName( 'IDRELATORC' ).AsFloat );
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
Begin
  Accept := CtrlCriaRelatorio.GravarCriaRelatorio;
  Inherited;
  cdsDetalhe.Data := CtrlCriaRelatorio.ProcurarDetalhe( cds.FieldByName( 'IDRELATORC' ).AsFloat );
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
Begin
  Accept := CtrlCriaRelatorio.ExcluirCriaRelatorio;
  Inherited;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;

  If OrigemAbortConfirma <> OaBeforeConfirma Then  Begin

    MsgDlg('Ocorreu o seguinte erro : ' + CtrlCriaRelatorio.MessageInfo, 'Aviso', mtError, [mbOK], 0);
  End;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeDetalheInsert(Sender: TObject);
Begin
  Inherited;

  cdsDetalhe.FieldByName( 'IDRELATORC' ).AsFloat        := cds.FieldByName( 'IDRELATORC' ).AsFloat;
  cdsDetalhe.FieldByName( 'IDLINHASRELATORC').asInteger := iProxLinha + Cds.FieldByName('SEQUENCIA').asInteger;
  cdsDetalhe.FieldByName('IDPLANOORCAMEN').asInteger    := Modulo.iPlanoOrc;
  cdsDetalhe.FieldByName('NUMDECIMAIS').asInteger       := 2;
  cdsDetalhe.FieldByName('FLGINDENTACAO').asString      := '1';
  cdsDetalhe.FieldByName('FLGTIPOLINHA').asString       := 'S';

  edtNomeConta.clear;
  edtNomeConta100.clear;

  dbeCodigoConta.SetFocus;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeDetalheEdit(Sender: TObject);
Var
  sNomeConta,
  sCodCentroRespon,
  sNomeCentroRespon,
  sCodGrupo,
  sNomeGrupo,
  sUnidade,
  sPlanoPrev,
  sCentCust,
  sPatroc         : String;
Begin
  Inherited;

  dbeCodigoConta.text := CdsDetalhe.FieldByName('IDCONTAORCAMEN').asString;
  If ( OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                          dbeCodigoConta.text,
                                          true,
                                          false,
                                          sNomeConta,
                                          sCodCentroRespon,
                                          sNomeCentroRespon,
                                          sCodGrupo,
                                          sNomeGrupo,
                                          sUnidade,
                                          sPlanoPrev,
                                          sCentCust,
                                          sPatroc ) = 0 ) Then Begin
     edtNomeConta.text  := sNomeConta;
  End;

  If ( not CdsDetalhe.FieldByName('IDCONTAPARA100').isNull ) then begin

    dbeCodigo100.text := CdsDetalhe.FieldByName('IDCONTAPARA100').asString;
    if ( OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                          dbeCodigo100.text,
                                          true,
                                          false,
                                          sNomeConta,
                                          sCodCentroRespon,
                                          sNomeCentroRespon,
                                          sCodGrupo,
                                          sNomeGrupo,
                                          sUnidade,
                                          sPlanoPrev,
                                          sCentCust,
                                          sPatroc ) = 0 ) then begin
      edtNomeConta100.text  := sNomeConta;
    End;
  End;

  dbeCodigoConta.SetFocus;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.bbtnBuscaContaClick(Sender: TObject);
Var
  sNomeConta,
  sCodCentroRespon,
  sNomeCentroRespon,
  sCodGrupo,
  sNomeGrupo,
  sUnidade,
  sPlanoPrev,
  sCentCust,
  sPatroc         : String;

Begin
  Inherited;

  MontaSelectConta.Executar;
  If MontaSelectConta.RetornouValor Then  Begin

    If ( OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                          MontaSelectConta.ValoresChave[1],
                                          true,
                                          false,
                                          sNomeConta,
                                          sCodCentroRespon,
                                          sNomeCentroRespon,
                                          sCodGrupo,
                                          sNomeGrupo,
                                          sUnidade,
                                          sPlanoPrev,
                                          sCentCust,
                                          sPatroc ) = 0 ) Then  Begin

      dbeCodigoConta.text := MontaSelectConta.ValoresChave[1];
      CdsDetalhe.FieldByName( 'IDCONTAORCAMEN' ).AsString := MontaSelectConta.ValoresChave[1];
      edtNomeConta.text   := sNomeConta;
    End Else Begin
      dbeCodigoConta.SetFocus;
      dbeCodigoConta.clear;
      edtNomeConta.clear;
      MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
    End;
  End;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.bbtnBuscaConta100Click(Sender: TObject);
Var
  sNomeConta,
  sCodCentroRespon,
  sNomeCentroRespon,
  sCodGrupo,
  sNomeGrupo,
  sUnidade,
  sPlanoPrev,
  sCentCust,
  sPatroc         : String;

Begin
  Inherited;

  //Busca a Conta Orçamentária
  MontaSelectConta.Executar;
  If ( MontaSelectConta.RetornouValor ) Then  Begin

    If ( OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                          MontaSelectConta.ValoresChave[1],
                                          true,
                                          false,
                                          sNomeConta,
                                          sCodCentroRespon,
                                          sNomeCentroRespon,
                                          sCodGrupo,
                                          sNomeGrupo,
                                          sUnidade,
                                          sPlanoPrev,
                                          sCentCust,
                                          sPatroc ) = 0 ) Then  Begin

      dbeCodigo100.text     := MontaSelectConta.ValoresChave[1];
      CdsDetalhe.FieldByName( 'IDCONTAPARA100' ).AsString := MontaSelectConta.ValoresChave[1];
      edtNomeConta100.text  := sNomeConta;
    End Else Begin

      dbeCodigo100.clear;
      edtNomeConta100.clear;
      dbeCodigo100.SetFocus;
      MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
    End;
  End;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeDetalheConfirma(Sender: TObject);
Begin
  If ( dbeNome.Text = '' ) Then  Begin

    MsgDlg( 'Nome do Relatório não informado.','Erro',mtError,[mbOk],0);
    dbeNome.SetFocus;
    Exit;
  End;

  If ( dbrLinha.value = 0 ) Then Begin

    MsgDlg( 'Número da Linha do Relatório não informado.','Erro',mtError,[mbOk],0);
    dbrLinha.SetFocus;
    Exit;
  End;

  If ( dbeCodigoConta.text = '' ) Then Begin

    MsgDlg( 'Código da Conta não informado.','Erro',mtError,[mbOk],0);
    dbeCodigoConta.SetFocus;
    Exit;
  End;

  If ( dbcbSeparador.itemIndex < 0 ) Then Begin

    MsgDlg( 'Tipo de Separador das linhas não informado.','Erro',mtError,[mbOk],0);
    dbcbSeparador.SetFocus;
    Exit;
  End;

  If ( dbcbIndentacao.itemIndex < 0 ) Then Begin

    MsgDlg( 'Nível de Indentação não informado.','Erro',mtError,[mbOk],0);
    dbcbIndentacao.SetFocus;
    Exit;
  End;

  iProxLinha := iProxLinha + cds.FieldByName('SEQUENCIA').asInteger;
  edtNomeConta.clear;
  edtNomeConta100.clear;

  cdsDetalhe.Edit;
  cdsDetalhe.FieldByName( 'INDENT' ).AsString   := CtrlCriaRelatorio.TraduzFLGINDENTACAO( cdsDetalhe.FieldByName( 'FLGINDENTACAO' ).AsString );
  cdsDetalhe.FieldByName( 'TIPOLINHA' ).AsString := CtrlCriaRelatorio.TraduzFLGTIPOLINHA( cdsDetalhe.FieldByName( 'FLGTIPOLINHA' ).AsString );
  //cdsDetalhe.Post;

  Inherited;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.CmeCadastroDelete(Sender: TObject);
Begin

  If ( cdsDetalhe.IsEmpty ) Then Begin

    Inherited;
  End Else Begin

    MsgDlg( 'Exclua primeiro as linhas do relatório', 'Aviso', mtWarning, [ mbOk ], 0 );
  End;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.dbeCodigoContaExit(Sender: TObject);
Var
  sNomeConta,
  sCodCentroRespon,
  sNomeCentroRespon,
  sCodGrupo,
  sNomeGrupo,
  sUnidade,
  sPlanoPrev,
  sCentCust,
  sPatroc         : String;
Begin
  dbeCodigoConta.Text := Trim( dbeCodigoConta.Text );

  If ( dbeCodigoConta.Text = '' ) Then Begin

    edtNomeConta.text   := '';
  End Else Begin
    If ( OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                            dbeCodigoConta.Text,
                                            True,
                                            False,
                                            sNomeConta,
                                            sCodCentroRespon,
                                            sNomeCentroRespon,
                                            sCodGrupo,
                                            sNomeGrupo,
                                            sUnidade,
                                            sPlanoPrev,
                                            sCentCust,
                                            sPatroc ) = 0 ) Then  Begin

      CdsDetalhe.FieldByName( 'IDCONTAORCAMEN' ).AsString := dbeCodigoConta.Text;
      edtNomeConta.text   := sNomeConta;
    End Else Begin
      MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
      dbeCodigoConta.SetFocus;
    End;
  End;
End;
//************************************************
Procedure TfrmCriaRelatorioMT.dbeCodigo100Exit(Sender: TObject);
Var
  sNomeConta,
  sCodCentroRespon,
  sNomeCentroRespon,
  sCodGrupo,
  sNomeGrupo,
  sUnidade,
  sPlanoPrev,
  sCentCust,
  sPatroc         : String;
Begin
  dbeCodigo100.Text := Trim( dbeCodigo100.Text );

  If ( dbeCodigo100.Text = '' ) Then Begin

    edtNomeConta100.text   := '';
  End Else Begin
    If ( OrcamentoBackMT.BuscaContaOrcamen( modulo.iPlanoOrc,
                                            dbeCodigo100.Text,
                                            True,
                                            False,
                                            sNomeConta,
                                            sCodCentroRespon,
                                            sNomeCentroRespon,
                                            sCodGrupo,
                                            sNomeGrupo,
                                            sUnidade,
                                            sPlanoPrev,
                                            sCentCust,
                                            sPatroc ) = 0 ) Then  Begin

      CdsDetalhe.FieldByName( 'IDCONTAPARA100' ).AsString := dbeCodigo100.Text;
      edtNomeConta100.text   := sNomeConta;
    End Else Begin
      MsgDlg( OrcamentoBackMT.MessageInfo, 'Aviso', mtWarning, [ mbOk ], 0 );
      dbeCodigo100.SetFocus;
    End;
  End;
End;
//************************************************
End.
