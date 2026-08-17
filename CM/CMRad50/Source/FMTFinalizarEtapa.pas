unit FMTFinalizarEtapa;
//========================================================================================
//  Pendência : 21549
//  Data      : 21/03/2006
//  Autor     : Rodolpho da Silva
//  Descrição : Corrigir validações de autorizações de TODOS os grupos associados
//              ao tipo de processo

//      *********      ATENÇÃO     *********
//      Se alguém for modificar a qry do componente SqlAut, favor mudar a chamada
//      do índice da linha da string deste componente.
//      O ajuste deverá ser feito na linha 240 desta Unit
//========================================================================================
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, uCmMath,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Wwdatsrc, DBCtrls, wwdblook, Wwdbigrd,
  Wwdbgrid, CMDBLookupCombo, uCmSqlParams, Grids, DBClient, uCMClientDataSet,
  uCtrlRAD;

type
  TFrmMTFinalizarEtapa = class(TfrmSairAjuda)
    BtnConcluir: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    dsEtapa: TwwDataSource;
    LbProc: TLabel;
    ToolbarSep971: TToolbarSep97;
    RgAut: TRadioGroup;
    Label3: TLabel;
    dblcAndamento: TCMDBLookupCombo;
    Label4: TLabel;
    dsAndamento: TwwDataSource;
    mmParecer: TMemo;
    lblParecer: TLabel;
    Bevel1: TBevel;
    dbgrProxEtapa: TwwDBGrid;
    dsEtapaAnd: TwwDataSource;
    MemObs: TMemo;
    btnView: TBitBtn;
    plnRet: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MemRet: TMemo;
    Label8: TLabel;
    LbPessoa: TLabel;
    Label9: TLabel;
    LbDoc: TLabel;
    ToolbarSep972: TToolbarSep97;
    CdsEtapa: TCMClientDataSet;
    SqlEtapa: TCMSqlParams;
    Sql: TCMSqlParams;
    Cds: TCMClientDataSet;
    SqlEtapaAnd: TCMSqlParams;
    CdsEtapaAnd: TCMClientDataSet;
    CdsAndamento: TCMClientDataSet;
    SqlAndamento: TCMSqlParams;
    CdsTestaEtapa: TCMClientDataSet;
    SqlTestaEtapa: TCMSqlParams;
    CdsBuscaEtapa: TCMClientDataSet;
    SqlBuscaEtapa: TCMSqlParams;
    SqlEmpresaProp: TCMSqlParams;
    CdsEmpresaProp: TCMClientDataSet;
    SqlAut: TCMSqlParams;
    CdsAut: TCMClientDataSet;
    SqlVerifUsuario: TCMSqlParams;
    CdsVerifUsuario: TCMClientDataSet;
    CdsVerifAut: TCMClientDataSet;
    SqlVerifAut: TCMSqlParams;
    CdsInstAut: TCMClientDataSet;
    CdsInstEtapa: TCMClientDataSet;
    CdsInstProcesso: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnConcluirClick(Sender: TObject);
    procedure dblcAndamentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnViewClick(Sender: TObject);
  private
    { Private declarations }
    dDataFimPrev: TDateTime;
    rad: TCtrlRad;

    Function VerifUltAut( IdProc, IdEtapa: LongInt; sStatus: Char ): Boolean;
    Function VerifCriaProxima: Boolean;
    Procedure Concluir;
    Function BuscaTipoEtapa( IdEtapa: LongInt; var dData: TDateTime ): LongInt;
  public
    { Public declarations }
    iIdTipoProc: LongInt;
    iIdProc    : LongInt;
    iIdEtapa   : LongInt;
    sPessoa    : String;
    sDoc       : String;
    sUsuario   : String;
  end;

var
  FrmMTFinalizarEtapa: TFrmMTFinalizarEtapa;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uDataBase, FMTAcompProc, DBasedados, uDiasUteis,
     uCtrlPadroes;

procedure TFrmMTFinalizarEtapa.FormCreate(Sender: TObject);
begin
  inherited;
  Rad := TCtrlRad.Create;
  Rad.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                  Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Rad.CdsProcesso    := CdsInstProcesso;
  Rad.CdsEtapa       := CdsInstEtapa;
  Rad.CdsAutorizacao := CdsInstAut;
end;

procedure TFrmMTFinalizarEtapa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
end;

procedure TFrmMTFinalizarEtapa.FormShow(Sender: TObject);
// Rodolpho da Silva - P:21549 - 21/03/2006 
var
  sIdGrupoAut: string;

begin
  inherited;
  LbPessoa.Caption := sPessoa;
  LbDoc.Caption    := sDoc;

  If CdsEtapa.FieldByName( 'FLGRETORETAPA' ).AsString = 'S' then Begin
     Sql.Sql.Text := 'SELECT TP.NOME ' +
                     '  FROM RADINSTETAPA IE, ' +
                     '       RADTIPOETAPA TP  ' +
                     ' WHERE ( IE.IDETAPA = ' + IntToStr( CdsEtapa.FieldByName( 'IDETAPAANT' ).asInteger ) + ' ) ' +
                     '   AND ( IE.IDTIPOETAPA = TP.IDTIPOETAPA )';
     Sql.Open;
     MemRet.Lines.Add( Cds.FieldByName( 'NOME' ).asString );
     plnRet.BringToFront;
  End Else
     plnRet.SendToBack;

  //Rosane: Alterada a query para mostrar as próximas etapas
  //        de acordo com a nova filosofia
  CdsAndamento.Close;
  SqlAndamento.Prepare;
  SqlAndamento.ParamByName( 'pIDTPPROC' ).asInteger  := iIdTipoProc;
  SqlAndamento.ParamByName( 'pIDTPETAPA' ).asInteger := CdsEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger;
  SqlAndamento.Open;

  CdsEtapaAnd.Close;
  SqlEtapaAnd.Prepare;
  SqlEtapaAnd.ParamByName( 'pIDTPPROC' ).asInteger    := iIdTipoProc;
  SqlEtapaAnd.ParamByName( 'pIDTPETAPA' ).asInteger   := CdsEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger;

  If ( CdsAndamento.RecordCount = 1 ) and ( CdsEtapa.FieldByName( 'FLGFINAL' ).AsString <> 'S' ) then Begin
     dblcAndamento.LookupValue := IntToStr( CdsAndamento.FieldByName( 'IDANDAMENTO' ).asInteger );
     SqlEtapaAnd.ParamByName( 'pIDANDAMENTO' ).asInteger := StrToInt( dblcAndamento.LookupValue );
  End Else
     SqlEtapaAnd.ParamByName( 'pIDANDAMENTO' ).asInteger := -1;

  SqlEtapaAnd.Open;

  If CdsEtapa.FieldByName( 'FLGAUTORIZACAO' ).asString = 'S' Then Begin
     RgAut.Caption   := ' Etapa de Autorização ';
     RgAut.Enabled   := True;
     RgAut.ItemIndex := 0;
     //Verifica grupo do usuario que pode autorizar
     CdsVerifUsuario.Close;

     if not CdsEtapa.FieldByName( 'CODCENTROCUSTO' ).isNull Then Begin
        SqlVerifUsuario.SQL.Add('   AND ( ( RTRIM( AUT.CODCENTROCUSTO ) = SUBSTR( ' + QuotedStr( Trim( CdsEtapa.FieldByName( 'CODCENTROCUSTO' ).AsString ) ) + ', 1, LENGTH( RTRIM( AUT.CODCENTROCUSTO ) ) ) ) OR ( AUT.CODCENTROCUSTO IS NULL ) ) ');
        SqlVerifUsuario.SQL.Add('   AND ( ( AUT.IDEMPRESA = ' + IntToStr( CdsEtapa.FieldByName( 'IDEMPRESA' ).AsInteger ) + ' ) OR ( AUT.IDEMPRESA IS NULL ) ) ');
     end;

     if not CdsEtapa.FieldByName( 'CODCENTRORESPON' ).isNull Then Begin
        SqlVerifUsuario.SQL.Add('   AND ( ( RTRIM( AUT.CODCENTRORESPON ) = SUBSTR( ' + QuotedStr( Trim( CdsEtapa.FieldByName( 'CODCENTRORESPON' ).AsString ) ) + ', 1, LENGTH( RTRIM( AUT.CODCENTRORESPON ) ) ) ) OR ( AUT.CODCENTRORESPON IS NULL ) ) ');
        SqlVerifUsuario.SQL.Add('   AND ( ( AUT.IDPESSOA = ' + IntToStr( CdsEtapa.FieldByName( 'IDPESSOA' ).AsInteger ) + ' ) OR ( AUT.IDPESSOA IS NULL ) ) ');
     end;

     if not CdsEtapa.FieldByName( 'CODGRUPOPROD' ).isNull Then Begin
        SqlVerifUsuario.SQL.Add('   AND ( ( RTRIM( AUT.CODGRUPOPROD ) = SUBSTR( ' + QuotedStr( Trim( CdsEtapa.FieldByName( 'CODGRUPOPROD' ).AsString ) ) + ', 1, LENGTH( RTRIM( AUT.CODGRUPOPROD ) ) ) ) OR ( AUT.CODGRUPOPROD IS NULL ) ) ');
     end;

     if not CdsEtapa.FieldByName( 'UNIDNEGOC' ).isNull Then Begin
        SqlVerifUsuario.SQL.Add('   AND ( ( AUT.UNIDNEGOC = ' + IntToStr( CdsEtapa.FieldByName( 'UNIDNEGOC' ).AsInteger ) + ' ) OR ( AUT.UNIDNEGOC IS NULL ) ) ');
        SqlVerifUsuario.SQL.Add('   AND ( ( AUT.IDPESSOA = ' + IntToStr( CdsEtapa.FieldByName( 'IDPESSOA' ).AsInteger ) + ' ) OR ( AUT.IDPESSOA IS NULL ) ) ');
     end;

     if ( not CdsEtapa.FieldByName( 'VLRPROC' ).isNull ) and ( CdsEtapa.FieldByName( 'VLRPROC' ).AsFloat <> 0 ) Then Begin
        SqlVerifUsuario.SQL.Add('   AND ( ( VLR.VLRINICIAL <= ' + FloatToStrCM( CdsEtapa.FieldByName( 'VLRPROC' ).AsFloat ) + ' ) OR ( VLR.VLRINICIAL = 0 ) OR ( VLR.VLRINICIAL IS NULL ) ) ');
        SqlVerifUsuario.SQL.Add('   AND ( ( VLR.VLRFINAL >= ' + FloatToStrCM( CdsEtapa.FieldByName( 'VLRPROC' ).AsFloat ) + ' ) OR ( VLR.VLRFINAL = 0 ) OR ( VLR.VLRFINAL IS NULL ) ) ');
     end;

     // início - andre tavares - pendência 17624 - 16/11/2004
     if (not CdsEtapa.FieldByName('CODTIPDOC').isNull) and (CdsEtapa.FieldByName('CODTIPDOC').asInteger > 0) then
     begin
       SqlVerifUsuario.SQL.Add(' AND ((AUT.CODTIPDOC = ' + formatFloat('0', CdsEtapa.FieldByName('CODTIPDOC').asFloat) + ') OR AUT.CODTIPDOC IS NULL)');
     end;
     // fim - andre tavares - pendência 17624 - 16/11/2004



     SqlVerifUsuario.Prepare;
     SqlVerifUsuario.ParambyName( 'pIDUSU' ).AsInteger          := Sistema.IdUsuario;
     SqlVerifUsuario.ParambyName( 'pIDTIPOPROCESSO' ).AsInteger := iIdTipoProc;
     SqlVerifUsuario.ParambyName( 'pIDTIPOETAPA' ).AsInteger    := CdsEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger;
     SqlVerifUsuario.Open;

     // Início - Rodolpho da Silva - P:21549 - 21/03/2006
     while not CdsVerifUsuario.Eof do
     begin
        if (CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).AsString) <> '' then
        begin
           if Trim(sIdGrupoAut) <> '' then
              sIdGrupoAut := sIdGrupoAut + ',' + CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).AsString
           else
              sIdGrupoAut := CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).AsString;
        end;      
        CdsVerifUsuario.Next;
     end;
     // Fim - Rodolpho da Silva - P:21549 - 21/03/2006

     CdsAut.Close;
     SqlAut.Prepare;
     SqlAut.ParamByName( 'pIDTPPROC' ).asInteger         := iIdTipoProc;

     // Rodolpho da Silva - P:21549 - 21/03/2006
     //SqlAut.ParamByName( 'pIDGRUPOAUTORIZA' ).asInteger  := CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).asInteger;
     SqlAut.SQL.Strings[6] := 'AND ( EXR.IDGRUPOAUTORIZA IN (' + sIdGrupoAut + ' ) )' ;

     SqlAut.ParamByName( 'pIDTPETAPA' ).asInteger        := CdsEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger;
     SqlAut.Open;
  End;

  CdsInstProcesso.Data := Rad.ListaProcesso( iIdProc );
  CdsInstEtapa.Data    := Rad.ListaEtapa( iIdProc, iIdEtapa );
  CdsInstAut.Data  := Rad.ListaAutorizacao( 0, iIdProc, iIdEtapa );
end;

Procedure TFrmMTFinalizarEtapa.Concluir;
Var
  bFinal: Boolean;
  sStatus, sStatusProc: Char;
  iIdTipoAnt: LongInt;
  sSql: String;
begin
  inherited;
  //Botar confirmação e o botão de consulta do processo
  If ( not CdsAndamento.IsEmpty ) and ( RgAut.ItemIndex <> 1 ) and
         ( CdsEtapa.FieldByName( 'FLGFINAL' ).AsString <> 'S' ) Then Begin
     If Trim( dblcAndamento.Text ) = '' Then Begin
        MsgDlg( 'Andamento não preenchido', 'Erro', mtError, [mbOK], 0 );
        dblcAndamento.SetFocus;
        Exit;
     End;
  End;

  If trim(mmParecer.Text) = '' Then Begin
     MsgDlg( 'Obrigatório indicar no parecer o motivo da ação.', 'Erro', mtError, [mbOK], 0 );
     mmParecer.SetFocus;
     Exit;
  End;

  If ( Trim( dblcAndamento.Text ) = '' ) and ( not CdsAndamento.IsEmpty ) and ( RgAut.ItemIndex <> 0 ) Then
     If MsgDlg('Confirma que realmente deseja encerrar o Processo', 'Confirmação', mtConfirmation, [mbNo, mbYes], 0 ) = MrNo Then
        Exit;

  CdsEmpresaProp.Close;
  SqlEmpresaProp.Prepare;
  SqlEmpresaProp.ParamByName( 'pIDPESSOA' ).AsFloat := Sistema.idEmpresa;
  SqlEmpresaProp.Open;
  bFinal := False;

  If RgAut.ItemIndex = 1 Then Begin
     bFinal      := True;
     sStatus     := 'R';
     sStatusProc := 'R';
  End Else Begin
     If ( ( CdsEtapa.FieldByName( 'FLGFINAL' ).AsString = 'S' ) and
          ( Trim( dblcAndamento.Text ) = '' ) ) or ( CdsAndamento.IsEmpty ) Then
        bFinal := True;

     sStatusProc := 'S';

     if RgAut.ItemIndex = 0 Then
        sStatus := 'S'
     Else
        sStatus := 'N';
  End;

  sSql := 'INSERT INTO RADAUTORIZACAO( IDAUTORIZACAO, IDPROCESSO, IDETAPA, ' + 
                 'IDUSUARIO, FLGSTATUS, DATAAUTORIZACAO, OBSAUTORIZA ) ' +
                 'VALUES ( ' + IntToStr( LeUltRegistro( nil, 'RADAUTORIZACAO' ) ) + ', ' +
                           IntToStr( iIdProc ) + ', ' +
                           IntToStr( iIdEtapa ) + ', ' +
                           IntToStr( Sistema.Idusuario ) + ', ' +
                           QuotedStr( sStatus ) + ', ' +
                           'TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', Date ) ) + ', ''DD/MM/YYYY'' ), ' +
                           QuotedStr( mmParecer.Text ) + ') ';

  Padroes.ExecSqlAndCommit( sSql );

{
  CdsInstAut.Append;
  CdsInstAut.FieldByName( 'IDPROCESSO' ).AsInteger       := iIdProc;
  CdsInstAut.FieldByName( 'IDETAPA' ).AsInteger          := iIdEtapa;
  CdsInstAut.FieldByName( 'IDUSUARIO' ).AsInteger        := Sistema.IdUsuario;
  CdsInstAut.FieldByName( 'FLGSTATUS' ).AsString         := sStatus;
  CdsInstAut.FieldByName( 'DATAAUTORIZACAO' ).AsDateTime := Date;
  CdsInstAut.FieldByName( 'OBSAUTORIZA' ).AsString       := mmParecer.Text;
  CdsInstAut.Post;
}
  If VerifUltAut( iIdProc, iIdEtapa, sStatus ) Then Begin
     sSql := 'UPDATE RADINSTETAPA SET ' +
                    'DATAFIMETAPA = TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', Date ) ) + ', ''DD/MM/YYYY'' ), ' +
                    'IDANDAMENTO = ';

     If Not bFinal Then
        sSql := sSql + QuotedStr( dblcAndamento.LookupValue )
     Else
        sSql := sSql + 'NULL';

     sSql := sSql + ' WHERE ( IDPROCESSO = ' + IntToStr( iIdProc ) + ' ) ' +
                       'AND ( IDETAPA    = ' + IntToStr( iIdEtapa ) + ' ) ';

     Padroes.ExecSqlAndCommit( sSql );
{
     CdsInstEtapa.Edit;
     CdsInstEtapa.FieldByName( 'IDPROCESSO' ).AsInteger      := iIdProc;
     CdsInstEtapa.FieldByName( 'IDETAPA' ).AsInteger         := iIdEtapa;

     If Not bFinal Then
        CdsInstEtapa.FieldByName( 'IDANDAMENTO' ).AsInteger  := StrToInt( dblcAndamento.LookupValue )
     Else
        CdsInstEtapa.FieldByName( 'IDANDAMENTO' ).Clear;

     CdsInstEtapa.FieldByName( 'DATAFIMETAPA' ).AsDateTime   := Date;
     CdsInstEtapa.Post;
}
     If bFinal Then Begin
        sSql := 'UPDATE RADINSTPROCESSO SET DATAFIMPROCESSO = TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', Date ) ) + ', ''DD/MM/YYYY'' ), ' +
                       'FLGOK = ' + QuotedStr( sStatusProc ) +
                ' WHERE IDPROCESSO = ' + IntToStr( iIdProc );
        Padroes.ExecSqlAndCommit( sSql );
{
        CdsInstProcesso.Edit;
        CdsInstProcesso.FieldByName( 'IDPROCESSO' ).AsInteger       := iIdProc;
        CdsInstProcesso.FieldByName( 'DATAFIMPROCESSO' ).AsDateTime := Date;
        CdsInstProcesso.FieldByName( 'FLGOK' ).AsString             := sStatusProc;
        CdsInstProcesso.Post;  }
     End Else Begin
        If VerifCriaProxima() Then Begin
           // Verificar se já pode criar as outras etapas.
           If CdsEtapa.FieldByName( 'FLGRETORETAPA' ).AsString = 'S' Then Begin
              iIdTipoAnt := BuscaTipoEtapa( CdsEtapa.FieldByName( 'IDETAPAANT' ).asInteger, dDataFimPrev );

              sSql := 'INSERT INTO RADINSTETAPA ( IDPROCESSO, IDETAPA, IDTIPOETAPA, ' +
                              'DATAINIETAPA, IDETAPAANT, DATAFIMPREV ) ' +
                      'VALUES ( ' + IntToStr( iIdProc ) + ', ' +
                                    IntToStr( LeUltRegistro( nil, 'RADINSTETAPA' ) ) + ', ';

              If iIdTipoAnt > 0 Then
                 sSql := sSql + IntToStr( iIdTipoAnt )
              Else
                 sSql := sSql + 'NULL';

              sSql := sSql + ', TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', Date ) ) + ', ''DD/MM/YYYY'' ), ' +
                      IntToStr( iIdEtapa ) +
                      ', TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dDataFimPrev ) ) + ', ''DD/MM/YYYY'' ) )';

              Padroes.ExecSqlAndCommit( sSql );
{
              CdsInstEtapa.Append;
              CdsInstEtapa.FieldByName( 'IDPROCESSO' ).AsInteger    := iIdProc;
              CdsInstEtapa.FieldByName( 'DATAINIETAPA' ).AsDateTime := Date;

              If iIdTipoAnt > 0 Then
                 CdsInstEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger := iIdTipoAnt
              Else
                 CdsInstEtapa.FieldByName( 'IDTIPOETAPA' ).Clear;

              CdsInstEtapa.FieldByName( 'IDETAPAANT' ).AsInteger    := iIdEtapa;
              CdsInstEtapa.FieldByName( 'DATAFIMPREV' ).AsDateTime  := dDataFimPrev;
              CdsInstEtapa.Post;  }
           End Else Begin
              CdsEtapaAnd.First;

              While Not CdsEtapaAnd.EOF Do Begin
                    sSql := 'INSERT INTO RADINSTETAPA ( IDPROCESSO, IDETAPA, IDTIPOETAPA, ' +
                                    'DATAINIETAPA, IDETAPAANT, DATAFIMPREV ) ' +
                            'VALUES ( ' + IntToStr( iIdProc ) + ', ' +
                            IntToStr( LeUltRegistro( nil, 'RADINSTETAPA' ) ) + ', ' +
                            IntToStr( CdsEtapaAnd.FieldByName( 'IDTIPOETAPA' ).asInteger ) +
                            ', TO_DATE( ' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', Date ) ) + ', ''DD/MM/YYYY'' ), ' +
                            IntToStr( iIdEtapa ) +
                            ', TO_DATE( ';

                    If CdsEtapaAnd.FieldByName( 'FLGRETORETAPA' ).AsString = 'S' Then
                       sSql := sSql + QuotedStr( FormatDateTime( 'DD/MM/YYYY', CdsEtapa.FieldByName( 'DATAFIMPREV' ).AsDateTime ) )
                    Else
                       sSql := sSql + QuotedStr( FormatDateTime( 'DD/MM/YYYY', DiasUteis.SomaDiasUteis( Date, Rad.VerifNumDia( 'E', iIdTipoProc, CdsEtapaAnd.FieldByName( 'IDTIPOETAPA' ).asInteger ),
                                                 CdsEmpresaProp.FieldByName( 'IDCIDADES' ).AsInteger, CdsEmpresaProp.FieldByName( 'IDPAIS' ).AsInteger,
                                                 CdsEmpresaProp.FieldByName( 'IDESTADO' ).AsString, False, True, False ) ) );

                    sSql := sSql + ', ''DD/MM/YYYY'' ) )';
                    Padroes.ExecSqlAndCommit( sSql );
{
                    CdsInstEtapa.Append;
                    CdsInstEtapa.FieldByName( 'IDPROCESSO' ).AsInteger    := iIdProc;
                    CdsInstEtapa.FieldByName( 'DATAINIETAPA' ).AsDateTime := Date;
                    CdsInstEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger   := CdsEtapaAnd.FieldByName( 'IDTIPOETAPA' ).asInteger;
                    CdsInstEtapa.FieldByName( 'IDETAPAANT' ).AsInteger    := iIdEtapa;

                    If CdsEtapaAnd.FieldByName( 'FLGRETORETAPA' ).AsString = 'S' Then
                       CdsInstEtapa.FieldByName( 'DATAFIMPREV' ).AsDateTime := CdsEtapa.FieldByName( 'DATAFIMPREV' ).AsDateTime
                    Else
                       CdsInstEtapa.FieldByName( 'DATAFIMPREV' ).AsDateTime := DiasUteis.SomaDiasUteis( Date, Rad.VerifNumDia( 'E', iIdTipoProc, CdsEtapaAnd.FieldByName( 'IDTIPOETAPA' ).asInteger ),
                                           CdsEmpresaProp.FieldByName( 'IDCIDADES' ).AsInteger, CdsEmpresaProp.FieldByName( 'IDPAIS' ).AsInteger,
                                           CdsEmpresaProp.FieldByName( 'IDESTADO' ).AsString, False, True, False );

                    CdsInstEtapa.Post;  }
                    CdsEtapaAnd.Next;
              End;
           End;
        End;
     End;
  End;

  //Rad.FinalizaEtapa;
  bbtnSair.Click;
End;

procedure TFrmMTFinalizarEtapa.BtnConcluirClick(Sender: TObject);
Begin
  If MsgDlg( RgAut.Items.Strings[ RgAut.itemIndex ], 'Confirmação', mtConfirmation, [ mbNo, mbYes ], 0 ) = MrYes Then
     Concluir;
End;

procedure TFrmMTFinalizarEtapa.dblcAndamentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  CdsEtapaAnd.Close;
  SqlEtapaAnd.Prepare;
  SqlEtapaAnd.ParamByName( 'pIDTPPROC' ).asInteger  := iIdTipoProc;
  SqlEtapaAnd.ParamByName( 'pIDTPETAPA' ).asInteger := CdsEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger;

  If Trim( dblcAndamento.Text ) <> '' Then
     SqlEtapaAnd.ParamByName( 'pIDANDAMENTO' ).asInteger := StrToInt( dblcAndamento.LookUpValue )
  Else
     SqlEtapaAnd.ParamByName( 'pIDANDAMENTO' ).asInteger := -1;

  SqlEtapaAnd.Open;
end;

Function TFrmMTFinalizarEtapa.VerifUltAut( IdProc, IdEtapa: LongInt; sStatus: Char ): Boolean;
var
  bNaoAutorizou: boolean;

Begin
  Result        := True;
  bNaoAutorizou := False;

  If sStatus = 'S' Then Begin
     CdsAut.First;

     While Not CdsAut.EOF Do Begin
           CdsVerifAut.Close;
           SqlVerifAut.Prepare;
           SqlVerifAut.ParamByName( 'pIDPROC' ).asInteger          := IdProc;
           SqlVerifAut.ParamByName( 'pIDETAPA' ).asInteger         := IdEtapa;
           SqlVerifAut.ParamByName( 'pIDGRUPOAUTORIZA' ).AsInteger := CdsAut.FieldByName( 'IDGRUPOAUTORIZA' ).AsInteger;
           SqlVerifAut.Open;

           If Not CdsVerifAut.IsEmpty Then Begin
              Result := ( CdsVerifAut.FieldByName( 'NUMAUT' ).AsInteger - CdsAut.FieldByName( 'NUMAUTORIZACAO' ).AsInteger ) >= 0;

              // Início - Rodolpho da Silva - P:21549 - 21/03/2006
              //Exit;
              if not Result then
                 bNaoAutorizou := True;
              // Fim - Rodolpho da Silva - P:21549 - 21/03/2006

           End Else
              Result := False;

           CdsAut.Next;
     End;

     // Rodolpho da Silva - P:21549 - 21/03/2006
     Result := not bNaoAutorizou;
  End;
End;

Function TFrmMTFinalizarEtapa.VerifCriaProxima: Boolean;
Begin
   //Testa se pode criar a proxima etapa
   Result := True;
   CdsEtapaAnd.First;

   While Not CdsEtapaAnd.Eof do Begin
         CdsTestaEtapa.Close;
         SqlTestaEtapa.Prepare;
         SqlTestaEtapa.ParamByName( 'pIDPROC' ).asInteger      := iIdProc;
         //SqlTestaEtapa.ParamByName( 'pIDETAPA' ).asInteger     := iIdEtapa;
         SqlTestaEtapa.ParamByName( 'pIDTPPROC' ).asInteger    := iIdTipoProc;
         SqlTestaEtapa.ParamByName( 'pIDTPETAPA' ).asInteger   := CdsEtapaAnd.FieldByName( 'IDTIPOETAPA' ).asInteger;
         SqlTestaEtapa.ParamByName( 'pIDANDAMENTO' ).asInteger := StrToInt( dblcAndamento.LookupValue );
         SqlTestaEtapa.Open;

(*  select anterior, provavelmente errado, do SQLTESTAETAPA

         SELECT F.IDETAPAANT
  FROM RADFLUXO F,
       RADINSTETAPA IE
 WHERE ( IE.IDPROCESSO    = :pIDPROC )
   AND ( IE.IDETAPA      <> :pIDETAPA )
   AND ( F.IDTIPOPROCESSO = :pIDTPPROC )
   AND ( F.IDTIPOETAPA    = :pIDTPETAPA )
   AND ( F.IDANDAMENTO    = :pIDANDAMENTO )
   AND ( IE.DATAFIMETAPA IS NULL)
   AND ( F.IDETAPAANT     = IE.IDTIPOETAPA )

         *)

         If Not CdsTestaEtapa.IsEmpty Then Begin
            Result := False;
            Exit;
         end;

         CdsEtapaAnd.Next;
   end;
end;

procedure TFrmMTFinalizarEtapa.btnViewClick(Sender: TObject);
begin
  inherited;
  CdsEmpresaProp.Close;
  SqlEmpresaProp.Prepare;
  SqlEmpresaProp.ParamByName( 'pIDPESSOA' ).AsFloat := Sistema.idEmpresa;
  SqlEmpresaProp.Open;

  Application.CreateForm( TFrmMTAcompProc, FrmMTAcompProc );
  FrmMTAcompProc.sTipoProc := LbProc.Caption;
  FrmMTAcompProc.sObs      := MemObs.Text;
  FrmMTAcompProc.iNumProc  := iIdProc;
  FrmMTAcompProc.sPessoa   := sPessoa;
  FrmMTAcompProc.sDoc      := sDoc;
  FrmMTAcompProc.sUsuario  := sUsuario;
  FrmMTAcompProc.ShowModal;
end;

Function TFrmMTFinalizarEtapa.BuscaTipoEtapa( IdEtapa: LongInt; var dData: TDateTime ): LongInt;
Begin
  Result := -1;
  CdsBuscaEtapa.Close;
  SqlBuscaEtapa.Prepare;
  SqlBuscaEtapa.ParamByName( 'pIDETAPA' ).asInteger := IdEtapa;
  SqlBuscaEtapa.Open;

  If Not CdsBuscaEtapa.IsEmpty Then Begin
     Result := CdsBuscaEtapa.FieldByName( 'IDTIPOETAPA' ).asInteger;
     dData  := CdsBuscaEtapa.FieldByName( 'DATAFIMPREV' ).AsDateTime;
  End;
End;

end.

