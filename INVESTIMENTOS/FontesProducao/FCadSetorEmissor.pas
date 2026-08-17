//*****************************************************************************
//Autor     : Marco Turon
//Data	    : 16/01/2006
//Código    : Al_1
//Pendencia : 21259
//SOL       : 39829
//Motivo(S) : Retirada do botão Procura, herança de form em desuso, não funciona
//                  ESTE FORM DEVE SER REFEITO NO NOVO PADRÃO FCADASTROCS
//*****************************************************************************
unit FCadSetorEmissor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, DBTables, Wwquery,
  CMTree, Mask, wwdblook, wwdbedit, TB97, TB97Ctls, TB97Tlbr, MontaSelect,
  IvDictio, IvMulti, IvEMulti, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadSetorEmissor = class(TfrmCadastro)
    Panel1: TPanel;
    Label1: TLabel;
    qrySetorEmissor: TwwQuery;
    pnlEdicao: TPanel;
    pnAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    treeSetorEmissor: TCMTreeView;
    QryAux: TwwQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbedCod: TwwDBEdit;
    Label3: TLabel;
    dbedDescricao: TDBEdit;
    qrySetorEmissorCODSETOREMISSOR: TStringField;
    qrySetorEmissorDESCSETOREMISSOR: TStringField;
    qrySetorEmissorSETORANALIT: TStringField;
    MontaSelect1: TMontaSelect;

    procedure FormCreate(Sender: TObject);
    procedure dbedCodExit(Sender: TObject);
    procedure qrySetorEmissorAfterScroll(DataSet: TDataSet);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure treeSetorEmissorChange(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure treeSetorEmissorDblClick(Sender: TObject);
    procedure qrySetorEmissorAfterDelete(DataSet: TDataSet);
    procedure dbedCodKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    sSql        : String;
    sMascaraSE  : String;
    sMascPict   : String;
    iSoma       : Integer;
    ind         : Integer;
    lNivel      : Array [0..20] of Integer;
    bMontandoArvore : Boolean;
  public
    { Public declarations }
    Function VerificaMascara(sMascara : String; var sMascPict : String;
                         var lNivel  : Array  of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
    Function CalcGrau(sNoAnterior : String;lNivel : Array of Integer;
                   ind : Integer;var sPai : String) : Integer;
  end;

var
  frmCadSetorEmissor: TfrmCadSetorEmissor;

implementation

uses USistema,UMensErro, UAutorizacao, UBibliotecaInvest;

{$R *.DFM}

procedure TfrmCadSetorEmissor.FormCreate(Sender: TObject);
begin
  Try
    bMontandoArvore := False;
    with QryAux do begin
      Close;
      SQL.Clear;
      SQL.Add('Select PI.IDPARAMiNVEST,PI.MASCSETOREMISSOR from PARAMINVEST PI');
      Open;
      sMascaraSE := FieldByName('MASCSETOREMISSOR').AsString;
    end;
    sMascPict := '';
    if not VerificaMascara(sMascaraSE,sMascPict,lNivel,iSoma,ind) then begin
      MessageBeep(0);
      ShowMessage('Máscara Inválida');
      close;
      exit;
    end;
    with QrySetorEmissor do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT SE.CODSETOREMISSOR, SE.DESCSETOREMISSOR, SE.SETORANALIT '+
              ' FROM '+ Sistema.PrefixoServidor+'SETOREMISSOR SE ');
      Open;
    end;
// Eranca
    inherited;
// Monta Arvore
    TreeSetorEmissor.Mascara	:= sMascaraSE;
    bMontandoArvore 		:= True;
    TreeSetorEmissor.MontaArvore;
    bMontandoArvore 		:= False;
    QrySetorEmissor.FieldByName('CODSETOREMISSOR').EditMask := sMascaraSE + ';0; ';
    pnlEdicao.Enabled     	:= False;
  Except
// Mostra Erro
    On E: Exception Do Begin
      ShowMessage('Houve um erro na abertura do formulário, '+#13+
                  #13+'Com a Mensagem, '+#13+
                  #13+E.Message+#13);
    End;
  End;
end;

procedure TfrmCadSetorEmissor.CmeCadastroFind(Sender: TObject);
begin
{  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    begin
      qry.Locate('CodSetorEmissor', MontaSelect.ValoresChave[0],[loPartialKey]);
    end;
}
//
  inherited;
end;


procedure TfrmCadSetorEmissor.CmeCadastroInsert(Sender: TObject);
begin
 ds.DataSet.Insert;
 treeSetorEmissor.Enabled:= False;
 pnlEdicao.Enabled := True;
 dbedCod.Enabled := True;
 dbedCod.SetFocus;
end;

procedure TfrmCadSetorEmissor.CmeCadastroCancel(Sender: TObject);
begin
   { Cancela a gravação o registro }
 Try
  treeSetorEmissor.Enabled:= True;
  pnlEdicao.Enabled := false;
  if ds.dataset.state  in [dsInsert, dsEdit] then
   ds.DataSet.Cancel;
 Except Raise;
 end;
end;

function TfrmCadSetorEmissor.VerificaMascara(sMascara : String; var sMascPict : String;
                         var lNivel  : Array  of Integer;
                         var iSoma : Integer;var ind : Integer) : Boolean;
var
 i         : Integer;
// Retirada de warnings
// iColch    : Integer;
begin
 Result    := true;
 lNivel[0] := 1;
 iSoma     := 0;
// iColch    := 0;
 sMascPict := copy(sMascara,1,1);
 for i := 1 to Length(sMascara) do
  begin
   if i > 1
    then sMascPict := sMascPict + copy(sMascara,i,1);
   if copy(sMascara,i,1) ='.' then
    begin
     ind := ind + 1;
     lnivel[ind] := i - ind - iSoma;
     iSoma := iSoma + lNivel[ind];
     { sMascPict := sMascPict + '['; }
//     Inc(iColch);
    end;
  end;
 if (ind = 0) and (length(sMascara) > 0) then
  begin
   lnivel[1] := length(sMascara);
   ind := 1;
  end;
 if ind = 0 then
  Result := false;
 lNivel[ind+1] := Length(sMascara) - ind - iSoma;
{  for i := 1 to iColch do
      sMascPict := sMascPict + ']';}
end;

function  TfrmCadSetorEmissor.CalcGrau(sNoAnterior: String; lNivel: Array of Integer;
                   ind: Integer; var sPai: String) : Integer;
var
 i    : Integer;
 iAux : Integer;
 sAux : String;
 lAux : Boolean;

begin
 iAux   := 0;
 Result := 0;
 sAux   := '';
 lAux   := false;
 for i:= 1 to ind+1 do
  begin
   inc(Result);
   iAux:=iAux+lNivel[i];
   if length(sNoAnterior)=iAux then
    begin
     lAux:=True;
     sPai := Copy(sNoAnterior,1,iAux-lNivel[i]);
     break;
    end;
  end;
 if not lAux then
  Result:=0;
end;

procedure TfrmCadSetorEmissor.dbedCodExit(Sender: TObject);
var
 iGrau    : Integer;
 lSair    : Boolean;
// Retirada de warnings
// lEnabled : Boolean;
 sPai     : String;
begin
 try
  inherited;
  sPai                 := '';
//  lEnabled             := True;
  lSair                := False;
  iGrau                := 0;
  if Trim((dbedCod.Text)) <> '' then begin
    iGrau:=CalcGrau(Trim(dbedCod.Text),lNivel,ind,sPai);
    if iGrau=0 then begin
      MessageBeep(0);
      ShowMessage('Máscara Inválida');
      lSair := true;
    end;
  end;
  if not lSair then begin
// Verifica se já está cadastrado
    qryAux.Close;
    qryAux.SQL.Clear;
    sSQL := 'SELECT SE.CODSETOREMISSOR FROM SETOREMISSOR SE WHERE SE.CODSETOREMISSOR = '''+
            TRIM(dbEdCod.Text)+ ''' ORDER BY SE.CODSETOREMISSOR';
    qryAux.SQL.Add(sSQL);
    qryAux.Open;
    if not qryAux.IsEmpty then begin
      MsgDlg('Setor de Emissor já cadastrado',LerMensagem(2),mtError,[mbOk],0);
      lSair := true;
    end;
    qryAux.Close;
  end;
  if (not lSair) and (iGrau > 1)  then begin
// Verifica se conta pai é sintética
    qryAux.SQL.Clear;
    sSql := 'SELECT SE.CODSETOREMISSOR,SE.SETORANALIT FROM SETOREMISSOR SE WHERE '+
            'SE.CODSETOREMISSOR = '''+trim(sPai)+''' ORDER BY SE.CODSETOREMISSOR' ;
    qryAux.SQL.Add(sSQL);
    qryAux.Open;
    if qryAux.IsEmpty then begin // não tem pai
      MsgDlg('Não existe Setor de Emissor relacionado',LerMensagem(2),mtError,[mbOk],0);
      lSair := true;
    end else begin
//R          if qryAux.FieldByName('SETORANALIT').AsString = 'A'
//R           then begin // pai é analítico
//R              MsgDlg('Centro de Custo Pai é analítico',LerMensagem(2),mtError,[mbOk],0);
//R              lSair := true;
//R           end;
    end;
    qryAux.Close;
  end;
  if lSair then begin
    dbEdCod.Text := '';
    dbEdCod.EditText := '';
    qrySetorEmissor.FieldValues['CODSETOREMISSOR'] := '';
    dbedCod.SetFocus;
    exit;
  end;
  if ((iGrau = 1) and (ind+1 >1))then begin
    sbtnSintetico.Down  := True;
    qrySetorEmissor.FieldByName('SETORANALIT').AsString := 'S';
//    lEnabled := false;
  end
//R
  else begin
    sbtnAnalitico.Down  := True;
    qrySetorEmissor.FieldByName('SETORANALIT').AsString := 'A';
//    lEnabled := false;
  end;
//R
  if iGrau = ind+1 then begin
    sbtnAnalitico.Down  := True;
    qrySetorEmissor.FieldByName('SETORANALIT').AsString := 'A';
//    lEnabled := false;
  end;
//  pnAnaSint.Enabled := lEnabled;
 except
  Raise;
 end;
end;

procedure TfrmCadSetorEmissor.CmeCadastroEdit(Sender: TObject);
begin
 if ds.DataSet.IsEmpty then
  MsgDlg(LerMensagem(10),LerMensagem(2),mtError,[mbOk, mbHelp], 0)
 else
  begin
   ds.DataSet.Edit;
   pnlEdicao.Enabled := True;
   dbedCod.Enabled := False;
   dbedDescricao.SetFocus;
  end;
end;

procedure TfrmCadSetorEmissor.qrySetorEmissorAfterScroll(DataSet: TDataSet);
begin
 inherited;
 if not bMontandoArvore then
  begin
   if qrySetorEmissor.FieldByName('SETORANALIT').AsString = 'A' then
    sbtnAnalitico.Down := True
   else
    if qrySetorEmissor.FieldByName('SETORANALIT').AsString = 'S' then
     sbtnSintetico.Down := True;
  end;
end;

procedure TfrmCadSetorEmissor.CmeCadastroConfirma(Sender: TObject);
var
 EstadoAntes,EstadoQry: TDatasetState;
begin
  //treeDesemb.Enabled:= True;
 EstadoQry := qrySetorEmissor.State;

 if sbtnAnalitico.Down then
  qrySetorEmissor.FieldByName('SETORANALIT').AsString := 'A'
 else
  qrySetorEmissor.FieldByName('SETORANALIT').AsString := 'S';

 if Trim(dbedDescricao.Text) = '' then begin
   MsgDlg('Descrição não preenchida',LerMensagem(2),mtError,[mbOk],0);
   dbedDescricao.SetFocus;
   Exit;
 end;

{ Grava o registro }
 if ds.DataSet.State in [dsInsert, dsEdit] then begin
   EstadoAntes := ds.State;
   ds.DataSet.Post;
// Reabre a Query para atualizar os dados na tela, se for o caso
   if ds.DataSet is TQuery then begin
     if EstadoAntes = dsInsert then begin
       FazendoCloseOpen := True;
       CmeCadastro.CloseDataSet(Self);
       CmeCadastro.OpenDataSet(Self);
       FazendoCloseOpen := False;
          //ds.DataSet.Locate(,,)
     end;
   end;
 end;

 if EstadoQry = dsEdit then pnlEdicao.Enabled := false;

 qrySetorEmissor.Close;
 qrySetorEmissor.Open;
end;

procedure TfrmCadSetorEmissor.sbtnAnaliticoClick(Sender: TObject);
begin
	inherited;
   if not(qrySetorEmissor.State=dsEdit) then
   	qrySetorEmissor.Edit;

	qrySetorEmissor.FieldByName('SETORANALIT').AsString := 'A';
end;

procedure TfrmCadSetorEmissor.sbtnSinteticoClick(Sender: TObject);
begin
	inherited;
   if not(qrySetorEmissor.State=dsEdit) then
   	qrySetorEmissor.Edit;

	qrySetorEmissor.FieldByName('SETORANALIT').AsString := 'S';
end;

procedure TfrmCadSetorEmissor.treeSetorEmissorChange(Sender: TObject);
begin
	inherited;
	if qrySetorEmissor.FieldByName('SETORANALIT').AsString = 'A' then
		sbtnAnalitico.Down := True
	else
	if qrySetorEmissor.FieldByName('SETORANALIT').AsString = 'S' then
   	sbtnSintetico.Down := True;
 	with QryAux do
   begin
   	Close;
 		SQL.Clear;
 		SQL.Add('Select SE.CODSETOREMISSOR , SE.DESCSETOREMISSOR , SE.SETORANALIT From SETOREMISSOR SE Where SE.CODSETOREMISSOR Like '''+ qrySetorEmissor.FieldByName('CodSetorEmissor').AsString + '%''');
 		Open;
   end;
end;

procedure TfrmCadSetorEmissor.CmeCadastroDelete(Sender: TObject);
var
 PodeExcluir : Boolean ;
begin
 PodeExcluir := True ;
 Try  { Testa se há pastas analíticas dentro de uma pasta sintética }
  QryAux.SQL.Clear;
  QryAux.Close;
  QryAux.SQL.Add('Select SE.CODSETOREMISSOR , SE.DESCSETOREMISSOR , SE.SETORANALIT From SETOREMISSOR SE Where SE.CODSETOREMISSOR Like '''+
    QrySetorEmissor.FieldByName('CodSetorEmissor').AsString + '%''');
  QryAux.Open;
  if QryAux.RecordCount > 1 Then  { Força a deleção das pastas analíticas uma a uma }
   begin
    PodeExcluir := False ;
    MsgDlg('Pasta(s) Analítica(s) terão que ser apagada(s) primeiro!',LerMensagem(2),mtError,[mbOK],0);
   end
  else { Testa se a tabela está vazia }
   if ds.DataSet.IsEmpty then
    begin
     MsgDlg(LerMensagem(10),LerMensagem(2),mtError,[mbOk, mbHelp], 0);
     PodeExcluir := False;
    end
   else { verifica se existe emissor para o setor ou filho}
    begin
     QryAux.SQL.Clear;
     QryAux.Close;
     QryAux.SQL.Add('SELECT EM.IDEMISSOR, ES.CODSETOREMISSOR ');
     QryAux.SQL.Add('FROM EMISSOR EM, SETOREMISSOR ES ');
     QryAux.SQL.Add('WHERE EM.IDSETOREMISSOR = ES.CODSETOREMISSOR AND ');
     QryAux.SQL.Add('      ES.CODSETOREMISSOR LIKE '''+
                    QrySetorEmissor.FieldByName('CODSETOREMISSOR').AsString + '%''');
     QryAux.Open;
     If QryAux.RecordCount > 1 Then  { Força a deleção das pastas analíticas uma a uma }
      begin
       PodeExcluir := False ;
       MsgDlg('Setor já utilizado por Emissor, Não pode  ser apagado!',LerMensagem(2),mtError,[mbOK],0);
      end;
    end;
   if PodeExcluir then
    inherited;
 Except Raise;
 sbtnApagar.Down := False;
 end;
end;

procedure TfrmCadSetorEmissor.sbtnApagarClick(Sender: TObject);
begin
// Try
  inherited;
// Except
//  MsgDlg('O Setor possui Filho(s)','Atenção',mtWarning,[mbok],0);
//  Raise;
// end;
end;

procedure TfrmCadSetorEmissor.treeSetorEmissorDblClick(Sender: TObject);
var
 posicao : string;
 // Retirada de warnings
// Return	:Boolean;

begin
   inherited;
   posicao	:= TreeSetorEmissor.ValorChave;
   qrySetorEmissor.Locate('CodSetorEmissor', posicao, []);
end;

procedure TfrmCadSetorEmissor.qrySetorEmissorAfterDelete(
  DataSet: TDataSet);
begin
 inherited;
 TreeSetorEmissor.MontaArvore;
end;

procedure TfrmCadSetorEmissor.dbedCodKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if (key in ['1'..'9']) or
    (key in ['0']) or
    (key = char(8))
 then
  exit
 else
  key := #0;
end;

procedure TfrmCadSetorEmissor.sbtnInserirClick(Sender: TObject);
begin
// Caso Ramo seja Analitico não pode ter Filho
  If sbtnAnalitico.Down=True Then Begin
//    ShowMessage('Setor Analitico, não pode ter filhos .');
//    sbtnInserir.Down:=False;
//    Exit;
  End;
// Heranca
  inherited;
  treeSetorEmissor.Enabled:=False;
end;

procedure TfrmCadSetorEmissor.bbtnConfirmarClick(Sender: TObject);
begin
// Critica Campos
  If (dbedCod.Text='') And (dbedDescricao.Text='') Then Begin
    ShowMessage('Faltam Preencher Campos ...');
    Exit;
  End;

// Caso Ramo sintetico com Filhos não pode ser Analitico
  If (sbtnAlterar.Down=True) And (sbtnAnalitico.Down=True) And
     (TreeSetorEmissor.Selected.HasChildren) Then Begin
    ShowMessage('Setor possui Filhos, não pode ser Analítico.');
    Exit;
  End;

// Caso Ramo sintetico com Filhos não pode ser Analitico
  If (sbtnInserir.Down=True) And (sbtnAnalitico.Down=True) Then Begin
//    ShowMessage('Setor Analitico .');
//    Exit;
  End;
// Heranca
  inherited;
  treeSetorEmissor.Enabled:=True;

end;

procedure TfrmCadSetorEmissor.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  treeSetorEmissor.Enabled:=False;
end;

procedure TfrmCadSetorEmissor.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  treeSetorEmissor.Enabled:=True;
end;

end.
