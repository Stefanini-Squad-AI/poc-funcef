{--------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina ......: sbtnApagarClick
SOL..........: 163982/7002
Kintana......: 1489801
Data.........: 18/11/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi corrigida a rotina para excluir uma atividade.
--------------------------------------------------------------------------------
Rotina ......: treeAtividade
SOL..........: 163982/6981
Kintana......: 1486479
Data.........: 22/11/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi alterada a rotina de alterar para travar a árvore quando uma
               opção é escolhida
--------------------------------------------------------------------------------
Rotina ......: dbckAtivo e CmeCadastroInsert
SOL..........: 163982
Kintana......: 163982
Data.........: 20/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi criado um compo para controlar as atividades ativas.
Alteração .dfm: Foi criado um componente do tipo DbCheck
--------------------------------------------------------------------------------}
unit FCadAbcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, wwdbedit, Buttons, wwdblook, StdCtrls, Mask, DBCtrls,
  ComCtrls, CMTree, MontaSelect, Db, DBClient, uCMClientDataSet, uModulo,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlParamGlobal,
  uCtrlUsuarioSistema, uCtrlUnidNegocio, uCMTreeViewMT
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TfrmCadABC = class(TFrmCadastroMT)
    pnlTree: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    lblFormaRecPag: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edAtividade: TDBEdit;
    dblkUsuario: TwwDBLookupCombo;
    pnAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    dbedCodigo: TwwDBEdit;
    dbedAtivProj: TwwDBEdit;
    CdsUsuario: TCMClientDataSet;
    CdsParamGlobal: TCMClientDataSet;
    CdsProcura: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    treeAtividade: TCMTreeViewMT;
    CdsUnidNegocio: TCMClientDataSet;
    dbckAtivo: TDBCheckBox;
    procedure treeAtividadeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    sMascaraABC: String;
    ind        : Integer;
    lNivel     : Array[0..20] of Integer;
    bMontandoArvore: Boolean;
  public
    { Public declarations }
    ParamGlobal: TCtrlParamGlobal;
    Usuario: TCtrlUsuarioSistema;
    UnidNegocio: TCtrlUnidNegocio;
    Modulo: TModulo;
    procedure PegaRegUnidNegocio( State: TDataSetState );
    procedure CopiaRegUnidNegocio( State: TDataSetState );
    procedure Seleciona( IDPessoa: Double = 0 );
  end;

var
  frmCadABC: TfrmCadABC;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadABC.PegaRegUnidNegocio( State: TDataSetState );
begin
  If State = DsInsert Then
     CdsUnidNegocio.Data := UnidNegocio.ListaUnidNegocio( -1 )
  Else
     CdsUnidNegocio.Data := UnidNegocio.ListaUnidNegocio( Sistema.IdEmpresa,
                                Cds.FieldByName( 'UNIDNEGOC'{ivlm} ).AsFloat );
end;

procedure TfrmCadABC.CopiaRegUnidNegocio( State: TDatasetState );
var
  i: Integer;
begin
  If State = dsInsert Then
     CdsUnidNegocio.Append
  Else
     CdsUnidNegocio.Edit;

  For i := 0 To Cds.Fields.Count - 1 Do
      CdsUnidNegocio.Fields[ i ].Value := Cds.Fields[ i ].Value;

  CdsUnidNegocio.Post;
end;

procedure TfrmCadABC.Seleciona( IDPessoa: Double );
begin
  cds.Data := UnidNegocio.ListaUnidNegocio( IdPessoa );
  cdsProcura.Data := cds.Data;
end;

procedure TfrmCadABC.treeAtividadeChange(Sender: TObject);
begin
  inherited;
  If cds.FieldByName('UNETIPO'{ivlm}).AsString = 'A'{ivlm} Then
     sbtnAnalitico.Down := True
  Else
     If cds.FieldByName('UNETIPO'{ivlm}).AsString = 'S'{ivlm} Then
        sbtnSintetico.Down := True;
end;

procedure TfrmCadABC.FormCreate(Sender: TObject);
begin
  inherited;
  bMontandoArvore := False;
  Modulo := TModulo.Create;
  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  ParamGlobal := TCtrlParamGlobal.Create;
  ParamGlobal.Initialize( DtmBaseDados.dbBaseDados, False, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Usuario := TCtrlUsuarioSistema.Create;
  Usuario.Initialize( DtmBaseDados.dbBaseDados, False, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  UnidNegocio.cds := CdsUnidNegocio;
  Seleciona( Sistema.IdEmpresa );
  CdsUnidNegocio.Data := Cds.Data;
  CdsUnidNegocio.EmptyDataSet;

  Try
     CdsParamGlobal.Data := ParamGlobal.ListaParamGlobal( Sistema.IdEmpresa );
     sMascaraABC := CdsParamGlobal.FieldByName('MASCUNIDNEGOC'{ivlm}).AsString;
     CdsParamGlobal.Close;

     If Not Modulo.VerificaMascara( sMascaraABC, lNivel, ind ) Then Begin
        MessageBeep(0);
        ShowMessage(Translate('Máscara ABC Inválida.'));
        Exit;
     End;

     cds.FieldByName( 'UNECODIGO'{ivlm} ).EditMask := sMascaraABC + ';0; '{ivlm};
     MontaSelect.Mascaras[ 0 ] := cds.FieldByName( 'UNECODIGO'{ivlm} ).EditMask;
     MontaSelect.Filtro.Add( 'IDPESSOA = '{ivlm} + IntToStr( Sistema.IdEmpresa ) );
     treeAtividade.mascara := sMascaraABC;
     CdsUsuario.Data := Usuario.ListaUsuarioSistema();

     bMontandoArvore := True;
     treeAtividade.MontaArvore;
     bMontandoArvore := False;
  Except
     Raise;
  End;
end;

procedure TfrmCadABC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ParamGlobal.Free;
  Usuario.Free;
  Unidnegocio.Free;
  Modulo.Free;
end;

procedure TfrmCadABC.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If Not bMontandoArvore Then Begin
     If cds.FieldByName('UNETIPO'{ivlm}).AsString = 'A'{ivlm} Then
        sbtnAnalitico.Down := True
     Else
        If cds.FieldByName('UNETIPO'{ivlm}).AsString = 'S'{ivlm} Then
           sbtnSintetico.Down := True;
  End;
end;

procedure TfrmCadABC.sbtnAnaliticoClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('UNETIPO'{ivlm}).AsString := 'A'{ivlm};
end;

procedure TfrmCadABC.sbtnSinteticoClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('UNETIPO'{ivlm}).AsString := 'S'{ivlm};
end;

procedure TfrmCadABC.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     cds.Locate( 'UNIDNEGOC'{ivlm}, MontaSelect.ValoresChave[0], [loPartialKey] );
end;

procedure TfrmCadABC.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CopiaRegUnidNegocio( DsInsert );
  Accept := UnidNegocio.Gravar;
end;

procedure TfrmCadABC.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsUnidNegocio.Delete;
  Accept := UnidNegocio.Gravar;
end;

procedure TfrmCadABC.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( UnidNegocio.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TfrmCadABC.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  PegaRegUnidNegocio( DsEdit );
  pnlFundo.Enabled := True;
  treeAtividade.Enabled := False;
  dbedCodigo.Enabled := False;

  If dbedAtivProj.CanFocus Then
     dbedAtivProj.SetFocus;
end;

procedure TfrmCadABC.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  PegaRegUnidNegocio( DsInsert );
  treeAtividade.Enabled := False;
  //Vinicius Maciel SOl 163982 KTN 163982
  cds.FieldByName('ATIVO').asString := 'S';
  //Vinicius Maciel SOl 163982 KTN 163982 - Fim
  cds.FieldByName( 'IDPESSOA'{ivlm} ).AsFloat := Sistema.IdEmpresa;
  dbedCodigo.Enabled := True;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadABC.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  TreeAtividade.Enabled := Not cds.IsEmpty;

  If CmeCadastro.Operacao = OpInserir Then
     sbtnAlterar.Enabled := False
  Else
     sbtnAlterar.Enabled := Not cds.IsEmpty;

  If CmeCadastro.Operacao In [OpAlterar, OpInserir] Then
     sbtnApagar.Enabled := False
  Else
     sbtnApagar.Enabled := Not cds.IsEmpty;
end;

procedure TfrmCadABC.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Seleciona( Sistema.IdEmpresa );
  cds.FieldByName( 'UNECODIGO'{ivlm} ).EditMask := sMascaraABC + ';0; '{ivlm};
end;

procedure TfrmCadABC.sbtnApagarClick(Sender: TObject);
begin
    //Vinicius Maciel - SOL163982/7002 - KTN1489801
  if cds.isEmpty then
      CmeCadastro.Operacao := opVazio
   else
      CmeCadastro.Operacao := opIdle;
  //Vinicius Maciel - SOL163982/7002 - KTN1489801 - FIM 
  Try
     CdsAux.Data := UnidNegocio.GetDataPacket( 'SELECT UNIDNEGOC FROM LANCAMENTO WHERE UNIDNEGOC = '{ivlm} +
                                               cds.FieldByName( 'UNIDNEGOC'{ivlm} ).AsString );

     If Not CdsAux.IsEmpty Then Begin
        CdsAux.Close;
        MsgDlg( 'Este custo baseado em atividade não pode ser excluído', 'Erro', mtError, [mbOk], 0 );
        sbtnApagar.Down := False;
        Exit;
     End;

     CdsAux.Data := UnidNegocio.GetDataPacket( 'SELECT UNIDNEGOC FROM PLANOSALDO WHERE UNIDNEGOC = '{ivlm} +
                                               cds.FieldByName( 'UNIDNEGOC'{ivlm} ).AsString );

     If Not CdsAux.IsEmpty Then Begin
        CdsAux.Close;
        MsgDlg( 'Este custo baseado em atividade não pode ser excluído', 'Erro', mtError, [mbOk], 0 );
        sbtnApagar.Down := False;
        Exit;
     End;

     CdsAux.Data := UnidNegocio.GetDataPacket( 'SELECT UNIDNEGOC FROM TIPOAPLICACAO WHERE UNIDNEGOC = '{ivlm} +
                                               cds.FieldByName( 'UNIDNEGOC'{ivlm} ).AsString );

     If Not CdsAux.IsEmpty Then Begin
        CdsAux.Close;
        MsgDlg( 'Este custo baseado em atividade não pode ser excluído', 'Erro', mtError, [mbOk], 0 );
        sbtnApagar.Down := False;
        Exit;
     End;

     CdsAux.Data := UnidNegocio.ListaUnidNegocioLike( Sistema.Idempresa, cds.FieldByName( 'UNECODIGO'{ivlm} ).AsString );

     If Not CdsAux.IsEmpty Then Begin
        CdsAux.Close;
        MsgDlg( 'A atividade possui Filho(s)', 'Erro', mtError, [mbOk], 0 );
        sbtnApagar.Down := False;
        Exit;
     End;

     CdsAux.Close;
     inherited;
  Except
     CdsAux.Close;
     MsgDlg('O Centro de Centro de Custo possui Filho(s)','Atenção',mtWarning,[mbok],0);
  End;
end;

procedure TfrmCadABC.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CopiaRegUnidNegocio( DsEdit );
  Accept := UnidNegocio.Gravar;
end;

procedure TfrmCadABC.CmeCadastroDelete(Sender: TObject);
begin
  If treeAtividade.Selected.HasChildren then
     MsgDlg('A Atividadde/Projeto possui Filho(s)', 'Atenção', mtWarning, [mbok], 0)
  Else Begin
     PegaRegUnidNegocio( DsEdit );
     inherited;
  End;
end;

procedure TfrmCadABC.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
  iGrau: Integer;
  sPai:  String;
  EstadoQry: TDatasetState;
begin
  inherited;
  EstadoQry := Cds.State;

  If EstadoQry In [ DsEdit, DsInsert ] Then Begin
     Try
        sPai  := '';
        iGrau := 0;

        If Trim( DbedCodigo.Text ) <> '' Then Begin
           iGrau := Modulo.CalcGrau( Trim( DbedCodigo.Text ), lNivel, ind, sPai );

           If iGrau = 0 Then Begin
              MessageBeep( 0 );
              UnidNegocio.MessageInfo := 'Máscara Inválida';
              Accept := False;

              If dbedCodigo.CanFocus Then
                 DbedCodigo.SetFocus;

              Exit;
           End;
        End;

        If EstadoQry = DsInsert Then
           // Verifica se o tipo de Desemb já está cadastrado
           If cdsProcura.Locate( 'UNECODIGO'{ivlm}, Trim( DbEdCodigo.Text ), [] ) Then Begin
              UnidNegocio.MessageInfo := 'Atividade/Projeto já cadastrada.';
              Accept := False;

              If dbedCodigo.CanFocus Then
                 DbedCodigo.SetFocus;

              Exit;
           End;

        If iGrau > 1 Then Begin
           // Verifica se conta pai é sintética
           If Not cdsProcura.Locate( 'UNECODIGO'{ivlm}, Trim( sPai ), [] ) Then Begin // não tem pai
              UnidNegocio.MessageInfo := 'Código cadastrado não tem pai';
              Accept := False;

              If dbedCodigo.CanFocus Then
                 DbedCodigo.SetFocus;

              Exit;
           End Else Begin
              If cdsProcura.FieldByName( 'UNETIPO'{ivlm} ).AsString = 'A'{ivlm} Then Begin // pai é analítico
                 UnidNegocio.MessageInfo :=  'Atividade / Projeto Pai é analítico';
                 Accept := False;

                 If dbedCodigo.CanFocus Then
                    DbedCodigo.SetFocus;

                 Exit;
              End;
           End;
        End;

        If sbtnAnalitico.Down Then
           Cds.FieldByName( 'UNETIPO'{ivlm} ).AsString := 'A'{ivlm}
        Else
           Cds.FieldByName( 'UNETIPO'{ivlm} ).AsString := 'S'{ivlm};


        treeAtividade.Enabled := ( Cds.State = dsEdit );

     Except
        Raise;
     End;
  End;
end;

procedure TfrmCadABC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  treeAtividade.Enabled := true; //Vinicius Maciel SOL163982/6981 - KTN486479
end;

procedure TfrmCadABC.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  treeAtividade.Enabled := true; //Vinicius Maciel SOL163982/6981 - KTN486479
end;

procedure TfrmCadABC.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  treeAtividade.Enabled := false; //Vinicius Maciel SOL163982/6981 - KTN486479
end;

end.

