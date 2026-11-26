{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO INICIO DESTE ARQUIVO *******************}

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
unit fFrameProgresso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ActnList, ToolWin, ExtCtrls, ImgList, Db, DBTables,
  Wwquery, Menus, registry, uGImp, uString, uSistema;

type
  TfrmFrameProgresso = class(TFrame)
    Panel1: TPanel;
    BarraProgresso: TProgressBar;
    toolControles: TToolBar;
    StatusBar1: TStatusBar;
    tbtnSalvar: TToolButton;
    ActionList1: TActionList;
    actSalvar: TAction;
    redResultado: TRichEdit;
    tbtnImprimir: TToolButton;
    actImprimir: TAction;
    tbtnSep1: TToolButton;
    tbtnsep2: TToolButton;
    tbtnsep3: TToolButton;
    tbtnVisualizar: TToolButton;
    actVisualiza: TAction;
    ImageList1: TImageList;
    qryFrame: TwwQuery;
    PopupMenu1: TPopupMenu;
    SelecionaLOG: TMenuItem;
    SaveDialog1: TSaveDialog;
    redTemp: TRichEdit;
    ToolButton1: TToolButton;
    lblNomeLog: TLabel;
    procedure actSalvarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actVisualizaExecute(Sender: TObject);
    procedure SelecionaLOGClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
    ohorainiciogeral : tdatetime;
    ohorafinalgeral : tdatetime;
    ohorainiciofase : tdatetime;
    ohorafinalfase : tdatetime;
    FNomeLog: string;
    Registry: TRegistry;
    FIntervaloCommit: integer;
    FIntervaloAtualiza: integer;
    FOrdemCommit: integer;
    procedure DescarregaResultado;
    procedure PegaNomeArquivoLog;
    procedure SetNomeLog(const Value: string);
    procedure MostraMensagem(aslinha : string);
    procedure SetIntervaloAtualiza(const Value: integer);
    procedure SetIntervaloCommit(const Value: integer);
    procedure SetOrdemCommit(const Value: integer);
  public
    { Public declarations }
    procedure GravaNovoArquivoLog;
    procedure ExibeMensagemEmCaixa(asmensagem : string);
    procedure ExibeMensagem(asmensagem : string);
    procedure Iniciar(asMensagemInicio : string; bborda : boolean);
    procedure Terminar(asMensagemFinal : string; bborda : boolean);
    procedure ResetaFrame(alpasso, almaximo : integer);
    procedure MarcaInicioFase(asdesacricaofase : string);
    procedure MarcaFinalFase(asdesacricaofase : string);
    procedure Passo;
    function ProcessaQuery(snometab, scabec, swhe, soperacao : string;
      lpasso : longint) : boolean;
    function ProcessaQuerydeLista(qryLista : twwquery;
      snometab, snomecampo, scabec, swhe, soperacao : string;
      lpasso : longint) : boolean;
    property NomeLog : string read FNomeLog write SetNomeLog;
    procedure Encerra;
    property IntervaloCommit: integer read FIntervaloCommit write SetIntervaloCommit;
    property IntervaloAtualiza: integer read FIntervaloAtualiza write SetIntervaloAtualiza;
    property OrdemCommit: integer read FOrdemCommit write SetOrdemCommit;
    procedure FazCommit(babretransacao: boolean);
  end;

implementation

{$R *.DFM}

uses ShellAPI, UDatabase, dbasedados;

procedure TfrmFrameProgresso.FrameResize(Sender: TObject);
begin
  PegaNomeArquivoLog;
end;

procedure TfrmFrameProgresso.SetNomeLog(const Value: string);
begin
  lblNomeLog.caption:='  Salvar Log em : '+Value;
  FNomeLog:=Value;
end;

procedure TfrmFrameProgresso.GravaNovoArquivoLog;
begin
  Registry:=TRegistry.Create;
  Registry.RootKey := HKEY_CURRENT_USER;
  if Registry.OpenKey('Software\CM\Folha de Benefícios\',true) then
    Registry.WriteString('Arquivo LOG', FNomeLog);
  Registry.CloseKey;
  Registry.Free;
end;

procedure TfrmFrameProgresso.PegaNomeArquivoLog;
begin
  if NomeLog = '' then
  begin
    Registry:=TRegistry.Create;
    Registry.RootKey := HKEY_CURRENT_USER;
    if Registry.OpenKey('Software\CM\Folha de Benefícios\',true) then
    begin
      NomeLog:=Registry.ReadString('Arquivo LOG');
      if NomeLog = '' then
      begin

        //Jéssica Lana SOL 109421 KINTANA 496332
        //NomeLog:='C:\LOGFOLHABENEFICIO.TXT';
        NomeLog:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LOGFOLHABENEFICIO.TXT';

        Registry.WriteString('Arquivo LOG', FNomeLog);
      end;
    end;
    Registry.CloseKey;
    Registry.Free;
  end;
end;

procedure TfrmFrameProgresso.SelecionaLOGClick(Sender: TObject);
begin
  SaveDialog1.InitialDir:=ExtractFilePath(FNomeLog);
  SaveDialog1.Filename:=ExtractFileName(FNomeLog);
  if SaveDialog1.execute then
  begin
    NomeLog:=SaveDialog1.filename;
    GravaNovoArquivoLog;
  end;
end;

procedure TfrmFrameProgresso.DescarregaResultado;
 var ffile : textfile;
     lii : longint;
begin
  assignfile(ffile, NomeLog);
  if FileExists(NomeLog) then
    append(ffile)
  else
    rewrite(ffile);
  try
    for lii:=0 to redResultado.lines.count-1 do
      writeln(ffile, redResultado.lines[lii]);
  finally
    closefile(ffile);
  end;
end;

procedure TfrmFrameProgresso.ExibeMensagemEmCaixa(asmensagem : string);
 var lss : string;
     llen, lii : integer;
begin
  redTemp.lines.clear;
  redTemp.lines.add(asmensagem);
  llen:=0;
  for lii:=0 to redTemp.lines.count-1 do
    if length(redTemp.lines[lii]) > llen then
      llen:=length(redTemp.lines[lii]);

  lss:='+';
  for lii:=1 to llen+2 do
    lss:=lss+'-';
  lss:=lss+'+';
  MostraMensagem(lss);
  for lii:=0 to redTemp.lines.count-1 do
    MostraMensagem('| '+AE(redTemp.lines[lii],llen)+' |');
  MostraMensagem(lss);
end;

procedure TfrmFrameProgresso.MostraMensagem(aslinha : string);
begin
  aslinha:=formatdatetime('dd/mm/yyyy hh:nn:ss', now)+' - '+aslinha;
  try
    redResultado.lines.add(aslinha);
    redResultado.update;
  except
    DescarregaResultado;
    redResultado.lines.clear;
    redResultado.lines.add(aslinha);
    redResultado.update;
  end;
end;

procedure TfrmFrameProgresso.ExibeMensagem(asmensagem: string);
 var lii : integer;
begin
  redTemp.lines.clear;
  redTemp.lines.add(asmensagem);
  for lii:=0 to redTemp.lines.count-1 do
    MostraMensagem(redTemp.lines[lii]);
end;

procedure TfrmFrameProgresso.MarcaInicioFase(asdesacricaofase: string);
begin
  OrdemCommit:=0;
  StatusBar1.panels[4].text:=asdesacricaofase;
  ohorainiciofase:=now;
  ExibeMensagem('Início fase: '+asdesacricaofase);
  StatusBar1.panels[1].text:='0';
  if (BarraProgresso.max > 0) and (BarraProgresso.max < maxint) then
    StatusBar1.panels[3].text:=inttostr(BarraProgresso.max);
  application.processmessages;
end;

procedure TfrmFrameProgresso.MarcaFinalFase(asdesacricaofase: string);
begin
  ohorafinalfase:=now;
  ExibeMensagem('Final fase: '+asdesacricaofase);
  if ohorafinalfase-ohorainiciofase < 1 then
    ExibeMensagem('Tempo fase: '+formatdatetime('hh:nn:ss',ohorafinalfase-ohorainiciofase))
  else
    ExibeMensagem('Tempo fase: '+formatdatetime('dd hh:nn:ss',ohorafinalfase-ohorainiciofase));
  application.processmessages;
end;

procedure TfrmFrameProgresso.FazCommit(babretransacao: boolean);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then 
    dtmBaseDados.dbBaseDados.commit;
  if babretransacao then
    dtmBaseDados.dbBaseDados.StartTransaction;
  OrdemCommit:=OrdemCommit+1;
  ExibeMensagem('  Ponto de gravação: '+inttostr(OrdemCommit));
end;

procedure TfrmFrameProgresso.Passo;
begin
  if BarraProgresso.position = BarraProgresso.max then
    BarraProgresso.position:=BarraProgresso.min;
  BarraProgresso.position:=BarraProgresso.position+1;
  BarraProgresso.update;
  StatusBar1.panels[1].text:=inttostr(BarraProgresso.position);
  StatusBar1.update;
  redResultado.update;
  if (IntervaloAtualiza > 0) then
    if (BarraProgresso.position mod IntervaloAtualiza) = 0 then
      application.processmessages;
  if (IntervaloCommit > 0) then
    if (BarraProgresso.position mod IntervaloCommit) = 0 then
      FazCommit(true);
end;

procedure TfrmFrameProgresso.ResetaFrame(alpasso, almaximo: integer);
begin
  BarraProgresso.min:=0;
  BarraProgresso.position:=BarraProgresso.min;
  BarraProgresso.step:=alpasso;
  BarraProgresso.max:=almaximo;
  StatusBar1.panels[1].text:='';
  StatusBar1.panels[3].text:='';
  if almaximo = 0 then
  begin
    BarraProgresso.max:=maxint;
    StatusBar1.panels[2].text:='';
  end
  else
  begin
    StatusBar1.panels[2].text:='de';
    StatusBar1.panels[3].text:=inttostr(BarraProgresso.max);
  end;
  self.update;
end;

procedure TfrmFrameProgresso.Iniciar(asMensagemInicio : string; bborda : boolean);
begin
  tbtnSalvar.enabled:=false;
  tbtnImprimir.enabled:=false;
  tbtnVisualizar.enabled:=false;
  ohorainiciogeral:=now;
  redResultado.lines.clear;
  redResultado.setfocus;
  if bborda then
    ExibeMensagemEmCaixa(asMensagemInicio)
  else
    ExibeMensagem(asMensagemInicio);
  IntervaloCommit:=0;
  IntervaloAtualiza:=100;
  OrdemCommit:=0;
end;

procedure TfrmFrameProgresso.Terminar(asMensagemFinal : string; bborda : boolean);
begin
  ResetaFrame(1,0);
  StatusBar1.panels[4].text:='Concluído';
  ohorafinalgeral:=now;
  ExibeMensagem('');
  if ohorafinalgeral-ohorainiciogeral < 1 then
    ExibeMensagem('Tempo total: '+formatdatetime('hh:nn:ss',ohorafinalgeral-ohorainiciogeral))
  else
    ExibeMensagem('Tempo total: '+formatdatetime('dd hh:nn:ss',ohorafinalgeral-ohorainiciogeral));
  if bborda then
    ExibeMensagemEmCaixa(asMensagemFinal)
  else
    ExibeMensagem(asMensagemFinal);
  ExibeMensagem('');
  tbtnSalvar.enabled:=true;
  tbtnImprimir.enabled:=true;
  tbtnVisualizar.enabled:=true;
end;

procedure TfrmFrameProgresso.actSalvarExecute(Sender: TObject);
begin
  DescarregaResultado;
  redResultado.lines.clear;
end;

procedure TfrmFrameProgresso.Encerra;
begin
  if redResultado.lines.count > 0 then
    DescarregaResultado;
end;

procedure TfrmFrameProgresso.actImprimirExecute(Sender: TObject);
 var ss:string;
begin
  fillchar(ss,sizeof(ss),#0);
  ss:=NomeLog;
  ShellExecute(handle, 'print', Pchar(@ss[1]), nil, nil, SW_HIDE);
end;

procedure TfrmFrameProgresso.actVisualizaExecute(Sender: TObject);
 var ss:string;
begin
  fillchar(ss,sizeof(ss),#0);
  ss:=NomeLog;
  ShellExecute(handle, 'open', Pchar(@ss[1]), nil, nil, SW_SHOWNORMAL);
end;

function TfrmFrameProgresso.ProcessaQuery(snometab, scabec, swhe, soperacao : string;
  lpasso : longint) : boolean;
 var lii, literacoes, ltotal : longint;
     ssql : string;
     bcommit, bentroutransacao : boolean;
begin
  result:=true;
  try
    if snometab = '' then
      exit;

    ssql:='SELECT COUNT(*) FROM '+snometab+' '+swhe;
    if FazQuery(qryFrame, ssql) then
    begin
      ltotal:=qryFrame.fields[0].asinteger;
      if ltotal = 0 then
        exit;
    end    
    else
      exit;

    bcommit:=lpasso>=0;
    if lpasso <= 0 then lpasso:=ltotal;
    literacoes:=ltotal div lpasso;
    if ltotal mod lpasso > 0 then
      inc(literacoes);
    ResetaFrame(1, literacoes);
    if soperacao = '' then
      soperacao:='Processando registros da tabela '+uppercase(snometab);
    MarcaInicioFase(soperacao);

    if literacoes > 1 then
    begin
      if swhe = '' then
        swhe:='WHERE ROWNUM <= '+inttostr(lpasso)
      else
        swhe:=swhe+' AND ROWNUM <= '+inttostr(lpasso);
    end;
    ssql:=scabec+' '+swhe;

    bentroutransacao:=dtmBaseDados.dbBaseDados.InTransaction;
    if not bentroutransacao then
      if bcommit then
        dtmBaseDados.dbBaseDados.StartTransaction;

    for lii:=1 to literacoes do
    begin
      if not ExecutarQuery(qryFrame, ssql) then
      begin
        if bcommit then
          dtmBaseDados.dbBaseDados.rollback;
        ExibeMensagem('Problema no processamento dos registros da tabela '+snometab+
          '. Interação: '+inttostr(lii));
        result:=false;
        break;
      end
      else
      begin
        if bcommit then
        begin
          dtmBaseDados.dbBaseDados.commit;
          dtmBaseDados.dbBaseDados.StartTransaction;
        end;
        result:=true;
      end;
      Passo;
      if literacoes > 1 then
        ExibeMensagem('Commit parcial: '+inttostr(lii));
    end;

    if not bentroutransacao then
      if bcommit then
        dtmBaseDados.dbBaseDados.Commit;
    MarcaFinalFase(soperacao);
  except
    ExibeMensagem('Problema no processamento dos registros da tabela '+snometab);
    result:=false;
  end;
end;

function TfrmFrameProgresso.ProcessaQuerydeLista(qryLista : twwquery;
  snometab, snomecampo, scabec, swhe, soperacao : string; lpasso : longint) : boolean;
{swhe - deve ter a sintaxe 'where nomecampo = ' para que se possa acescentar o valor
 do elemento da lista. Decidi não usar a lista Param pois é mais instável.}
 var lii, literacoes, ltotal : longint;
     ssql : string;
     bcommit, bentroutransacao : boolean;
begin
  result:=true;
  try
    if snometab = '' then
      exit;

    ltotal:=qryLista.recordcount;
    if ltotal <= 0 then
      exit;

    bcommit:=lpasso>=0;
    if lpasso <= 0 then lpasso:=ltotal;
    literacoes:=ltotal;
    ResetaFrame(1, literacoes);

    if soperacao = '' then
      soperacao:='Processando registros da tabela '+uppercase(snometab);
    MarcaInicioFase(soperacao);

    bentroutransacao:=dtmBaseDados.dbBaseDados.InTransaction;
    if not bentroutransacao then
      if bcommit then
        dtmBaseDados.dbBaseDados.StartTransaction;

    qryLista.first;
    lii:=0;
    while not qryLista.eof do
    begin
      inc(lii);
      ssql:=scabec+' '+swhe+' '+qryLista.fieldbyname(snomecampo).asstring;
      if not ExecutarQuery(qryFrame, ssql) then
      begin
        if bcommit then
          dtmBaseDados.dbBaseDados.rollback;
        ExibeMensagem('Problema no processamento dos registros da tabela '+snometab+
          '. Interação: '+inttostr(lii));
        result:=false;
        break;
      end
      else
      begin
        if literacoes > 1 then
          if bcommit then
          begin
            ExibeMensagem('Commit parcial: '+inttostr(lii));
            dtmBaseDados.dbBaseDados.commit;
            dtmBaseDados.dbBaseDados.StartTransaction;
          end;
        result:=true;
      end;
      Passo;
      qryLista.next;
    end;

    if not bentroutransacao then
      if bcommit then
        dtmBaseDados.dbBaseDados.Commit;
    MarcaFinalFase(soperacao);
  except
    ExibeMensagem('Problema no processamento dos registros da tabela '+snometab);
    result:=false;
  end;
end;

procedure TfrmFrameProgresso.SetIntervaloAtualiza(const Value: integer);
begin
  FIntervaloAtualiza := Value;
end;

procedure TfrmFrameProgresso.SetIntervaloCommit(const Value: integer);
begin
  FIntervaloCommit := Value;
end;

procedure TfrmFrameProgresso.SetOrdemCommit(const Value: integer);
begin
  FOrdemCommit := Value;
end;

end.
{==============================================================================|
| UNIT: FFRAMEPROGRESSO                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FRAME PARA ACOMPANHAR PROCESSOS BATCH                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/10/2001 A 30/10/2001                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSTRUÇÃO DO FORM                                                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}


