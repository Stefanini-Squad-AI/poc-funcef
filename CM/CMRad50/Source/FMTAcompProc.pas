{*******************************************************************************
  Alterações:
********************************************************************************
 Data      : 24.11.2006
 Autor     : Antonio Marcos Fernandes de Souza (amf)
 Descrição : Resolvido problema da visualização do form. Só aparecia após o segundo click no menu.
--------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 04/03/2004 (término)
 Autor     : David Ayrolla
 Pendência : 16164
 Descrição : Resolvido problema de tela piscando e colunas da grid organizadas.
--------------------------------------------------------------------------------}

unit FMTAcompProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  uCmSqlParams, Wwdatsrc, Db, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, ExtCtrls,
  TB97Tlbr, TB97, DBClient, uCMClientDataSet, MontaSelect, uCtrlRad, uDbImagens;

type
  TFrmMTAcompProc = class(TfrmSairAjuda)
    Label1: TLabel;
    LbProc: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    MemObsProc: TMemo;
    Label2: TLabel;
    dsEtapa: TwwDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LbNProc: TLabel;
    Panel3: TPanel;
    GrdAut: TwwDBGrid;
    dsAut: TwwDataSource;
    plnBem: TPanel;
    memOBS: TDBMemo;
    plnCapBem: TPanel;
    GrdEtapa: TwwDBGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    btnSeleciona: TBitBtn;
    msSeleciona: TMontaSelect;
    ToolbarSep971: TToolbarSep97;
    Label6: TLabel;
    LbPessoa: TLabel;
    Label7: TLabel;
    LbDoc: TLabel;
    Label8: TLabel;
    lbUsuario: TLabel;
    SqlAut: TCMSqlParams;
    CdsAut: TCMClientDataSet;
    CdsEtapa: TCMClientDataSet;
    SqlEtapa: TCMSqlParams;
    CdsVerifUsr: TCMClientDataSet;
    SqlVerifUsr: TCMSqlParams;
    BtnAnexo: TBitBtn;
    CdsImagem: TCMClientDataSet;
    SqlImagem: TCMSqlParams;
    DsImagem: TwwDataSource;
    CdsProc: TCMClientDataSet;
    SqlProc: TCMSqlParams;
    LbSituacao: TLabel;
    Label10: TLabel;
    CdsEtapaNOMETAPA: TStringField;
    CdsEtapaIDETAPA: TFloatField;
    CdsEtapaDATAINIETAPA: TDateTimeField;
    CdsEtapaDATAFIMPREV: TDateTimeField;
    CdsEtapaDATAFIMETAPA: TDateTimeField;
    procedure AssociaImagem( dsImg: TwwDataSource; pImagem: TBlobField;
              Campo: TFloatField; Descricao: string );
    procedure FormShow(Sender: TObject);
    procedure dsEtapaDataChange(Sender: TObject; Field: TField);
    procedure btnSelecionaClick(Sender: TObject);
    procedure BtnAnexoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

    //DAVID - Pendência 16164
    //Variável que indica que a tela já foi exibida, e não é preciso
    //mais reprocessá-la. 
    bJaExibiu : boolean;

    Rad: TCtrlRad;
    Function VerifUsu: Boolean;

  public
    { Public declarations }
    iNumProc : LongInt;
    sTipoProc: String;
    sPessoa  : String;
    sObs     : String;
    sDoc     : String;
    sUsuario : String;
    sSituacao: String;
  end;

var
  FrmMTAcompProc: TFrmMTAcompProc;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, fImagemDoc, DBaseDados;

procedure TFrmMTAcompProc.AssociaImagem( dsImg: TwwDataSource; pImagem: TBlobField;
          Campo: TFloatField; Descricao: string );
var
   frmImgDoc: TfrmImagemDoc;
begin
   Try
      Application.CreateForm( tfrmImagemDoc, frmImgDoc );

      With frmImgDoc Do Begin
           dsImagem := dsImg;
           Imagem   := pImagem;
           CampoPai := Campo;
           Caption  := Descricao;

           //bbtnAssociar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
           //bbtnLimpar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
           ShowModal;
      End;
   Finally
      frmImgDoc.free;
   End;
end;

procedure TFrmMTAcompProc.FormShow(Sender: TObject);
begin
  inherited;

  //DAVID - Pendência 16164
  if not bJaExibiu then
  begin

    Rad := TCtrlRad.Create;
    Rad.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
    Rad.CdsAnexo    := CdsImagem;
    Rad.CdsProcesso := CdsProc;

    LbProc.Caption  := sTipoProc;
    MemObsProc.Text := sObs;
    LbNProc.Caption := IntToStr( iNumProc );
    CdsEtapa.Close;
    SqlEtapa.Prepare;

    If sTipoProc <> '' Then Begin
       btnSeleciona.Visible := False;
       LbPessoa.Caption     := sPessoa;
       LbDoc.Caption        := sDoc;
       lbUsuario.Caption    := sUsuario;

       If sSituacao = 'N' Then
          lbSituacao.Caption := Translate( 'Pendente' )
       Else
       If sSituacao = 'S' Then
          lbSituacao.Caption := Translate( 'Autorizado' )
       Else
       If sSituacao = 'R' Then
          lbSituacao.Caption := Translate( 'Recusado' )
       Else
       If sSituacao = 'E' Then
          lbSituacao.Caption := Translate( 'Excluído' )
       Else
          lbSituacao.Caption := Translate( 'Desconhecido' );

       SqlEtapa.ParamByName( 'PIDPROC' ).AsInteger := iNumProc;
    End Else Begin
       btnSeleciona.Visible := True;
       LbPessoa.Caption     := '';
       LbDoc.Caption        := '';
       lbUsuario.Caption    := '';
       lbSituacao.Caption   := '';
       SqlEtapa.ParamByName( 'PIDPROC' ).AsInteger := -1;
    End;

    SqlEtapa.Open;

    //DAVID - Pendência 16164
    bJaExibiu := True;

  end;
end;

procedure TFrmMTAcompProc.dsEtapaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  If CdsEtapa.State <> dsInactive Then Begin
     CdsAut.DisableControls;
     CdsAut.Close;
     SqlAut.Prepare;
     SqlAut.ParambyName( 'pIDPROC' ).AsInteger  := iNumProc;
     SqlAut.ParambyName( 'pIDETAPA' ).AsInteger := CdsEtapa.FieldByName( 'IDETAPA' ).AsInteger;
     SqlAut.Open;
     CdsAut.EnableControls;
   End;
end;

procedure TFrmMTAcompProc.btnSelecionaClick(Sender: TObject);
begin
  inherited;
  msSeleciona.Executar;

  If msSeleciona.RetornouValor Then Begin
     If VerifUsu() then Begin
        LbProc.Caption    := msSeleciona.ValoresChave[ 0 ];
        MemObsProc.Text   := msSeleciona.ValoresChave[ 2 ];
        LbNProc.Caption   := msSeleciona.ValoresChave[ 1 ];
        LbPessoa.Caption  := msSeleciona.ValoresChave[ 3 ];
        LbDoc.Caption     := msSeleciona.ValoresChave[ 5 ];
        lbUsuario.Caption := msSeleciona.ValoresChave[ 6 ];
        iNumProc          := StrToInt( msSeleciona.ValoresChave[ 1 ] );

        CdsProc.Close;
        SqlProc.Prepare;
        SqlProc.ParamByName( 'pIDPROCESSO' ).AsFloat := iNumProc;
        SqlProc.Open;

        If CdsProc.FieldByName( 'FLGOK' ).AsString = 'N' Then
           lbSituacao.Caption := Translate( 'Pendente' )
        Else
        If CdsProc.FieldByName( 'FLGOK' ).AsString = 'S' Then
           lbSituacao.Caption := Translate( 'Autorizado' )
        Else
        If CdsProc.FieldByName( 'FLGOK' ).AsString = 'R' Then
           lbSituacao.Caption := Translate( 'Recusado' )
        Else
        If CdsProc.FieldByName( 'FLGOK' ).AsString = 'E' Then
           lbSituacao.Caption := Translate( 'Excluído' )
        Else
           lbSituacao.Caption := Translate( 'Desconhecido' );

        CdsEtapa.Close;
        SqlEtapa.Prepare;
        SqlEtapa.ParamByName( 'PIDPROC' ).AsInteger := iNumProc;
        SqlEtapa.Open;
        BtnAnexo.Enabled := ( CdsProc.FieldByName( 'IDUSUARIO' ).AsFloat = Sistema.IdUsuario );
     End Else Begin
        MsgDlg( 'Usuario não tem direito de  acesso ao processo', 'Erro', mtError, [mbOK], 0 );
        BtnAnexo.Enabled := False;
     End;
  End Else
     BtnAnexo.Enabled := False;
end;

Function TFrmMTAcompProc.VerifUsu: Boolean;
Begin
  CdsVerifUsr.Close;
  SqlVerifUsr.Prepare;
  SqlVerifUsr.ParamByName( 'pIDTIPOPROCESSO' ).AsFloat := StrToFloat( msSeleciona.ValoresChave[ 4 ] );
  SqlVerifUsr.ParamByName( 'pIDUSUARIO' ).AsInteger    := Sistema.IdUsuario;
  SqlVerifUsr.Open;
  Result := Not CdsVerifUsr.IsEmpty;
End;

procedure TFrmMTAcompProc.BtnAnexoClick(Sender: TObject);
begin
  inherited;
  CdsImagem.Close;
  SqlImagem.Prepare;
  SqlImagem.ParamByName( 'pIDPROCESSO' ).AsFloat := iNumProc;
  SqlImagem.Open;
  CdsProc.Edit;

  AssociaImagem( dsImagem, TBlobField( CdsImagem.FieldByName( 'IMAGEM' ) ),
                 TFloatField( CdsProc.FieldByName( 'IDIMAGEM' ) ), 'Anexo' );

  CdsProc.Post;

  If Not Rad.GravarAnexo() Then
     MsgDlg( Rad.MessageInfo, 'Erro', mtError, [mbOk], 0 );

  CdsImagem.Close;
end;

procedure TFrmMTAcompProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
end;

procedure TFrmMTAcompProc.FormCreate(Sender: TObject);
begin
  inherited;

  //DAVID - Pendência 16164
  bJaExibiu := False;
end;

end.

