//*****************************************************************************
// Data	     : 28/12/2006
// Código    : AL_1
// Pendencia : 24061
// Motivo(S) : Acerto na exclusão 
//******************************************************************************

unit FCadTipoAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, cmseldlg, wwidlg, Wwdatsrc, TB97Ctls,
  DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  MontaSelect, IvDictio, IvMulti, IvEMulti, wwdblook, FCadastroCS,
  wwDialog, CmEventosCadastro, ImgList, FCadastroCSInv, fcLabel;

type
  TFrmCadTipoAcao = class(TfrmCadastroCSInv)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    QryTipoAcaoCODTIPOACAO: TStringField;
    QryTipoAcaoDESCTIPOACAO: TStringField;
    Label2: TLabel;
    dbeCodigo: TDBEdit;
    Label3: TLabel;
    dbeDescricao: TDBEdit;
    QryAux: TwwQuery;
    Label20: TLabel;
    DblkcIndicador: TwwDBLookupCombo;
    qryIndicador: TwwQuery;
    QryTipoAcaoIDPARAMEMISSOR: TFloatField;
    QryTipoAcaoFLGVOTO: TStringField;
    DbCkVoto: TDBCheckBox;
    dbnav: TDBNavigator;
    srchdlgProcura: TwwSearchDialog;
    seldlgProcuraQry: TcmSelectDlg;
    qryIndicadorIDPARAMEMISSOR: TFloatField;
    qryIndicadorDESCPARAMEMISSOR: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  FrmCadTipoAcao: TFrmCadTipoAcao;

implementation

Uses UMensErro, UBibliotecaInvest, DBaseDados;
{$R *.DFM}

procedure TFrmCadTipoAcao.FormShow(Sender: TObject);
begin
  inherited;
  // Abre Querys
  qry.Open;
  qryIndicador.Open;
  // Desliga NavButton
  DbNav.Visible:=False;
  If qry.FieldByName('FLGVOTO').AsString <> 'S' Then
     DbCkVoto.Checked := False;
end;

procedure TFrmCadTipoAcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  qry.Close;
  qryIndicador.Close;
end;

procedure TFrmCadTipoAcao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // Desliga NavButton
  DbNav.Visible   :=False;
  dbeCodigo.Enabled := True;
  dbeCodigo.Color   := ClWindow;
  If qry.FieldByName('FLGVOTO').AsString <> 'S' Then
     DbCkVoto.Checked := False;
end;

procedure TFrmCadTipoAcao.bbtnConfirmarClick(Sender: TObject);
begin
   // Desliga NavButton
   DbNav.Visible:=False;
   // Testa parametros
   if Trim(dbeCodigo.Text) = '' then begin
     MsgDlg('Código deve ser informado. ','Erro',mtError,[mbOK],0);
     dbeDescricao.SetFocus;
     exit;
   end;
   if Trim(dbeDescricao.Text) = '' then begin
     MsgDlg('Descrição deve ser informada . ','Erro',mtError,[mbOK],0);
     dbeCodigo.SetFocus;
     exit;
   end;

   // Caso Inserindo Insere no Subtipo (TIPOTITULO) ...
   If sbtnInserir.Down = True Then
   Begin
      If FazQuery(QryAux,'SELECT CODTIPTITULO FROM TIPOTITULO '+
                         'WHERE IDTIPOINVEST = 2 AND CODTIPTITULO = '''+
                         dbeCodigo.Text+'''') Then
      Begin
         MsgDlg('Código do Tipo de Ação já existe ','Mensagem do Sistema ', MtError, [MbOk],0);
         Exit;
      End;
      ExecutaQuery(QryAux,'INSERT INTO TIPOTITULO (IDTIPOINVEST,CODTIPTITULO) '+
                          'VALUES (2,'''+dbeCodigo.Text+''')');
   End;
   inherited;
   // Desliga NavButton
   DbNav.Visible   := False;
   dbeCodigo.Enabled := True;
   dbeCodigo.Color   := ClWindow;
   If qry.FieldByName('FLGVOTO').AsString <> 'S' Then
      DbCkVoto.Checked := False;
End;

procedure TFrmCadTipoAcao.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbeCodigo.Enabled := False;
  dbeCodigo.Color   := clSilver;
  If qry.FieldByName('FLGVOTO').AsString <> 'S' Then
     DbCkVoto.Checked := False;
end;

procedure TFrmCadTipoAcao.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbeCodigo.Enabled := True;
  dbeCodigo.Color   := ClWindow;

  // Para o check box não ficar cinza
  qry.FieldByName('FLGVOTO').AsString := 'N';
end;

procedure TFrmCadTipoAcao.sbtnApagarClick(Sender: TObject);
begin
   //AL_1
   ExecutaQuery(QryAux,'SELECT CODTIPTITULO FROM PADRLANCCONTINV  '+
                       'WHERE IDTIPOINVEST = 2 AND CODTIPTITULO = '''+ dbeCodigo.Text+'''');
   if not QryAux.IsEmpty then
   Begin
      MsgDlg('Código do Tipo de Título '+ dbeCodigo.Text + ' do Tipo de Ação ' + #13 +
             'está em uso na Parametrização Contábil.','Mensagem do Sistema ', MtError, [MbOk],0);
      Exit;
   End
   else
   begin
      If (MsgDlg('Deseja realmente excluir este registro ?',
         'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then
      Begin
         With qryAux Do
         Begin
            Try
               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               if not ExecutaQuery(QryAux,'DELETE FROM TIPOTITULO WHERE IDTIPOINVEST = 2 AND ' +
                                          'CODTIPTITULO = '+ QuotedStr(qry.FieldByName('CODTIPOACAO').AsString)) then
                  Raise Exception.Create('Não foi possível excluir o Tipo de Título. '+ qry.FieldByName('CODTIPOACAO').AsString);

               if not ExecutaQuery(QryAux,'DELETE FROM TIPOACAO WHERE ' +
                                          'CODTIPOACAO = '+ QuotedStr(qry.FieldByName('CODTIPOACAO').AsString)) then
                  Raise Exception.Create('Não foi possível excluir o Tipo de Ação. '+ qry.FieldByName('CODTIPOACAO').AsString);

               DtmBaseDados.dbBaseDados.Commit;
            except on E: Exception do
               begin
                  DtmBaseDados.dbBaseDados.Rollback;
                  MsgDlg('Ocorreu um problema na exclusão do Tipo de Ação.'+ #13 +
                          E.Message,'Mensagem do Sistema ',mtError,[mbOK],0);
               end;
            End;
         End;
      End;
   end;
   qry.Close;
   qry.Open;
   bbtnCancelarClick(sender);
   
  //Inherited;
  SbtnApagar.Down := False;
  // Desliga NavButton
  DbNav.Visible:=False;
end;

procedure TFrmCadTipoAcao.CmeCadastroFind(Sender: TObject);
begin
  // Busca Registro
  If (MontaSelect.ValoresChave.Count > 0) And
    (MontaSelect.ValoresChave[0] <> '') Then Begin
    qry.Close;
    qry.ParamByName('pCODTIPOACAO').AsString := MontaSelect.ValoresChave[0];
    qry.Open;
  end;
  If qry.FieldByName('FLGVOTO').AsString <> 'S' Then
     DbCkVoto.Checked := False;
end;

end.
