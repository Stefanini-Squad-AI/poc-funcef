unit fImportCotMoeda;
{  *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  20/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//-----------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, DBTables, Wwquery, BfDialogs, BrowseFolder, uProcuraDir,
  ComCtrls, wwdblook, uSistema;

type
   TCotacoes = Record
                  VALOR               : String[20];
                  MESANO              : String[6];
                  DATAINICIO          : String[10];
                  DATAFIM             : String[10];
               End;

  TfrmImportCotMoeda = class(TfrmOkCancelar)
    lblPathArqProc: TLabel;
    edArqGravar: TEdit;
    btnArqProcessar: TSpeedButton;
    Label1: TLabel;
    edTxt: TEdit;
    SpeedButton1: TSpeedButton;
    odTxt: TOpenDialog;
    ProcuraDirDlg1: TProcuraDirDlg;
    qrymoeda: TwwQuery;
    Label3: TLabel;
    dsmoeda: TwwDataSource;
    pcctropcoes: TPageControl;
    tbFormato: TTabSheet;
    tbErros: TTabSheet;
    Memo1: TMemo;
    memerros: TMemo;
    tbDemons: TTabSheet;
    memdesc: TMemo;
    qryAux: TwwQuery;
    cmbMoeda: TwwDBLookupCombo;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnArqProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    LRegCotacoes                   : TCotacoes;
    wArquivo, wArquivoBack  : TextFile;    
    { Private     declarations }
  public
     function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;  
    { Public declarations }
  end;

var
  frmImportCotMoeda: TfrmImportCotMoeda;

implementation

Uses uDataBAse, UMensErro,  DBaseDados, UModuloFuncef, uIntegraPrevRH;

{$R *.DFM}

procedure TfrmImportCotMoeda.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edTxt.Text := odTxt.FileName;
  edTxt.Hint := edTxt.Text;
  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
     edTxt.ShowHint := true
  else
  edTxt.ShowHint := false;
end;

procedure TfrmImportCotMoeda.btnArqProcessarClick(Sender: TObject);
begin
  inherited;
  if (ProcuraDirDlg1.Execute)
  then edArqGravar.Text := UpperCase(ProcuraDirDlg1.Directory);
end;

procedure TfrmImportCotMoeda.FormCreate(Sender: TObject);
begin
  inherited;

   //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
   odTxt.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   ProcuraDirDlg1.Directory := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   qrymoeda.open;
end;

procedure TfrmImportCotMoeda.bbtnConfirmarClick(Sender: TObject);
var sLinha : String;
begin
  inherited;
   memdesc.lines.clear;
   memerros.lines.clear;


   if not dtmbasedados.dbBaseDados.intransaction then
   dtmbasedados.dbBaseDados.starttransaction;

   if (cmbMoeda.text = '') or  (edTxt.text = '') or (edArqGravar.text = '') then
   begin
      MsgDlg('Todos os campos devem ser preenchidos.','Parametrização',mtInformation,[mbOk,mbHelp],0);
      cmbMoeda.SetFocus;
      exit;
   end;


   Try
      AssignFile(wArquivo,edTxt.Text);
      AssignFile(wArquivoBack,edArqGravar.Text+'\BackUp_'+qrymoeda.fieldbyname('MOECODIGO').AsString+'.txt');
      Reset(wArquivo);
      Rewrite(wArquivoBack);
   Except
      CloseFile(wArquivo);
      CloseFile(wArquivoBack);
      Exit;
   End;



   while not Eof(wArquivo) do
   begin
      Readln(wArquivo, sLinha);

      with lRegCotacoes do
      begin
         VALOR :=  oranumero(copy(sLinha,1,20));
         MESANO :=  copy(sLinha,22,6);
         DATAINICIO :=  copy(sLinha,29,10);
         DATAFIM :=  copy(sLinha,40,10);
      end;


      qryaux.close;
      qryaux.sql.text := ' SELECT COTVALOR , COTDATA, COTMESREF, COTDATAFIM '+
                         ' FROM COTACAOMOEDA '+
                         ' WHERE MOECODIGO = '+qrymoeda.fieldbyname('MOECODIGO').AsString+' AND '+
                         ' COTMESREF = '''+lRegCotacoes.MESANO+''' AND '+
                         ' COTDATA = TO_DATE('''+lRegCotacoes.DATAINICIO+''',''DD/MM/YYYY'') AND '+
                         ' COTDATAFIM = TO_DATE('''+lRegCotacoes.DATAINICIO+''',''DD/MM/YYYY'')  ';
      qryaux.open;

      if qryaux.isempty then
      begin
         memerros.lines.add('Cotação não encontrada - MesAno:'+qryaux.fieldbyname('COTMESREF').AsString+' , '+
                            ' Data:'+qryaux.fieldbyname('COTDATA').AsString+'. ');
         continue;
      end;

      WriteLn(wArquivoBack,CompletaString(qryaux.fieldbyname('COTVALOR').AsString,' ',20,True)+' '+
                           CompletaString(qryaux.fieldbyname('COTMESREF').AsString,' ',6,False)+' '+
                           CompletaString(qryaux.fieldbyname('COTDATA').AsString,' ',10,False)+' '+
                           CompletaString(qryaux.fieldbyname('COTDATAFIM').AsString,' ',10,False));



      memdesc.lines.add('AnoMes:'+qryaux.fieldbyname('COTMESREF').AsString+' / '+
                        'Data'+qryaux.fieldbyname('COTDATA').AsString+' - '+
                        'Valor Anterior: '+oranumero(qryaux.fieldbyname('COTVALOR').AsString)+' , '+
                        'Valor Atual:'+lRegCotacoes.VALOR+'.');


      qryaux.close;
      qryaux.sql.text := ' UPDATE COTACAOMOEDA SET COTVALOR = '+lRegCotacoes.VALOR+' '+
                         ' WHERE MOECODIGO = '+qrymoeda.fieldbyname('MOECODIGO').AsString+' AND '+
                         ' COTMESREF = '''+lRegCotacoes.MESANO+''' AND '+
                         ' COTDATA = TO_DATE('''+lRegCotacoes.DATAINICIO+''',''DD/MM/YYYY'') AND '+
                         ' COTDATAFIM = TO_DATE('''+lRegCotacoes.DATAINICIO+''',''DD/MM/YYYY'')  ';
      try
         qryaux.ExecSql;
      except
         memerros.lines.add('Erro ao executar o comando: '+qryaux.sql.gettext+'');
         continue;
      end;


   end;


   if trim(memerros.text) <> '' then
   begin
      MsgDlg('Ocorreram erros na importação. Analise descrição de erros.','Erro',mtError,[mbOk,mbHelp],0);
      dtmBasedados.dbBaseDados.RollBack;
      pcctropcoes.activepage := tbErros;
   end
   else
   begin
      MsgDlg('Importação processada com sucesso.','Confirmação',mtConfirmation,[mbOk,mbHelp],0);
      dtmBasedados.dbBaseDados.Commit;
      pcctropcoes.activepage := tbDemons;
   end;


   // Voltar arquivo para o inicio
   CloseFile(wArquivo);
   CloseFile(wArquivoBack);



end;

function TfrmImportCotMoeda.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;


procedure TfrmImportCotMoeda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmImportCotMoeda.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   cmbMoeda.text := '';
   edTxt.text := '';
   edArqGravar.text := '';

   memdesc.lines.clear;
   memerros.lines.clear;


   with dtmBasedados.dbBaseDados do
   if InTransaction then  RollBack;

      pcctropcoes.activepage := tbFormato;   
    
end;

end.
