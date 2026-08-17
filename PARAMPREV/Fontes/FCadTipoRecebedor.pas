unit FCadTipoRecebedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  Mask, wwdbedit;

type
  TfrmCadTipoRecebedor = class(TFrmCadastroGridCS)
    dbedtCodigo: TwwDBEdit;
    dbedtDesc: TwwDBEdit;
    lblCodigo: TLabel;
    Label1: TLabel;
    qryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoRecebedor: TfrmCadTipoRecebedor;

implementation

{$R *.DFM}

uses UDataBase, UMensErro, USistema;

procedure TfrmCadTipoRecebedor.bbtnConfirmarClick(Sender: TObject);
begin
   // Critica Dados
  If (dbedtCodigo.Text   = '') Then Begin
    ShowMessage('Falta Preencher Campos ...');
    dbedtCodigo.SetFocus;
    Exit;
  End;
  
  // Verifica Se Código já Cadastrado
  If (sbtnInserir.Down)  And
     ( FazQuery(QryAux,' SELECT  CODTIPORECEBEDOR FROM TIPORECEBEDOR '+
                       ' WHERE RTRIM(CODTIPORECEBEDOR) = '+ QuotedStr(dbedtCodigo.Text)))
    Then  Begin
      MsgDlg('Código já Cadastrado. ','Erro ',mtError,[mbOk],0);
      dbedtCodigo.SetFocus;
      Exit;
    End;
  inherited;  
end;

procedure TfrmCadTipoRecebedor.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbedtCodigo.Enabled := True;  
  dbedtCodigo.SetFocus;
end;

procedure TfrmCadTipoRecebedor.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor then
   begin
     qry.Locate('CODTIPORECEBEDOR',MontaSelect.ValoresChave[0],[loPartialKey]) ;
   end;
end;

procedure TfrmCadTipoRecebedor.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   dbedtCodigo.Enabled := False;
end;

procedure TfrmCadTipoRecebedor.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dbedtCodigo.Enabled := False;
end;

procedure TfrmCadTipoRecebedor.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
