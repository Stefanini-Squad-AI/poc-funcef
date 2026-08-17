//------------------------------------------------------------------
// Sistema   .: Sistema de Cálculos Atuariais
// Objetivo  .: Formulário de Execução de Simulações
//              Form - FrmCalculo /  Unit - UCalculo
// Data      .: 16/07/1998
// Autor     .: Alexandre Ramos
//------------------------------------------------------------------
Unit UCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, wwdblook, Db,
  DBTables, Wwquery, Wwdatsrc, DBCtrls, {Mast, }cmseldlg,FileCtrl,
  FCadastro, wwidlg, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, TB97Ctls,
  TB97Tlbr, DBGrids,
  ppProd, ppClass, ppReport, ppComm, ppCache, ppDB, ppTxPipe, ppBands,
  ppPrnabl, ppCtrls, IvDictio, IvMulti, IvEMulti, ppEndUsr, ppDBBDE,uMensErro,
  URegra, wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro,
  wwDialog, ImgList;

type
  Estrutura = record
              tamanho : integer;
              tipo    : string;
              end;
  VetEst = array[1..60] of estrutura ; // para estrutura do txt - sch

  TFrmCalculo = class(TfrmCadastro)
    DsHipoteses: TwwDataSource;
    QryHipoteses: TwwQuery;
    DsFiltros: TwwDataSource;
    QryFiltros: TwwQuery;
    DsRegras: TwwDataSource;
    QryRegras: TwwQuery;
    LC1: TwwDBLookupCombo;
    LC2: TwwDBLookupCombo;
    LC3: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QrySimulacoes: TwwQuery;
    QryAuxiliar: TwwQuery;
    QryHipotesesDESCRICAO: TStringField;
    QryHipotesesIDGRUPOHIPOTESE: TFloatField;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    SB1: TSpeedButton;
    LC4: TwwDBLookupCombo;
    Label7: TLabel;
    QryTabBio: TwwQuery;
    DsTabBio: TwwDataSource;
    SB2: TSpeedButton;
    Panel2: TPanel;
    Label8: TLabel;
    PrgBar1: TProgressBar;
    DsSimulacao: TwwDataSource;
    QrySimulacao: TwwQuery;
    DateEdit1: TCMDateTimePicker;
    QryTabBioIDTABELA: TFloatField;
    QryTabBioDESCRICAO: TStringField;
    SB3: TSpeedButton;
    SalvarArq: TSaveDialog;
    Sb4: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure LC1NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure LC2NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure LC3NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure SB1Click(Sender: TObject);
    procedure QrySimulacoesBeforePost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure QrySimulacoesAfterScroll(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure LC4NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure SB2Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure SB3Click(Sender: TObject);
    procedure Sb4Click(Sender: TObject);
    procedure Regra1GetResult(sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CriaEstrutura(var Vetor:VetEst;nome,caminho,descricao:string) : boolean;
    function TrataSaida(Texto,tipo:string;tamanho:integer) : string;
  end;


var
  FrmCalculo: TFrmCalculo;wPos:Integer;OutPutFile:TextFile;
  DiretorioTXT,NomeTabTXT,PathArquivo : string;
  VetorCampo  : VetEst;

implementation

// Units Utilizadas
Uses UDataBase,UBibliotecaAtuarial, USistema, URelatoriosAtuariais;

{$R *.DFM}

procedure TFrmCalculo.FormShow(Sender: TObject);
begin
  inherited;
// Abre e Executa Querys
  QryHipoteses.Open;
  QryFiltros.Open;
  QryRegras.Open;
  QryTabBio.Open;
// Inabilita Opcoes
  If (QrySimulacoes.FieldByName('PUBLICADA').AsString = 'S') Then begin
    DBEdit1.Enabled:=False;
    DBMemo1.Enabled:=False;
  End;
  LC1.Enabled:=False;
  LC2.Enabled:=False;
  LC3.Enabled:=False;
  LC4.Enabled:=False;
  SB1.Enabled:=False;
  DateEdit1.Enabled:=False;
end;

procedure TFrmCalculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
// Abre e Executa Querys
  QryHipoteses.Close;
  QryFiltros.Close;
  QryRegras.Close;
  QryTabBio.Close;
end;
function TFrmCalculo.TrataSaida(Texto,tipo:string;tamanho:integer) : string;
var
i,j : integer;
textofinal : string;
begin
 if (tipo = 'Float') or (tipo = 'Integer') then begin
  if pos('.',texto) <> 0 then
  texto := TrocaPontoVirgula(Trim(texto));
 end;
 i := length(texto);
 textofinal := texto;
 while i < tamanho do begin
  textofinal := ' '+textofinal;
  inc(i)
 end;
 TrataSaida := textofinal;
end;



//----------------------------------------------
// Botão Ok, Executa o Cálculo e Mostra Resultado
procedure TFrmCalculo.bbtnConfirmarClick(Sender: TObject);
begin
// Caso nao tenha sido Preenchido Campos ..
  If (DbEdit1.Text='') Or
     (DateEdit1.Text='')  Then Begin
    ShowMessage('Faltam Preencher Campos !!!');
    DbEdit1.SetFocus;
    Exit;
  End;
// Caso nao tenha sido selecionado Filtro ..
  If (LC1.Text='') Or
     (LC2.Text='') Or
     (LC3.Text='') Or
     (LC4.Text='')  Then  Begin
    ShowMessage('Faltam Preencher Parâmetros !!!');
    LC1.SetFocus;
    Exit;
  End;
// Caso Alteracao Desabilita Campos
  If SbtnAlterar.Down=True Then Begin
    DateEdit1.Enabled:=False;
    LC1.Enabled      :=False;
    LC2.Enabled      :=False;
    LC3.Enabled      :=False;
    LC4.Enabled      :=False;
    SB1.Enabled      :=False;
    SB2.Enabled      :=True;
  End Else Begin

  End;
// Erança
  Inherited;

// Seta Focus
  DbEdit1.SetFocus;
// Incrementa a Data
  DateEdit1.Date:=Date;
end;

procedure TFrmCalculo.LC1NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  inherited;
  ShowMessage('Hipótese não Encontrada !!!');
  Accept:=False;
end;

procedure TFrmCalculo.LC2NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  inherited;
  ShowMessage('Filtro não Encontrado !!!');
  Accept:=False;
end;

procedure TFrmCalculo.LC3NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  inherited;
// Caso Digitado Nao Esteja na Lista
  ShowMessage('Regra não Encontrada !!!');
  Accept:=False;
end;
//---------------------------------------
// Publica a Simulacao (Nao Permitira Alteracao)
procedure TFrmCalculo.SB1Click(Sender: TObject);
begin
  inherited;
// Publica Simulação
  QrySimulacoes.FieldByName('PUBLICADA').AsString := 'S';
// Indica que foi Publicada
  ShowMessage('Simulação foi Publicada, e não poderá ser Alterada.');
end;

//---------------------------------------------------
// Antes de Incluir na Tabela Simulacoes
procedure TFrmCalculo.QrySimulacoesBeforePost(DataSet: TDataSet);
begin
  inherited;
// Atribui DateEdit ao Campo da Tabela
  QrySimulacoes.FieldByName('DATA').AsDateTime:=DateEdit1.Date;
// Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
    QrySimulacoes.FieldByName('IDSIMULACAO').AsInteger :=
        LeUltRegistro(QryAuxiliar,'SIMULACOES');
end;
//------------------------------------------------
// Incluir Simulações
procedure TFrmCalculo.sbtnInserirClick(Sender: TObject);
begin
  inherited;
// Abilita Campos
  LC1.Enabled:=True;
  LC2.Enabled:=True;
  LC3.Enabled:=True;
  LC4.Enabled:=True;
  SB1.Enabled:=True;
  SB2.Enabled:=False;
  SB3.Enabled:=False;
  DateEdit1.Enabled:=True;
  DBEdit1.Enabled  :=True;
  DBMemo1.Enabled  :=True;
// Seta Focus
  DbEdit1.SetFocus;
// Incrementa a Data
  DateEdit1.Date:=Date;
end;

//------------------------------------------------
// Antes de Mudar de Registro Incrementa Data
procedure TFrmCalculo.QrySimulacoesAfterScroll(DataSet: TDataSet);
Begin
 Inherited;
// Se Incluindo, Sai
 If SbtnInserir.Down=True Then Exit;
// Atribui DateEdit ao Campo da Tabela
 DateEdit1.Date:=QrySimulacoes.FieldByName('DATA').AsDateTime;
// Bloqueia Botao Resultado
 SB3.Enabled:=False;
// Se Simulacao Nao Publicada Abilita Parametros
 If (QrySimulacoes.FieldByName('PUBLICADA').AsString = 'N') Or
       (QrySimulacoes.FieldByName('PUBLICADA').AsString = '') Then begin
   LC1.Enabled:=False;
   LC2.Enabled:=False;
   LC3.Enabled:=False;
   LC4.Enabled:=False;
// Modifca Botão Public ...
   SB1.Enabled:=False;
   SB1.Caption:='Publicar';
   DateEdit1.Enabled:=False;
   DBEdit1.Enabled  :=True;
   DBMemo1.Enabled  :=True;
 End Else Begin
   DbEdit1.Enabled  :=False;
   DbMemo1.Enabled  :=False;
   DateEdit1.Enabled:=False;
   LC1.Enabled      :=False;
   LC2.Enabled      :=False;
   LC3.Enabled      :=False;
   LC4.Enabled      :=False;
   SB1.Enabled      :=False;
   SB1.Caption      :='Publicada';
 End;
End;

procedure TFrmCalculo.sbtnAlterarClick(Sender: TObject);
begin
// Se Simulação publicada, Sai
 If (QrySimulacoes.FieldByName('PUBLICADA').AsString = 'S') Then Begin
   ShowMessage('Simulação está Publicada, Não pode ser alterada . ');
   SbtnAlterar.Down:=False;
   Exit;
 End;
  inherited;
// Se Simulacao Nao Publicada Abilita Parametros
 If (QrySimulacoes.FieldByName('PUBLICADA').AsString = 'N') Or
       (QrySimulacoes.FieldByName('PUBLICADA').AsString = '') Then begin
   LC1.Enabled:=True;
   LC2.Enabled:=True;
   LC3.Enabled:=True;
   LC4.Enabled:=True;
   SB1.Enabled:=True;
   DateEdit1.Enabled:=True;
   DBEdit1.Enabled  :=True;
   DBMemo1.Enabled  :=True;
 End Else Begin
   ShowMessage('Simulação está Publicada, Não pode ser alterada . ');
   DbEdit1.Enabled  :=False;
   DbMemo1.Enabled  :=False;
   DateEdit1.Enabled:=False;
   LC1.Enabled      :=False;
   LC2.Enabled      :=False;
   LC3.Enabled      :=False;
   LC4.Enabled      :=False;
   SB1.Enabled      :=False;
   SB3.Enabled      :=False;
 End;
// Desabilita Executar
 SB2.Enabled      :=False;
End;
procedure TFrmCalculo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Atribui DateEdit ao Campo da Tabela
  DateEdit1.Date:=QrySimulacoes.FieldByName('DATA').AsDateTime;
// Se Publicada ......
  If (QrySimulacoes.FieldByName('PUBLICADA').AsString = 'S') Then begin
    DbEdit1.Enabled  :=False;
    DbMemo1.Enabled  :=False;
  End;
  DateEdit1.Enabled:=False;
  LC1.Enabled      :=False;
  LC2.Enabled      :=False;
  LC3.Enabled      :=False;
  LC4.Enabled      :=False;
  SB1.Enabled      :=False;
  SB2.Enabled      :=True;
end;

procedure TFrmCalculo.sbtnApagarClick(Sender: TObject);
begin
// Se Simulação Publicad, Sai
  If (QrySimulacoes.FieldByName('PUBLICADA').AsString = 'S') Then begin
    ShowMessage('Simulação está Publicada, Não pode ser excluida . ');
    SbtnApagar.Down:=False;
    Exit;
  End;

  inherited;
end;
function TFrmCalculo.CriaEstrutura(var Vetor:VetEst;nome,caminho,descricao:string) : boolean;
var
estrutura : textfile;
tamanhocampostr,campo,tipocampo : string;
tam,posicao,numcampos,tamanhodec,posini,
posfim,tamanhocampo,i,j,ind,poscampo,posdescricao : integer;

begin
 i := pos('.TXT',nome);
 delete(nome,i,4);
 AssignFile(estrutura,caminho+'\'+nome+'.sch');
  Try
    Rewrite(Estrutura);
  Except
    ShowMessage('Arquivo de estrutura de '+nome+' não pode ser criado ..... ');
    Try
      CloseFile(OutPutFile);
    Except
    End;
    CriaEstrutura := false
  End;
 descricao := trim(descricao);
 tam := length(descricao);
 delete(descricao,1,11);
 delete(descricao,tam,1);
 writeln(estrutura,'['+nome+']'+#13);
 writeln(estrutura,'Filetype=Fixed'+#13);
 writeln(estrutura,'Charset=ascii'+#13);

 numcampos := 0;
 posdescricao := 1000;
 posicao := 0;
 while posdescricao <> 0 do begin
  inc(numcampos);
  tamanhodec := 0;
  posdescricao := pos(';',descricao);
  poscampo := pos(',',descricao);
  campo := copy(descricao,1,poscampo - 1);
  tipocampo := copy(descricao,poscampo+1,1);
  if (uppercase(tipocampo) = 'C') or (uppercase(tipocampo) = 'D') then begin
    tipocampo := 'Char';
    ind := poscampo+3;
    tamanhocampostr := '';
    while descricao[ind] <> ';' do begin
     tamanhocampostr := tamanhocampostr+ descricao[ind];
     inc(ind);
    end;
    tamanhocampo :=strtoint(tamanhocampostr);
  end
  else
    if uppercase(tipocampo) = 'N' then begin
     ind := poscampo+3;
     tamanhocampostr := '';
     while descricao[ind] <> ',' do begin
      tamanhocampostr := tamanhocampostr+ descricao[ind];
      inc(ind);
     end;
     tamanhocampo := strtoint(tamanhocampostr);
     inc(ind);
     tamanhocampostr := '';
     while (descricao[ind] <> ';') and (descricao[ind] <> '.') do begin
      tamanhocampostr := tamanhocampostr+ descricao[ind];
      inc(ind);
     end;
     tamanhodec := strtoint(tamanhocampostr);
     if tamanhodec <> 0 then tipocampo := 'Float'
     else tipocampo := 'Integer';
    end
    else
     begin
      showmessage('Erro no tipo de campo');
      CriaEstrutura := false;
     end;
  delete(descricao,1,posdescricao);

  if pos('.',descricao) = 1 then
   writeln(estrutura,'Field'+inttostr(numcampos)+'='+campo+','+tipocampo+','+
   inttostr(tamanhocampo)+','+inttostr(tamanhodec)+','+inttostr(posicao)+#13)
  else
   writeln(estrutura,'Field'+inttostr(numcampos)+'='+campo+','+tipocampo+','+
   inttostr(tamanhocampo)+','+inttostr(tamanhodec)+','+inttostr(posicao)+#13+#10);

  posicao := posicao + tamanhocampo;
  Vetor[numcampos].tamanho := tamanhocampo;
  Vetor[numcampos].tipo    := tipocampo;
 end;
 closefile(estrutura);
 CriaEstrutura := true;

end;
procedure TFrmCalculo.LC4NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  inherited;
  ShowMessage('Tabela não Encontrada !!!');
  Accept:=False;
end;

//----------------------------------------------
// Botao de Execucao - Executa Simulacao
procedure TFrmCalculo.SB2Click(Sender: TObject);
Var
  regra,i,pegaidfiltro:integer;
  EstruturaStr,nome,wPath,wSQL,SQLSTR :String;
  codigo3,codigo1,codigo2 : string;
  Num : string;
begin
  inherited;
  WPOS := 0;

  pegaidfiltro := pos('IDFILTRO',QryFiltros['montasql']);
  if pegaidfiltro <> 0 then  // tabela que não foi filtrada apenas selecionada
    Wsql := copy(QryFiltros['montasql'],1,pegaidfiltro - 6)
  else
    Wsql := QryFiltros['montasql'];

  with QrySimulacao do begin
   close;
   sql.clear;
   sql.Add(Wsql);
  end;

  Try
// Alimenta a propriedade Filter para Filtrar o Arquivo
   QrySimulacao.open;
// Esconde PgragressBar e Mostra Resultado do Filtro
    Panel2.Visible:=False;
  Except
    ShowMessage('Erro, Problemas na Tabela de Participantes. Verifique !!!');
    Exit;
  End;

  if SalvarArq.Execute then begin
   PathArquivo := uppercase(SalvarArq.filename);
   nome  := uppercase(ExtractFilename(SalvarArq.filename));
   NomeTabTXT := nome; // parametro para comp TabelaTXT
   if length(nome) > 12 then begin  // nome + .txt
    showmessage('Nome do arquivo TXT maior que 8 Caracteres');
    exit;
   end;
   wpath := uppercase(ExtractFileDir(SalvarArq.filename));
   DiretorioTXT := wpath; // diretorio para comp TabelaTXT
  end
  else
   exit;

// Caso Diretorio não Exista Cria Diretorio
  If Not DirectoryExists(wPath) Then Begin
// Nao Consegiu Criar
    If Not CreateDir(wPath) Then Begin
      ShowMessage('Diretório de saída não pode ser criado ..... ');
      Exit;
    End;
  End;

 FazQuery(QryAuxiliar,'SELECT IDREGRA FROM '+sistema.PrefixoServidor+'REGRAS '+
           'WHERE IDGRUPOREGRA = '+QryRegras.FieldByName('IDGRUPOREGRA').AsString);
 regra := QryAuxiliar.FieldByName('IDREGRA').AsInteger;

//------------------------------------------------------------------------------
// busca a estrutura de arquivo na regra criada
  codigo1 := 'simatu'; // na CM
  codigo2 := 'CAMPOSDESC%';
  codigo3 := inttostr(regra);
  SQLSTR := 'SELECT IDFORMULA,EXPRESSAOREAL FROM '+sistema.PrefixoServidor+
            'FORMULA WHERE '+
            'CODGRUPOFORMULA = '+''''+codigo1+''''+' AND EXPRESSAOREAL LIKE '+
            ''''+codigo2+ ''''+' AND IDFORMULA IN(SELECT FORMULA1 FROM '+
            sistema.PrefixoServidor+'ALGREGRA WHERE '+
            'IDREGRA = '+codigo3+' AND FORMULA1 > 0)';
  with QryAuxiliar do begin
   close;
   sql.clear;
   sql.add(SQLSTR);
   try
    open;
   except
    begin
     showmessage('Problema na identificação da estrutura do arquivo de saída');
     exit;
    end;
   end;
   if Eof then begin
    Showmessage('A regra código'+inttostr(regra)+' não tem fórmula de estrutura de arquivo');
    exit;
   end;
   EstruturaStr := QryAuxiliar['expressaoreal'];
  end;

  for i := 1 to 60 do begin
   VetorCampo[i].tamanho := 0;
   VetorCampo[i].tipo    := '';
  end;

  if not CriaEstrutura(VetorCampo,nome,wpath,EstruturaStr) then begin
    showmessage('Problemas na criação da estrutura do arquivo : '+nome);
  end;

// Cria ou Associa um Arquivo a uma Variavel
  AssignFile(OutPutFile,PathArquivo);

// Cria um Arquivo para Gravado
  Try
    Rewrite(OutPutFile);
  Except
    ShowMessage('Arquivo '+nome+' não pode ser criado ..... ');
    Try
      CloseFile(OutPutFile);
    Except
    End;
    Exit;
  End;

//-- Inicia Processamento da Simulacao --\\
// Refresca a Tela
  FrmCalculo.Update;
// Marca Tamanho da ProgressBar e Visualisa
  PrgBar1.Max   :=QrySimulacao.RecordCount;
  Panel2.Visible:=True;
  Label8.Caption:='Aguarde, Executando Simulação .....';
  Label8.Update;

// Busca regras do Grupo de Regras
  FazQuery(QryAuxiliar,'SELECT IDREGRA FROM '+sistema.PrefixoServidor+'REGRAS '+
           'WHERE IDGRUPOREGRA = '+QryRegras.FieldByName('IDGRUPOREGRA').AsString);

// Processa Regras na Tabela Filtrada
  While Not QryAuxiliar.Eof Do Begin
    Try
  if MsgDlg('Deseja visualizar passo a passo a execução da regra ?',
     'Execução da Regra',
     mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes  then
     else
    Except
      On E: Exception Do Begin
        ShowMessage('Erro ao Executar a Regra, Mensagem ... '+#13+#13+E.Message);
        CloseFile(OutPutFile);
        Panel2.Visible   :=False;
        PrgBar1.Position :=0;
        PrgBar1.Max      :=0;
        wPos             :=0;
        Exit;
      End;
    End;
// Proxima Regra do Grupo
    QryAuxiliar.Next;
  End;
// Fecha ou Desassocia o Arquivo
  CloseFile(OutPutFile);
  Panel2.Visible   :=False;
  PrgBar1.Position :=0;
  PrgBar1.Max      :=0;
  wPos             :=0;
// Termina Execucao
  ShowMessage('Simulação Executada com Sucesso .... ');
  SB4.enabled := true;
// Libera Botao Resultado
  SB3.Enabled:=True;
end;


procedure TFrmCalculo.SairClick(Sender: TObject);
begin
  inherited BbtnSairClick(Sender);
end;



procedure TFrmCalculo.SB3Click(Sender: TObject);

begin
  inherited;
// Executa Relatorio
  application.createform(TDmRelatoriosAtuariais,DmRelatoriosAtuariais);
  with DmRelatoriosAtuariais do begin
   TabelaTXT.Databasename := DiretorioTXT;
   TabelaTXT.TableName    := NomeTabTXT;
   TabelaTXT.open;
   Design.showmodal;
   TabelaTXT.close;
  end;
  DmRelatoriosAtuariais.Free;
  
end;

procedure TFrmCalculo.Sb4Click(Sender: TObject);
begin
 application.createform(TDmRelatoriosAtuariais,DmRelatoriosAtuariais);
 with DmRelatoriosAtuariais do begin
   RLNome.Caption := sistema.NomeEmpresa;
   RQrySimulacoes.ParamByName('ChaveSimula').AsInteger :=
     QrySimulacoes.FieldByName('IDSIMULACAO').AsInteger;
   RQryHipoteses.ParamByName('ChaveGrupo').AsInteger :=
     QryHipoteses['idgrupohipotese'];
   RQryRegras.ParamByName('ChaveRegra').AsInteger :=
     QryRegras['idgruporegra'];
   try
    RQrySimulacoes.open;
    RQryHipoteses.open;
    RQryRegras.open;
   except
    Showmessage('Problema nos dados da simulação');
    exit;
   end;
   ppHistorico.Print;
   RQrySimulacoes.close;
   RQryHipoteses.close;;
   RQryRegras.close;
 end;
 DmRelatoriosAtuariais.Free;

//SB4.enabled := false;
end;

//----------------------------------------------
// OnGet Result da Regra

procedure TFrmCalculo.Regra1GetResult(sender: TObject);
var
 campo,texto : string;
 i,j : integer;
begin
  inherited;
  if sairdaregra = true then close;

// Gera Linha de OutPut
// Escreve uma Linha e Quebra
  i := 1;
  j := 1;
  while i <> 0 do begin
   i := pos(';',texto);
   if i <> 0 then
    campo := copy(texto,1,i-1)
   else
    campo := texto;  //ultimo campo
   campo := TrataSaida(campo,vetorcampo[j].tipo,vetorcampo[j].tamanho);
   write(OutPutFile,campo);
   delete(texto,1,i);
   inc(j);
  end;
  WriteLn(OutPutFile,'');
  Inc(wPos);
  PrgBar1.Position:=wPos;  // Incrementa ProgressBar

end;

End.
