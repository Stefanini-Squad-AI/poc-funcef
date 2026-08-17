unit FCadVinculacaoFuncional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, wwdbedit;

type
  TfrmCadVinculacaoFuncional = class(TfrmCadastroCS)
    lblCodigo: TLabel;
    lblDescMant: TLabel;
    dbedtCodigo: TwwDBEdit;
    dbedtDescricao: TwwDBEdit;
    qryAux: TwwQuery;
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVinculacaoFuncional: TfrmCadVinculacaoFuncional;

implementation

{$R *.DFM}

uses UDataBase, UMensErro, USistema;

procedure TfrmCadVinculacaoFuncional.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor then
     qry.Locate('CODVINCULAFUNC',MontaSelect.ValoresChave[0],[loPartialKey]) ;
end;

procedure TfrmCadVinculacaoFuncional.bbtnConfirmarClick(Sender: TObject);
begin
  // Critica Dados
  If (dbedtCodigo.Text   = '') Then Begin
    ShowMessage('Faltam Preencher Campos ...');
    dbedtCodigo.SetFocus;
    Exit;
  End;
  
  // Verifica Se Código já Cadastrado
  If (sbtnInserir.Down)  And
     ( FazQuery(QryAux,' SELECT CODVINCULAFUNC FROM VINCULAFUNC '+
                       ' WHERE RTRIM(CODVINCULAFUNC) = '+ QuotedStr(dbedtCodigo.Text)))
    Then  Begin
      MsgDlg('Código já Cadastrado. ','Erro ',mtError,[mbOk],0);
      dbedtCodigo.SetFocus;
      
      qry.FieldByName('CODVINCULAFUNC').Clear;
      
      qry.FieldByName('DESCRICAO').Clear;
      Exit;
    End;

  inherited;
end;

procedure TfrmCadVinculacaoFuncional.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbedtCodigo.Enabled := True;
  dbedtCodigo.SetFocus;
end;

procedure TfrmCadVinculacaoFuncional.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  dbedtCodigo.Enabled := False;
end;

procedure TfrmCadVinculacaoFuncional.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
