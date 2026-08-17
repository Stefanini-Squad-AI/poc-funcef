//------------------------------------------------------------------
// Sistema   .: Sistema de Cálculos Atuariais
// Objetivo  .: Formulário de Visualização de Tabelas Biométricas
//              Form - FrmGrupoBiometrica  /  Unit - UGrupoBiometrica
// Data      .: 18/12/1998
// Autor     .: Andre Gomes (baseado no Form FrmGrupoHipoteses)
// Obs       .: Falta definir se a tabela de valores poderá ser ou
//              não alterada.
//------------------------------------------------------------------
unit UGrupobiometrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  DBCtrls, Mask, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, ExtCtrls,
  DBTables, Wwquery, TB97Ctls, TB97Tlbr, ZipDir, ZipMstr, IvDictio,
  IvMulti, IvEMulti;

type
  TFrmGrupoBiometrica = class(TfrmCadastro)
    DBEdit1: TDBEdit;
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
    Label3: TLabel;
    Label4: TLabel;
    QryPrincipal: TwwQuery;
    QryAux: TwwQuery;
    QryDetalhe: TwwQuery;
    DsDet: TwwDataSource;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DsAuxiliar: TwwDataSource;
    QryAuxiliar: TwwQuery;
    QryPrincipalIDTABELA: TFloatField;
    QryPrincipalDESCRICAO: TStringField;
    QryDetalheIDTABELA: TFloatField;
    QryDetalheIDADE: TFloatField;
    QryDetalheV1: TFloatField;
    QryDetalheV2: TFloatField;
    QryDetalheV3: TFloatField;
    QryDetalheV4: TFloatField;
    QryDetalheV5: TFloatField;
    QryDetalheV6: TFloatField;
    QryDetalheV7: TFloatField;
    QryDetalheV8: TFloatField;
    QryDetalheV9: TFloatField;
    QryDetalheV10: TFloatField;
    QryDetalheV11: TFloatField;
    QryDetalheV12: TFloatField;
    QryDetalheV13: TFloatField;
    QryDetalheV14: TFloatField;
    QryDetalheV15: TFloatField;
    QryDetalheV16: TFloatField;
    QryDetalheV17: TFloatField;
    QryDetalheV18: TFloatField;
    QryDetalheV19: TFloatField;
    QryDetalheV20: TFloatField;
    QryDetalheV21: TFloatField;
    QryDetalheV22: TFloatField;
    QryDetalheV23: TFloatField;
    QryDetalheV24: TFloatField;
    QryDetalheV25: TFloatField;
    QryDetalheV26: TFloatField;
    QryDetalheV27: TFloatField;
    QryDetalheV28: TFloatField;
    QryDetalheV29: TFloatField;
    QryDetalheV30: TFloatField;
    QryDetalheV31: TFloatField;
    QryDetalheV32: TFloatField;
    QryDetalheV33: TFloatField;
    QryDetalheV34: TFloatField;
    QryDetalheV35: TFloatField;
    QryDetalheV36: TFloatField;
    QryDetalheV37: TFloatField;
    QryDetalheV38: TFloatField;
    QryDetalheV39: TFloatField;
    QryDetalheV40: TFloatField;
    QryDetalheV41: TFloatField;
    QryDetalheV42: TFloatField;
    QryDetalheV43: TFloatField;
    QryDetalheV44: TFloatField;
    QryDetalheV45: TFloatField;
    QryDetalheV46: TFloatField;
    QryDetalheV47: TFloatField;
    QryDetalheV48: TFloatField;
    QryDetalheV49: TFloatField;
    QryDetalheV50: TFloatField;
    QryDetalheV51: TFloatField;
    QryDetalheV52: TFloatField;
    QryDetalheV53: TFloatField;
    QryDetalheV54: TFloatField;
    QryDetalheV55: TFloatField;
    QryDetalheV56: TFloatField;
    QryDetalheV57: TFloatField;
    QryDetalheV58: TFloatField;
    QryDetalheV59: TFloatField;
    QryDetalheV60: TFloatField;
    QueryCampo: TwwQuery;
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
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  function SePublicada: boolean;
  end;

var
  FrmGrupoBiometrica: TFrmGrupoBiometrica;

implementation

uses UDataBase,UBibliotecaAtuarial,Usistema;

{$R *.DFM}

procedure TFrmGrupoBiometrica.FormShow(Sender: TObject);
var
 k : integer;
begin
  inherited;
// Abre As Querys
  QryPrincipal.Open;
// Mostra Grid
  PnlDetalhe.Visible:=False;
  DbGrdDet.Visible:=True;

  QryDetalhe.Open;

  QueryCampo.open;

  with DbGrdDet do
  begin
   for k := 1 to QueryCampo.FieldCount - 1 do begin
    DataSource.DataSet.fieldByName('V'+inttostr(k)).DisplayLabel := QueryCampo.fields[k].AsString;
    DataSource.DataSet.FieldByName('V'+inttostr(k)).DisplayWidth := 12;
    if QueryCampo.fields[k].AsString = '' then break;
   end;
  end;

  QueryCampo.close;

end;

procedure TFrmGrupoBiometrica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha As Querys
  QryPrincipal.Close;
  QryDetalhe.Close;
end;

procedure TFrmGrupoBiometrica.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
end;

procedure TFrmGrupoBiometrica.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
end;

procedure TFrmGrupoBiometrica.bbtnOkDetClick(Sender: TObject);
Var
  wNumLinha:Integer;
begin
  inherited;
end;

procedure TFrmGrupoBiometrica.bbtnCancelarDetClick(Sender: TObject);
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

procedure TFrmGrupoBiometrica.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
end;
//-------------------------------------------------------------------
// Botao de Excluir
procedure TFrmGrupoBiometrica.BtExclClick(Sender: TObject);
Var
  wNumLinha:Integer;
begin
  inherited;
end;
//-------------------------------------------------
// Incluir Detalhe
procedure TFrmGrupoBiometrica.BtInsClick(Sender: TObject);
Var
  wNumLinha:String;
begin
  inherited;
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
//  QryDetalhe.Append;

end;

procedure TFrmGrupoBiometrica.btAltClick(Sender: TObject);
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
  DbEdit4.SetFocus;
// Alterar Registro
  QryDetalhe.Edit;
end;

procedure TFrmGrupoBiometrica.BtProcClick(Sender: TObject);
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
procedure TFrmGrupoBiometrica.sbtnInserirClick(Sender: TObject);
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
procedure TFrmGrupoBiometrica.bbtnConfirmarClick(Sender: TObject);
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
//  wIdReg:=Qryprincipal.FieldByName('IDGRUPOHIPOTESE').AsInteger;
// Cancela
  bbtnCancelar.Click;
//  Qryprincipal.Locate('IDGRUPOHIPOTESE',wIdReg,[]);
end;

//----------------------------------------------
// Cancela Inclusao do Grupo
procedure TFrmGrupoBiometrica.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Abilita Botoes de Detalhe
  BtIns.Enabled :=True;
  BtAlt.Enabled :=True;
  BtProc.Enabled:=True;
  BtExcl.Enabled:=True;
end;

procedure TFrmGrupoBiometrica.DbGrdDetDblClick(Sender: TObject);
begin
  inherited;
end;

procedure TFrmGrupoBiometrica.sbtnAlterarClick(Sender: TObject);
begin
  if SePublicada then begin
   sbtnAlterar.Down := false;
   exit;
  end;
  inherited;
// Seta Focus na Descricao
  DbEdit1.SetFocus;
end;

procedure TFrmGrupoBiometrica.DBEdit5KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
// Se Key = , vira .
  If Key = '.' Then Key := ',';
end;


//------------------------------------------------------
// Troca Virgulas por Ponto
Function TFrmGrupoBiometrica.TrocaVirgulaPonto(Value: String): String;
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

procedure TFrmGrupoBiometrica.SairClick(Sender: TObject);
begin
  inherited BbtnSairClick(Sender);
end;

procedure TFrmGrupoBiometrica.sbtnProcurarClick(Sender: TObject);
var
 k : integer;
begin
  inherited;
  QueryCampo.open;
  DbGrdDet.CleanupInstance;
  with DbGrdDet do
  begin
   for k := 1 to QueryCampo.FieldCount - 1 do begin
    DataSource.DataSet.fieldByName('V'+inttostr(k)).DisplayLabel := QueryCampo.fields[k].AsString;
    DataSource.DataSet.FieldByName('V'+inttostr(k)).DisplayWidth := 12;
    if (QueryCampo.fields[k].AsString = '') then
     DataSource.DataSet.fieldByName('V'+inttostr(k)).DisplayLabel := 'V'+inttostr(k);
   end;
  end;

  QueryCampo.close;


end;

procedure TFrmGrupoBiometrica.sbtnApagarClick(Sender: TObject);
begin
  if SePublicada then begin
   sbtnApagar.Down := false;
   exit;
  end;
    
  If MessageBox(0,'Confirma ?','Mensagem do Sistema ',1) = IdOk Then Begin
     with QryPrincipal do begin
        if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'VALTABBIO '+
             'WHERE IDTABELA  = '+IntToStr(qryprincipal['IDTABELA'])) then begin
              showmessage('Problema na exclusão da tabela biométrica '+#10+#13+
                          'Erro na Tabela de Dados.');
              exit;
       end;

      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'CAMPOTABBIO '+
             'WHERE IDTABELA  = '+IntToStr(qryprincipal['IDTABELA'])) then begin
              showmessage('Problema na exclusão da tabela biométrica '+#10+#13+
                          'Erro na Tabela de Campos.');
              exit;
       end;

      if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TABBIO '+
             'WHERE IDTABELA  = '+IntToStr(qryprincipal['IDTABELA'])) then begin
              showmessage('Problema na exclusão da tabela biométrica '+#10+#13+
                          'Erro na Tabela Principal.');
              exit;
       end;
       sbtnApagar.Down := false;
       showmessage('Tabela Biométrica excluída');
       close;
       open;
     end;
  end;


end;


//-------------------------------------------------------------------
// Teste para ver se as regras são usadas em
// Simulações, e se existe alguma publicada
function TFrmGrupoBiometrica.SePublicada: boolean;
var
 num,elemento,pesquisa : string;
 pub : boolean;
begin
 pub := false;
 pesquisa := 'SELECT A.IDSIMULACAO,A.IDTABELA,A.PUBLICADA FROM '+
             sistema.PrefixoServidor+'SIMULACOES A, '+
             sistema.PrefixoServidor+'TABBIO B '+
             'WHERE B.IDTABELA  = '+IntToStr(qryprincipal['IDTABELA'])+' AND '+
             'A.IDTABELA = B.IDTABELA';
 UBibliotecaAtuarial.FazQuery(QryAux,pesquisa);
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
   showmessage('Esta tabela é usada na simulação de número : '+elemento);
   if pub then
    showmessage('Este registro não pode ser excluído, pois a regra é usada'+ #10+#13+ 'pela simulação PUBLICADA de número : '+num);
 end;
 if pub then
  SePublicada := True
 else
  SePublicada := false;
end;


end.
