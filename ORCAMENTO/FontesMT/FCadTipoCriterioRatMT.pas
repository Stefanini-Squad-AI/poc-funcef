{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit FCadTipoCriterioRatMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, Mask, wwdbedit,
  wwdblook, CMDBLookupCombo, FCadastroMT, DBClient, uCMClientDataSet,
  uCtrlCadTipoCriterioRat, uCMTypes;

Type
  TfrmCadTipoCriterioRatMT = Class( TfrmCadastroMT )
    dbmeQuery: TDBMemo;
    CdsExercicio: TCMClientDataSet;
    CdsPeriodo: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    CdsDataView: TCMClientDataSet;
    DsDataView: TwwDataSource;
    Panel2: TPanel;
    Panel1: TPanel;
    lblDescricao: TLabel;
    dbedDescricao: TwwDBEdit;
    memlegenda: TMemo;
    dbrgTipo: TDBRadioGroup;
    bbtnExemplo: TSpeedButton;
    bbtnExemplo1: TSpeedButton;
    bbtnExemplo2: TSpeedButton;
    dblcPeriodo: TCMDBLookupCombo;
    dblcExercicio: TCMDBLookupCombo;
    lblPeriodo: TLabel;
    Panel3: TPanel;
    Procedure dbrgTipoClick(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure bbtnExemploClick(Sender: TObject);
    Procedure bbtnExemplo1Click(Sender: TObject);
    Procedure bbtnExemplo2Click(Sender: TObject);
    Procedure dblcExercicioExit(Sender: TObject);
    Procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  Private
    { Private declarations }

    CtrlCadTipoCriterioRat : TCtrlCadTipoCriterioRat;
    Procedure AbrirPeriodo( pExercicio : Integer );
  Public
    { Public declarations }
  End;

Var
  frmCadTipoCriterioRatMT: TfrmCadTipoCriterioRatMT;

Implementation

Uses
  uMensErro, uDataBase, dBaseDados, uSistema;

{$R *.DFM}
//************************************************
Procedure TfrmCadTipoCriterioRatMT.FormCreate(Sender: TObject);
Begin
  Inherited;

  CtrlCadTipoCriterioRat := TCtrlCadTipoCriterioRat.Create;
  CtrlCadTipoCriterioRat.Initialize( DtmBaseDados.dbBaseDados, True,
                                     Sistema.ConnectionType,   Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlCadTipoCriterioRat.IdEmpresa := Sistema.IdEmpresa;

  MontaSelect.Filtro.Add('CRITERIORATORC.IDPESSOA = ' + IntToStr( Sistema.idEmpresa ) );

  Cds.Data          := CtrlCadTipoCriterioRat.Procura( -2 );
  CdsDataView.Data  := CtrlCadTipoCriterioRat.ProcuraDataView( -2 );

  CtrlCadTipoCriterioRat.CdsCadTipoCriterioRat := Cds;
  CtrlCadTipoCriterioRat.CdsDataView           := CdsDataView;

  CdsExercicio.Data := CtrlCadTipoCriterioRat.ListaExercicio;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.bbtnExemploClick(Sender: TObject);
Begin
  Inherited;

  MsgDlg( CtrlCadTipoCriterioRat.Exemplo( '0' ), 'Informação', mtInformation, [ mbOk ], 0 );
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.bbtnExemplo1Click(Sender: TObject);
Begin
  Inherited;

  CdsDataView.Edit;
  CdsDataView.FieldByName( 'TEMPLATE' ).AsString := CtrlCadTipoCriterioRat.Exemplo( '1' );
  CdsDataView.Post;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.bbtnExemplo2Click(Sender: TObject);
Begin
  Inherited;

  CdsDataView.Edit;
  CdsDataView.FieldByName( 'TEMPLATE' ).AsString := CtrlCadTipoCriterioRat.Exemplo( '2' );
  CdsDataView.Post;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.dblcExercicioExit(Sender: TObject);
Begin
  Inherited;

  If ( Trim( dblcExercicio.Text ) = '' ) Then Begin

    MsgDlg( 'Selecione um EXERCÍCIO', 'Aviso', mtWarning, [mbOK], 0 );
    dblcExercicio.SetFocus;

  End Else Begin

    AbrirPeriodo( StrToInt( dblcExercicio.Text ) );
  End;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.dbrgTipoClick(Sender: TObject);
Begin
  Inherited;
  If (dbrgTipo.ItemIndex = 1) Then Begin

    dbmeQuery.Enabled := True;
  End Else Begin

    dbmeQuery.Enabled := False;

    If Not ( CdsDataView.State In ( [ dsEdit ] ) ) Then Begin

      CdsDataView.Edit;
    End;

    CdsDataView.FieldByName( 'TEMPLATE' ).Clear;
  End;

  bbtnExemplo.Enabled  := dbmeQuery.Enabled;
  bbtnExemplo1.Enabled := dbmeQuery.Enabled;
  bbtnExemplo2.Enabled := dbmeQuery.Enabled;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;

  CdsExercicio.Last;
  dblcExercicio.LookupValue := CdsExercicio.FieldByName( 'PEREXERCICIO' ).AsString;

  AbrirPeriodo( CdsExercicio.FieldByName( 'PEREXERCICIO' ).AsInteger );

  CdsDataView.Data          := CtrlCadTipoCriterioRat.ProcuraDataView( -2 );

  Cds.FieldByName( 'TIPORATEIO' ).AsString := 'M';
  Cds.FieldByName( 'IDPESSOA' ).AsInteger  := Sistema.IdEmpresa;

  dbedDescricao.SetFocus;
  dbmeQuery.Enabled    := False;
  bbtnExemplo.Enabled  := dbmeQuery.Enabled;
  bbtnExemplo1.Enabled := dbmeQuery.Enabled;
  bbtnExemplo2.Enabled := dbmeQuery.Enabled;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;

  dbedDescricao.SetFocus;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;

  If ( MontaSelect.RetornouValor ) Then Begin

    Cds.Data := CtrlCadTipoCriterioRat.Procura( StrToInt(MontaSelect.ValoresChave[ 0 ] ) );

    AbrirPeriodo( Cds.FieldByName( 'PEREXERCICIO' ).AsInteger );

    If ( Not Cds.EOF ) Then Begin

      CdsDataView.Data  := CtrlCadTipoCriterioRat.ProcuraDataView( Cds.FieldByName( 'IDDATAVIEW' ).AsInteger );

      If ( Cds.FieldByName( 'TIPORATEIO' ).AsString = 'G' ) Then Begin

        dbmeQuery.Enabled := true
      End else Begin

         dbmeQuery.Enabled := false;
      End;

      bbtnExemplo.Enabled  := dbmeQuery.Enabled;
      bbtnExemplo1.Enabled := dbmeQuery.Enabled;
      bbtnExemplo2.Enabled := dbmeQuery.Enabled;
    End;
  End;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Var
  SqlAux     : String;

Begin

  Accept := False;
  If ( trim( dbedDescricao.Text ) = '' ) Then Begin

    MsgDlg( 'Obrigatório indicar a Descrição', 'Erro', mtError, [ mbOk ], 0 );
    dbedDescricao.SetFocus;
    exit;
  End;

  If ( Cds.FieldByName( 'TIPORATEIO' ).AsString = 'G' ) Then Begin

    If ( trim( dbmeQuery.Text ) = '' ) Then Begin

      MsgDlg( 'Este tipo de Rateio obriga a indicação de uma pesquisa', 'Erro', mtError, [ mbOk ], 0 );
      dbmeQuery.SetFocus;
      exit;
    End;

    Try
      If ( Pos( ':CODCENTROCUSTO', AnsiUpperCase( CdsDataView.FieldByName( 'TEMPLATE' ).AsString ) ) = 0 ) Then Begin

        MsgDlg( 'Falta o parâmetro CODCENTROCUSTO na Pesquisa', 'Erro', mtError, [ mbOk ], 0 );
        dbmeQuery.SetFocus;
        exit;
      End;

      If ( pos( ':IDEMPRESA', AnsiUpperCase( CdsDataView.FieldByName( 'TEMPLATE').AsString ) ) = 0 ) Then Begin

        MsgDlg( 'Falta o parâmetro IDEMPRESA na Pesquisa', 'Erro', mtError, [ mbOk ], 0 );
        dbmeQuery.SetFocus;
        exit;
      End;

      SqlAux := CdsDataView.FieldByName( 'TEMPLATE' ).AsString;

      SqlAux := StringReplace( SqlAux, ':CODCENTROCUSTO', '''''',            [ rfReplaceAll ] );
      SqlAux := StringReplace( SqlAux, ':IDEMPRESA'     , '-2',              [ rfReplaceAll ] );
      SqlAux := StringReplace( SqlAux, ':DATA'          , DateToStr( Date ), [ rfReplaceAll ] );
      SqlAux := StringReplace( SqlAux, ':ANOMES'        , '''''',            [ rfReplaceAll ] );

      CdsAux.Data := CtrlCadTipoCriterioRat.GetDataPacket( SqlAux );
    Except

      MsgDlg( 'Pesquisa Inválida', 'Erro', mtError, [ mbOk ], 0 );
      dbmeQuery.SetFocus;
      exit;
    End;
  End;

  Accept := True;
  Inherited;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;

  If ( CtrlCadTipoCriterioRat.AtualizaDataView ) Then Begin
    CdsDataView.Edit;
    CdsDataView.FieldByName( 'IDDATAVIEW' ).AsInteger := CtrlCadTipoCriterioRat.UltimaSequence;
    CdsDataView.Post;
    Accept := CtrlCadTipoCriterioRat.AplicaOperacaoCadTipoCriterioRatGravar;
  End Else Begin

    Accept := False;
  End;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;

  If ( CtrlCadTipoCriterioRat.AtualizaDataView ) Then Begin

    Accept := CtrlCadTipoCriterioRat.AplicaOperacaoCadTipoCriterioRatGravar;
  End Else Begin

    Accept := False;
  End;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;

  If OrigemAbortConfirma <> OaBeforeConfirma Then Begin

    MsgDlg('Ocorreu o seguinte erro : '+ CtrlCadTipoCriterioRat.MessageInfo, 'Aviso', mtError,[mbOK],0);
  End;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroDelete(Sender: TObject);
Begin

  CtrlCadTipoCriterioRat.DeletaDataView;
  Inherited;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
Begin

  Accept := CtrlCadTipoCriterioRat.AplicaOperacaoCadTipoCriterioRatDeleta;
End;
//************************************************
Procedure TfrmCadTipoCriterioRatMT.AbrirPeriodo( pExercicio : Integer );
Begin

  CdsPeriodo.Data         := CtrlCadTipoCriterioRat.ListaPeriodo( pExercicio );

  dblcPeriodo.LookupValue := Cds.FieldByName( 'PERNUMERO' ).AsString;
End;
//************************************************
procedure TfrmCadTipoCriterioRatMT.CmeCadastroAfterConfirma( Sender: TObject);
begin
  inherited;

  Cds.Data := CtrlCadTipoCriterioRat.Procura( -2 );
End;
//************************************************
End.
