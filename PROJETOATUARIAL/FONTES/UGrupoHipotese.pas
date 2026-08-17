//------------------------------------------------------------------
// Sistema   .: Sistema de Cálculos Atuariais
// Objetivo  .: Formulário de Grupos de Hipoteses
//              Form - FrmGrupoHipotese  /  Unit - UGrupoHipotese
// Data      .: 10/07/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
unit UGrupoHipotese;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery, TB97Ctls, TB97Tlbr, ZipDir, ZipMstr, IvDictio,
  IvMulti, IvEMulti;


type
  TFrmGrupoHipotese = class(TfrmCadastro)
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    PgCtrlDetalhe: TPageControl;
    tbshDetalhe: TTabSheet;
    DbGrdDet: TwwDBGrid;
    PnlDetalhe: TPanel;
    DBEdit2: TDBEdit;
    pnlBarraDetalhe: TPanel;
    BtProc: TSpeedButton;
    BtExcl: TSpeedButton;
    btAlt: TSpeedButton;
    BtIns: TSpeedButton;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    QryPrincipal: TwwQuery;
    QryAux: TwwQuery;
    QryDetalhe: TwwQuery;
    DsDet: TwwDataSource;
    QryPrincipalIDGRUPOHIPOTESE: TFloatField;
    QryPrincipalDESCRICAO: TStringField;
    QryPrincipalOBSERVACAO: TStringField;
    QryDetalheIDGRUPOHIPOTESE: TFloatField;
    QryDetalheIDHIPOTESE: TFloatField;
    QryDetalheDESCRICAO: TStringField;
    QryDetalheOBSERVACAO: TStringField;
    Label5: TLabel;
    DBMemo2: TDBMemo;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DsAuxiliar: TwwDataSource;
    QryAuxiliar: TwwQuery;
    QryDetalheVLRHIPOTESES: TStringField;
    QryDetalheREFERENCIA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure BtExclClick(Sender: TObject);
    procedure BtInsClick(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure BtProcClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DbGrdDetDblClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    Function  TrocaVirgulaPonto(Value: String): String;
    procedure SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  function SePublicada : boolean;
  end;

var
  FrmGrupoHipotese: TFrmGrupoHipotese;

implementation

uses UDataBase,UBibliotecaAtuarial,Usistema;

{$R *.DFM}

procedure TFrmGrupoHipotese.FormShow(Sender: TObject);
begin
  inherited;
// Abre As Querys
  QryPrincipal.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible:=True;
// Verifica se Existe a Tabela Generica de Hipoetses
  FazQuery(QryAux,'SELECT CODTABELA FROM '+sistema.PrefixoServidor+'TABGENER WHERE CODTABELA = '+
                  '''TABHIPOTESES''');
  If QryAux.IsEmpty Then Begin
// Cria Tabela
    ExecutarQuery(QryAux,'INSERT INTO TABGENER (CODTABELA,DESCRICAO) VALUES '+
    '('''+'TABHIPOTESES'''+','''+'TABELA DE HIPOTESES ATUARIAIS'''+')');
// Cria Campos - Grupo de HIpoteses
    ExecutarQuery(QryAux,'INSERT INTO CAMPOTABGENER (CODTABELA,CODCAMPO,DESCRICAO,IDTIPODADO)'+
    ' VALUES ('''+'TABHIPOTESES'''+',''IDGRUPOHIPOTESE'''+',''ID DO GRUPO DE HIPOTESES'''+
    ',''1'''+')');
// Id da Hipotese
    ExecutarQuery(QryAux,'INSERT INTO CAMPOTABGENER (CODTABELA,CODCAMPO,DESCRICAO,IDTIPODADO)'+
    ' VALUES ('''+'TABHIPOTESES'''+',''IDHIPOTESE'''+',''ID DA HIPOTESE'''+
    ',''1'''+')');
// Descricao da Hipotese
    ExecutarQuery(QryAux,'INSERT INTO CAMPOTABGENER (CODTABELA,CODCAMPO,DESCRICAO,IDTIPODADO)'+
    ' VALUES ('''+'TABHIPOTESES'''+',''DESCRICAO'''+',''DESCRICAO DA HIPOTESE'''+
    ',''2'''+')');
//-----------------------------------------------------------------------------------------------
// Valor da Hipotese
    ExecutarQuery(QryAux,'INSERT INTO CAMPOTABGENER (CODTABELA,CODCAMPO,DESCRICAO,IDTIPODADO)'+
    ' VALUES ('''+'TABHIPOTESES'''+',''VLRHIPOTESES'''+',''VALOR DA HIPOTESE'''+
    ',''2'''+')');
// Referencia da Hipotese
    ExecutarQuery(QryAux,'INSERT INTO CAMPOTABGENER (CODTABELA,CODCAMPO,DESCRICAO,IDTIPODADO)'+
    ' VALUES ('''+'TABHIPOTESES'''+',''REFERENCIA'''+',''REFERENCIA DA HIPOTESE '''+
    ',''2'''+')');
  End;
  QryDetalhe.Open;
end;

procedure TFrmGrupoHipotese.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha As Querys
  QryPrincipal.Close;
  QryDetalhe.Close;
end;

procedure TFrmGrupoHipotese.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
// Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
    QryPrincipal.FieldByName('IDGRUPOHIPOTESE').AsInteger :=
        LeUltRegistro(qryAux,'GRUPOSDEHIPOTESES');
end;

procedure TFrmGrupoHipotese.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
// Caso Botao Incluir Cria Novo Registro
  If BtIns.Down = True Then Begin
    QryDetalhe.FieldByName('IDHIPOTESE').AsInteger :=
        LeUltRegistro(qryAux,'HIPOTESES');
// Campo de Grupo = Principal
    QryDetalhe.FieldByName('IDGRUPOHIPOTESE').AsInteger :=
        QryPrincipal.FieldByName('IDGRUPOHIPOTESE').AsInteger;
  End;
end;

procedure TFrmGrupoHipotese.bbtnOkDetClick(Sender: TObject);
Var
  wNumLinha:Integer;
begin
// Caso Campos Obrigatórios Não Preen....
  If (QryDetalhe.FieldByName('REFERENCIA').AsString='') Or
     (QryDetalhe.FieldByName('DESCRICAO').AsString='') Then Begin
    ShowMessage('Campos Obrigátorios não Preencidos !!!');
    Exit;
  End;

  inherited;
// Verifica Se Já Existe Referencia na Tabela
  If BtIns.Down=True Then Begin
    FazQuery(QryAuxiliar,'SELECT REFERENCIA FROM '+sistema.PrefixoServidor+' HIPOTESES WHERE REFERENCIA = '''+
             QryDetalhe.FieldByName('REFERENCIA').AsString+'''');
// Caso Já Existe da Erro
    If Not QryAuxiliar.IsEmpty Then Begin
      ShowMessage('Referência Já Existe .....');
      DbEdit4.SetFocus;
      Exit;
    End;
  End;
// Baixa na Tabela
  QryDetalhe.Post;
// Caso Inclusao Ja Inclui Outro
  If BtIns.Down=True Then Begin
// Busca Ultima Linha da Tabela
    FazQuery(QryAux,'SELECT DISTINCT NUMLINHA FROM '+sistema.PrefixoServidor+'VALTABGENER WHERE CODTABELA = '+
    '''TABHIPOTESES'' ORDER BY NUMLINHA');
    QryAux.Last;
    wNumLinha:=(QryAux.FieldByName('NUMLINHA').AsInteger+1);

// Cria Campos - Grupo de Hipoteses
    ExecutarQuery(QryAux,'INSERT INTO VALTABGENER (CODTABELA,NUMLINHA,CODCAMPO,VALOR)'+
    ' VALUES ('''+'TABHIPOTESES'','+IntToStr(wNumLinha)+
    ',''IDGRUPOHIPOTESE'','+QryDetalhe.FieldByName('IDGRUPOHIPOTESE').AsString+')');

// Cria Campos - Hipoteses
    ExecutarQuery(QryAux,'INSERT INTO VALTABGENER (CODTABELA,NUMLINHA,CODCAMPO,VALOR)'+
    ' VALUES ('''+'TABHIPOTESES'','+IntToStr(wNumLinha)+
    ',''IDHIPOTESE'','+QryDetalhe.FieldByName('IDHIPOTESE').AsString+')');

// Cria Campos - Descricao
    ExecutarQuery(QryAux,'INSERT INTO VALTABGENER (CODTABELA,NUMLINHA,CODCAMPO,VALOR)'+
    ' VALUES ('''+'TABHIPOTESES'','+IntToStr(wNumLinha)+
    ',''DESCRICAO'','''+QryDetalhe.FieldByName('DESCRICAO').AsString+''')');

// Cria Campos - Valor da Hipotese
    ExecutarQuery(QryAux,'INSERT INTO VALTABGENER (CODTABELA,NUMLINHA,CODCAMPO,VALOR)'+
    ' VALUES ('''+'TABHIPOTESES'','+IntToStr(wNumLinha)+
    ',''VLRHIPOTESES'','''+TrocaVirgulaPonto(QryDetalhe.FieldByName('VLRHIPOTESES').AsString)+''')');

// Cria Campos - Referencia da Hipotese
    ExecutarQuery(QryAux,'INSERT INTO VALTABGENER (CODTABELA,NUMLINHA,CODCAMPO,VALOR)'+
    ' VALUES ('''+'TABHIPOTESES'','+IntToStr(wNumLinha)+
    ',''REFERENCIA'','''+QryDetalhe.FieldByName('REFERENCIA').AsString+''')');

    QryDetalhe.Append;
    DbEdit4.SetFocus;
  End Else Begin
// Altera Campos Campos - Referencia da Hipotese
    FazQuery(QryAux,'SELECT NUMLINHA FROM '+sistema.PrefixoServidor+'VALTABGENER '+
                    'WHERE CODTABELA = ''TABHIPOTESES'' AND '+
                    'CODCAMPO = ''IDHIPOTESE'' AND '+
                    'VALOR = '+QryDetalhe.FieldByName('IDHIPOTESE').AsString);
// Numero da Linha
    wNumLinha:=(QryAux.FieldByName('NUMLINHA').AsInteger);
// Descricao
    ExecutarQuery(QryAux,'UPDATE VALTABGENER SET VALOR = '''+
                        QryDetalhe.FieldByName('DESCRICAO').AsString+''' '+
                        'WHERE CODTABELA = ''TABHIPOTESES'' AND '+
                        'CODCAMPO  = ''DESCRICAO''          AND '+
                        'NUMLINHA  = '+IntToStr(wNumLinha));
// Valor
    ExecutarQuery(QryAux,'UPDATE VALTABGENER SET VALOR = '''+
                        QryDetalhe.FieldByName('VLRHIPOTESES').AsString+''' '+
                        'WHERE CODTABELA = ''TABHIPOTESES'' AND '+
                        'CODCAMPO  = ''VLRHIPOTESES''         AND '+
                        'NUMLINHA  = '+IntToStr(wNumLinha));
// Referencia
    ExecutarQuery(QryAux,'UPDATE VALTABGENER SET VALOR = '''+
                        QryDetalhe.FieldByName('REFERENCIA').AsString+''' '+
                        'WHERE CODTABELA = ''TABHIPOTESES'' AND '+
                        'CODCAMPO  = ''REFERENCIA''         AND '+
                        'NUMLINHA  = '+IntToStr(wNumLinha));

// Alterar Registro
    QryDetalhe.Edit;
  End;
end;

procedure TFrmGrupoHipotese.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Cancela Operacao
  QryDetalhe.Cancel;
// Levanta Botoes
  BtIns.Down :=False;
  BtAlt.Down :=False;
// Inabilita Botoes
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
// ReExecuta a Query
  QryDetalhe.Close;
  QryDetalhe.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible  :=True;
// Mostra Incluidos
  DbGrdDet.ApplySelected;

end;

procedure TFrmGrupoHipotese.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
// Executa query de Detalhe
  With QryDetalhe Do Begin
    Close;
    Open;
  End;
end;

function TFrmGrupoHipotese.SePublicada : boolean;
Var
  num,elemento,pesquisa : string;
  pub : boolean;
begin
 pub := false;
 pesquisa := 'SELECT A.IDSIMULACAO,A.IDGRUPOHIPOTESE,A.PUBLICADA FROM '+
             sistema.PrefixoServidor+'SIMULACOES A, '+
             sistema.PrefixoServidor+'GRUPOSDEHIPOTESES B '+
             'WHERE B.IDGRUPOHIPOTESE  = '+IntToStr(qryprincipal['IDGRUPOHIPOTESE'])+' AND '+
             'A.IDGRUPOHIPOTESE = B.IDGRUPOHIPOTESE';
 FazQuery(QryAux,pesquisa);
 if not QryAux.eof then begin
   elemento := '';
   pub := false;
   num := '';
   while not QryAux.eof do begin
    if QryAux['PUBLICADA'] = 'S' then begin
     pub := true;
     num := inttostr(QryAux['IDSIMULACAO']);
    end;
    elemento := elemento + inttostr(QryAux['IDSIMULACAO'])+', ';
    QryAux.next;
   end;
   elemento := copy(elemento,1,length(elemento) - 2)+'.';
   showmessage('Este grupo de hipóteses é usado na(s) simulação(ões) de número : '+elemento);
   if  pub then
    showmessage('Este grupo de hipóteses não pode ser alterado, pois o grupo de hipóteses é usado'+ #10+#13+ 'pela simulação PUBLICADA de número : '+num);
 end;
 if pub then
  SePublicada := True
 else
  SePublicada := false;
end;

//-------------------------------------------------------------------
// Botao de Excluir
procedure TFrmGrupoHipotese.BtExclClick(Sender: TObject);
Var
  wNumLinha:Integer;
begin
  inherited;

 if not SePublicada then begin
// Executa query de Detalhe
  With QryDetalhe Do Begin
// Se Nao Houverem Registros de Detalhe, Sai
    If QryDetalhe.RecordCount=0 then begin
      Exit;
    End;
// Se Confirmar, Exclui Registro Posicionado
    If MessageBox(0,'Confirma ?','Mensagem do Sistema ',1) = IdOk Then Begin
// Exclui Campos Campos - Referencia da Hipotese
      FazQuery(QryAux,'SELECT NUMLINHA FROM '+sistema.PrefixoServidor+'VALTABGENER '+
        'WHERE CODTABELA = ''TABHIPOTESES'' AND '+
        'CODCAMPO = ''IDHIPOTESE'' AND '+
        'VALOR = '+QryDetalhe.FieldByName('IDHIPOTESE').AsString);
// Numero da Linha
      wNumLinha:=(QryAux.FieldByName('NUMLINHA').AsInteger);
// Descricao
      ExecutarQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'VALTABGENER '+
        'WHERE CODTABELA = ''TABHIPOTESES'' AND '+
        'NUMLINHA  = '+IntToStr(wNumLinha));
      Delete;
      Close;
      Open;
    End
  End;
 end
 else
 exit;

end;
//-------------------------------------------------
// Incluir Detalhe
procedure TFrmGrupoHipotese.BtInsClick(Sender: TObject);
Var
  wNumLinha:String;
begin
  inherited;

  if not SePublicada then begin
   // Abaixa Botao
   BtIns.Down    :=True;
   // Inabilita Botoes de Detalhe
   BtAlt.Enabled :=False;
   BtProc.Enabled:=False;
   BtExcl.Enabled:=False;
   // Esconde Grid Mostra Painel
   DbGrdDet.Visible  :=False;
   PnlDetalhe.Visible:=True;
   DbEdit4.SetFocus;
   // Inclui Novo Registro
   QryDetalhe.Append;
  end
  else begin
   BtIns.Down    := false;  
   exit;
  end;
end;

procedure TFrmGrupoHipotese.btAltClick(Sender: TObject);
begin
  inherited;

 if not SePublicada then begin
// Se Nao Houverem Registros de Detalhe, Sai
  If QryDetalhe.RecordCount=0 then begin
    BtAlt.Down    :=False;
    Exit;
  End;
// Abaixa Botao
  BtAlt.Down    :=True;
// Inabilita Botoes de Detalhe
  BtIns.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
// Esconde Grid Mostra Painel
  DbGrdDet.Visible  :=False;
  PnlDetalhe.Visible:=True;
  DbEdit4.SetFocus;
// Alterar Registro
  QryDetalhe.Edit;
 end
 else begin
  BtAlt.Down    :=False;
  exit;
 end; 
end;

procedure TFrmGrupoHipotese.BtProcClick(Sender: TObject);
begin
  inherited;
// Muda Base de Dados e Executa Componente de Pesquisa
  SelDlgProcuraQry.DataSet:=QryDetalhe;
  SelDlgProcuraQry.Execute;
// Volta Base de Dados Anterior 
  SelDlgProcuraQry.DataSet:=QryPrincipal;
end;
//----------------------------------------------
// Incluir Grupo
procedure TFrmGrupoHipotese.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
// Inabilita Botoes de Detalhe
  BtIns.Enabled :=False;
  BtAlt.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
end;

//----------------------------------------------
// Confirma  a Inclusao do Grupo
procedure TFrmGrupoHipotese.bbtnConfirmarClick(Sender: TObject);
Var
  wIdReg:Integer;
begin
  inherited;
  DbEdit1.SetFocus;
// Abilita Botoes de Detalhe
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
// Cancela
  bbtnCancelar.Click;
end;

//----------------------------------------------
// Cancela Inclusao do Grupo
procedure TFrmGrupoHipotese.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Habilita Botoes de Detalhe
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
end;

procedure TFrmGrupoHipotese.DbGrdDetDblClick(Sender: TObject);
begin
  inherited;
// Se Nao Houverem Registros de Detalhe, Sai
  If QryDetalhe.RecordCount=0 then begin
    BtAlt.Down    :=False;
    Exit;
  End;
// Abaixa Botao
  BtAlt.Down    :=True;
// Inabilita Botoes de Detalhe
  BtIns.Enabled :=False;
  BtProc.Enabled:=False;
  BtExcl.Enabled:=False;
// Esconde Grid Mostra Painel
  DbGrdDet.Visible  :=False;
  PnlDetalhe.Visible:=True;
  DbEdit2.SetFocus;
// Inclui Novo Registro
  QryDetalhe.Edit;

end;

procedure TFrmGrupoHipotese.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
// Seta Focus na Descricao
  DbEdit1.SetFocus;
end;

procedure TFrmGrupoHipotese.DBEdit5KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
// Se Key = , vira .
  If Key = '.' Then Key := ',';
end;

//------------------------------------------------------
// Troca Virgulas por Ponto
Function TFrmGrupoHipotese.TrocaVirgulaPonto(Value: String): String;
var
  i : Integer;
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+'.'+copy(Value,iPosVirg+1,length(Value));
  Result:=Value;
//  TrocaVirgulaPonto := Value;
end;

procedure TFrmGrupoHipotese.SairClick(Sender: TObject);
begin
  inherited BbtnSairClick(Sender);
end;

end.
