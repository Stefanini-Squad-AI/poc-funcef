unit UCriaEstruturaTXT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, checklst, ExtCtrls,Buttons,uMensErro;

type
  Estrutura = record
              tamanho : integer;
              tipo    : string;
              end;
  VetEst = array[1..60] of estrutura ; // para estrutura do txt - sch

  TFrmCriaEstruturaTXT = class(TForm)
    nomecampo: TEdit;
    descricao: TListBox;
    Binclui: TButton;
    tipo: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Ptamanho: TPanel;
    PDecimal: TPanel;
    Utamanho: TUpDown;
    tamanho: TEdit;
    Label3: TLabel;
    decimal: TEdit;
    Udecimal: TUpDown;
    Label4: TLabel;
    Bexclui: TButton;
    Bsaida: TButton;
    Pbotoes: TPanel;
    BOk: TButton;
    BCancela: TButton;
    BMeio: TButton;
    Button1: TButton;
    abrir: TOpenDialog;
    procedure BincluiClick(Sender: TObject);
    procedure BsaidaClick(Sender: TObject);
    procedure nomecampoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BexcluiClick(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure tipoClick(Sender: TObject);
    procedure BCancelaClick(Sender: TObject);
    procedure nomecampoEnter(Sender: TObject);
    procedure tamanhoEnter(Sender: TObject);
    procedure BMeioClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tamanhoExit(Sender: TObject);
    procedure decimalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function acerto(nome:string;tamanho:integer):string;
    function MontaReg(wdescricao:string) : boolean;
    function MontaEstrutura(var Vetor:VetEst;nome,caminho,descricao:string) : boolean;
    function TrocaPontoVirgulaDec(Value: String): String;
  end;

var
  FrmCriaEstruturaTXT: TFrmCriaEstruturaTXT;
  wnome : string[12];
  wtipo : string[2];
  wdecimal,wtamanho : string[3];
  DiretorioTXT,NomeTabTXT,PathArquivo : string;
  VetorCampo  : VetEst;

implementation

{$R *.DFM}

uses FileCtrl,URelatoriosAtuariais,UCalculo;

function TFrmCriaEstruturaTXT.TrocaPontoVirgulaDec(Value: String): String;
var
  i,j,code : Integer;
  iPosVirg : Integer;
  numero : string;
begin
  iPosVirg := pos('.',Value);
  if iPosVirg <> 0 then begin
    numero := copy(value,iPosVirg-1,1); // pega caracter antes do ponto
    val(numero,j,code);
    if code = 0 then // caracter é numérico
     Value := copy(Value,1,iPosVirg-1)+','+copy(Value,iPosVirg+1,length(Value));
  end;
  TrocaPontoVirgulaDec := Value;
end;

function TFrmCriaEstruturaTXT.MontaEstrutura(var Vetor:VetEst;nome,caminho,descricao:string) : boolean;
var
Estrutura,OutPutFile:TextFile;
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
    MontaEstrutura := false
  End;
 descricao := trim(descricao);
 tam := length(descricao);

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
      MontaEstrutura := false;
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
 MontaEstrutura := true;

end;

function TFrmCriaEstruturaTXT.MontaReg(wdescricao:string) : boolean;
var
nome,tipo,tamanho,decimal,selecao : string;
fim,fim1,fim2 : integer;
begin
 descricao.Clear;
 fim :=  pos('.',wdescricao);
 selecao := wdescricao;
 try
 while (pos(';',wdescricao) > 0) do begin
  fim1 :=  pos(';',wdescricao);
  selecao := copy(wdescricao,1,fim1 - 1);
  wdescricao := copy(wdescricao,fim1+1,fim - fim1 +1);
  nome := copy(selecao,1,pos(',',selecao) - 1);
  nome := acerto(nome,12);
  delete(selecao,1,pos(',',selecao));
  tipo :=  copy(selecao,1,pos(',',selecao) - 1);
  delete(selecao,1,pos(',',selecao));
  if tipo <> 'N' then begin
   tamanho := copy(selecao,1,fim - 1);
   tamanho := acerto(tamanho,3);
   decimal := '';
  end
  else begin
   tamanho := copy(selecao,1,pos(',',selecao) - 1);
   tamanho := acerto(tamanho,3);
   delete(selecao,1,pos(',',selecao));
   decimal := copy(selecao,1,fim - 1);
   decimal := acerto(decimal,3);
  end;
  tipo := tipo+'#';
  descricao.items.add(nome+tipo+tamanho+decimal);
 end;
 except begin
  showmessage('Problemas na edição da fórmula');
  MontaReg := false;
 end;
 end;
 // ULTIMO REGISTRO - PARTE DO PONTO
 selecao := copy(wdescricao,1,fim);
 nome := copy(selecao,1,pos(',',selecao) - 1);
 nome := acerto(nome,12);
 delete(selecao,1,pos(',',selecao));
 tipo :=  copy(selecao,1,pos(',',selecao) - 1);
 delete(selecao,1,pos(',',selecao));
 if tipo <> 'N' then begin
   fim :=  pos('.',selecao);
   tamanho := copy(selecao,1,fim - 1);
   tamanho := acerto(tamanho,3);
 end
 else begin
   tamanho := copy(selecao,1,pos(',',selecao) - 1);
   tamanho := acerto(tamanho,3);
   delete(selecao,1,pos(',',selecao));
   fim :=  pos('.',selecao);
   decimal := copy(selecao,1,fim - 1);
   decimal := acerto(decimal,3);
 end;
 tipo := tipo+'#';
 if tipo = 'N#'then
  descricao.items.add(nome+tipo+tamanho+decimal)
 else
  descricao.items.add(nome+tipo+tamanho);

 MontaReg := true;

end;

function TFrmCriaEstruturaTXT.acerto(nome:string;tamanho:integer):string;
var
i,j,k : integer;
begin
 i := length(nome);
 if tamanho > i then begin
  j := tamanho - i;
  for k := 1 to j do
   if k = j then
    nome := nome
   else
   nome := nome + ' ';
 end;
 acerto := nome+ '#';
end;

procedure TFrmCriaEstruturaTXT.BincluiClick(Sender: TObject);
begin
 if strtoint(tamanho.text) <= 0 then begin
  showmessage('tamanho tem que ser maior que zero');
  tamanho.setfocus;
  exit;
 end;
 if strtoint(tamanho.text) <= strtoint(decimal.text) then begin
  showmessage('tamanho tem que ser maior que decimal');
  tamanho.setfocus;
  exit;
 end;
 wnome    := uppercase(acerto(nomecampo.text,12));
 wtipo    := copy(tipo.items[tipo.itemindex],1,1)+'#';
 wtamanho := acerto(tamanho.text,3);
 wdecimal := acerto(decimal.text,3) ;
 if (wtipo = 'N#') then
  descricao.items.Add(wnome+wtipo+wtamanho+wdecimal)
 else
  descricao.items.Add(wnome+wtipo+wtamanho);
 nomecampo.setfocus;
end;

procedure TFrmCriaEstruturaTXT.BsaidaClick(Sender: TObject);
begin
 close;
end;

procedure TFrmCriaEstruturaTXT.nomecampoExit(Sender: TObject);
begin
if length(nomecampo.text) > 12 then begin
 showmessage('Campo com máximo de 12 caracteres');
 nomecampo.setfocus;
end;
end;


procedure TFrmCriaEstruturaTXT.FormShow(Sender: TObject);
begin
 pdecimal.visible := false;
end;

procedure TFrmCriaEstruturaTXT.BexcluiClick(Sender: TObject);
begin
 descricao.Items.delete(descricao.itemindex);
 nomecampo.setfocus;
end;

procedure TFrmCriaEstruturaTXT.BOkClick(Sender: TObject);
var
 numcampos,ponto,i,j : integer;
 outputfile,saida : textfile;
 regnovo,campo,registro,wpath,leitura,saidastr,parte,nome :string;
begin
  if descricao.Items.Count <= 0 then begin
   showmessage('Nenhum registro foi montado');
   exit;
  end;
  saidastr := '';
  for i := 0 to descricao.Items.Count - 1  do begin
    leitura := descricao.items[i];
    while pos('#',leitura) > 1 do begin
     ponto := pos('#',leitura);
     parte := trim(copy(leitura,1,ponto - 1));
     saidastr := saidastr+parte+',';
     delete(leitura,1,ponto);
    end;
    delete(saidastr,length(saidastr),1);
    saidastr := saidastr+';' ;
  end;
  delete(saidastr,length(saidastr),1);
  saidastr := saidastr + '.';
  showmessage('Atenção : estrutura concluída.'+#10+#13 + 'Entre agora com o nome do arquivo TXT');

  if abrir.Execute then begin
   PathArquivo := uppercase(abrir.filename);
   nome  := uppercase(ExtractFilename(abrir.filename));
   NomeTabTXT := nome; // parametro para comp TabelaTXT
   if length(nome) > 12 then begin  // nome + .txt
    showmessage('Nome do arquivo TXT maior que 8 Caracteres');
    exit;
   end;
   wpath := uppercase(ExtractFileDir(abrir.filename));
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

  for i := 1 to 60 do begin
   VetorCampo[i].tamanho := 0;
   VetorCampo[i].tipo    := '';
  end;

  if not MontaEstrutura(VetorCampo,nome,wpath,saidastr) then begin
    showmessage('Problemas na criação da estrutura do arquivo : '+nome);
    exit;
  end;
  // tratamento campos numéricos decimais : ponto por vírgula.
  if MsgDlg('Tratamento de campo numérico com ponto decimal.'+#10+#13+' Deseja trocar ponto por vírgula ?',
     'Mudança no arquivo original',
     mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes  then  begin
    assignfile(saida,PathArquivo);
    assignfile(outputfile,diretoriotxt+'\temp.txt');
    rewrite(outputfile);
    reset(saida);
    for numcampos:= 1 to 60 do
     if vetorcampo[numcampos].tamanho <= 0 then break;

    while not(eof(saida)) do begin
     regnovo := '';
     readln(saida,registro);
     j := 1;
     while j < numcampos do begin
      campo := copy(registro,1,vetorcampo[j].tamanho);
      if (vetorcampo[j].tipo = 'Float') or (vetorcampo[j].tipo = 'Integer') then
       campo := TrocaPontoVirgulaDec(campo);
      delete(registro,1,vetorcampo[j].tamanho);
      inc(j);
      regnovo := regnovo+campo;
     end;
     WriteLn(OutPutFile,regnovo);
    end;

    closefile(outputfile);
    closefile(saida);
    if not deletefile(PathArquivo) then begin
      showmessage('Problema na transformação dos '+ #10+#13+ 'campos decimais do arquivo TXT');
      exit;
    end
    else
    if not renamefile(diretoriotxt+'\temp.txt',PathArquivo) then begin
     showmessage('Arquivo TXT foi apagado');
     exit;
    end;

  end;
  application.createform(TDmRelatoriosAtuariais,DmRelatoriosAtuariais);
  with DmRelatoriosAtuariais do begin
   TabelaTXT.Databasename := DiretorioTXT;
   TabelaTXT.TableName := NomeTabTXT;
   TabelaTXT.open;
   Design.showmodal;
   TabelaTXT.close;
  end;
  DmRelatoriosAtuariais.Free;
  close;
end;

procedure TFrmCriaEstruturaTXT.tipoClick(Sender: TObject);
begin
 if tipo.items[tipo.itemindex] = 'Numérico' then
  Pdecimal.visible := true;
end;

procedure TFrmCriaEstruturaTXT.BCancelaClick(Sender: TObject);
begin
 descricao.Clear;
end;

procedure TFrmCriaEstruturaTXT.nomecampoEnter(Sender: TObject);
begin
nomecampo.text := '';
pdecimal.visible := false;
decimal.text := '0';
tamanho.text := '0';
end;

procedure TFrmCriaEstruturaTXT.tamanhoEnter(Sender: TObject);
begin
if tipo.items[tipo.itemindex] <> 'Numérico' then
 pdecimal.visible := false;
end;

procedure TFrmCriaEstruturaTXT.BMeioClick(Sender: TObject);
var
i,novo,atual : integer;
begin
 if descricao.itemindex > -1 then begin
  wnome := uppercase(acerto(nomecampo.text,12));
  wtipo := copy(tipo.items[tipo.itemindex],1,1);
  wtamanho := acerto(tamanho.text,3);
  if wtipo <> 'N' then
   wdecimal := ''
  else
   wdecimal := acerto(decimal.text,3);
  wtipo := wtipo+'#';
  descricao.Items.add('');
  atual :=  descricao.itemindex;
  for i := descricao.items.Count -1 downto descricao.itemindex+1 do
      descricao.items[i] :=   descricao.items[i - 1];
  descricao.items[atual] := wnome+wtipo+wtamanho+wdecimal;
 end
 else
  showmessage('Selecionar um registro');

 nomecampo.setfocus;

end;


procedure TFrmCriaEstruturaTXT.Button1Click(Sender: TObject);
begin
if nomecampo.text = '' then begin
 showmessage('Entre com os novos valores');
 nomecampo.setfocus;
 exit;
end;
 if descricao.itemindex > -1 then begin
  wnome := uppercase(acerto(nomecampo.text,12));
  wtipo := copy(tipo.items[tipo.itemindex],1,1);
  if wtipo <> 'N' then
   wdecimal := ''
  else
   wdecimal := acerto(decimal.text,3)+'#'; ;
  wtipo := wtipo+'#';
  wtamanho := acerto(tamanho.text,3);
  descricao.items[descricao.itemindex] := '';
  descricao.items[descricao.itemindex] := wnome+wtipo+wtamanho+wdecimal;
 end
 else
  showmessage('Selecionar um registro');

 nomecampo.setfocus;
end;

procedure TFrmCriaEstruturaTXT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := CaFree;
end;

procedure TFrmCriaEstruturaTXT.tamanhoExit(Sender: TObject);
begin
 if strtoint(tamanho.text) > 19 then begin
  showmessage('Tamanho máximo : 19');
  tamanho.setfocus;
  exit;
 end;
end;

procedure TFrmCriaEstruturaTXT.decimalExit(Sender: TObject);
begin
 if strtoint(decimal.text) > 10 then begin
  showmessage('Tamanho máximo : 10');
  decimal.setfocus;
  exit;
 end;

end;

end.








       
       
       
       
       
       




       
       
       
       

       
       
       
       
       
       




       
       
       
       

       
       
       
       
       
       
































































       
       
       
       

       
       
       
       
       
       
       



       
       
       
       

       
       
       
       
       
       
       



       
       
       
       

       
       
       
       
       
       
       



       
       
       
       

       
       
       
       
       
       
       


