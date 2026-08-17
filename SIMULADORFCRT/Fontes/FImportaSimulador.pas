// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 04/07/2005
// Pendencia   : 19607
// Rotina      : Varias
// Alteração   : Impotar Eventogerador 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 23/06/2005
// Pendencia   : 19470
// Rotina      : Varias
// Alteração   : Impotar novos campos 
//------------------------------------------------------------------------------
unit FImportaSimulador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, URegra,
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls;

type
  TfrmImportaSimulador = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    bbtnImportar: TBitBtn;
    qry: TwwQuery;
    qryAux: TwwQuery;
    OpenDlg: TOpenDialog;
    qryInsert: TwwQuery;
    updInsert: TUpdateSQL;
    pgctrlImportacao: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    sbtnAtivos: TSpeedButton;
    Label2: TLabel;
    sbtnAssistidos: TSpeedButton;
    Label3: TLabel;
    sbtnPensionistas: TSpeedButton;
    Label4: TLabel;
    edArqATIVOS: TEdit;
    edArqASSISTIDOS: TEdit;
    edArqPENSIONISTAS: TEdit;
    dtDataREF: TCMDateTimePicker;
    lblProcessando: TLabel;
    memErros: TMemo;
    Label5: TLabel;
    edReservas: TEdit;
    sbtnReservas: TSpeedButton;
    procedure sbtnAtivosClick(Sender: TObject);
    procedure sbtnAssistidosClick(Sender: TObject);
    procedure sbtnPensionistasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnImportarClick(Sender: TObject);
    procedure sbtnReservasClick(Sender: TObject);
  private
    { Private declarations }
    iNumDep : word;
    cCodProcesso : char; // A - ATIVOS, S - ASSISTIDOS, P - PENSIONISTAS
  public
    { Public declarations }
    function  OraNumero(sNumero : string):string;
    function  ClienteNumero(sNumero : string):string;
    function  TiraPonto(sNumero : string ) : string;
    function  ColocaZeros(Codigo:string;Tam:byte):string;
    function  ColocaZerosDireita( sPalavra : string; iTam : byte ) : string;
    function  PreparaStr(Codigo : string; Tam : byte) : string;

    procedure MontaDadosDependentes( psLinha : string);
    procedure GeraImportacaoATIVOS;
    procedure GeraImportacaoASSISTIDOS;
    procedure GeraImportacaoPENSIONISTAS;
    procedure ImportaRESERVAS;
  end;

var
  frmImportaSimulador: TfrmImportaSimulador;

implementation

uses uMensErro, fCadHistFuncPartCS, fAguarde, DBaseDados;


{$R *.DFM}






function TfrmImportaSimulador.ColocaZerosDireita( sPalavra : string; iTam : byte ) : string;
var i, iMax : word;

begin
   sPalavra := Trim(sPalavra);

   if Length(sPalavra) >= iTam
   then begin
      Result := sPalavra;
      Exit;
   end;

   iMax := Length(sPalavra) - iTam;
   for i := 1 to iMax do
   begin
      sPalavra := sPalavra + '0';
   end;
end;

function  TfrmImportaSimulador.TiraPonto(sNumero : string ) : string;
var i : word;
    sAux : string;
begin
   sAux := '';
   for i := 1 to Length(sNumero) do
       if (Copy(sNumero,i,1) <> '.') and (Copy(sNumero,i,1) <> ',')
       then sAux := sAux + Copy(sNumero,i,1);

   Result := sAux;
end;

function TfrmImportaSimulador.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   // CAMILLE - REFER - 23.08.1999
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;

function TfrmImportaSimulador.OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;


function TfrmImportaSimulador.ColocaZeros(Codigo:string;Tam:byte):string;
var
  TamTemp:byte;
  Valor:LongInt;
  Erro:Integer;
begin
  ColocaZeros:=Codigo;
  Codigo:=Trim(Codigo);
  if Codigo='' then
    exit;
  val(Codigo,Valor,Erro);
  if Erro<>0 then begin
    ColocaZeros := PreparaStr(Codigo,Tam);
    exit;
  end;
  Codigo:=IntToStr(Valor);  {tira os zeros que existiam antes}
  TamTemp:=length(Codigo);
  while TamTemp<Tam do begin
    Codigo:='0'+Codigo;
    TamTemp:=length(Codigo);
  end;
  ColocaZeros:=Codigo;
end;

function TfrmImportaSimulador.PreparaStr(Codigo : string; Tam : byte) : string;
var
  I:byte;
begin
  if Length(Codigo)<>Tam then begin
    Codigo:=trim(Codigo);
    if Length(Codigo)>Tam
      then Codigo:=copy(Codigo,1,Tam)
      else for I:=Length(Codigo) to (Tam-1) do
             Codigo:=Codigo+' ';
  end;
  PreparaStr:=Codigo;
end;


procedure TfrmImportaSimulador.GeraImportacaoATIVOS;
var F          : TextFile;
    sLinha,
    sMatricula : string;
    i          : word;
begin

   cCodProcesso := 'A';
   if (Trim(edArqATIVOS.Text) = '')
   then Exit;

   qryInsert.Close;
   qryInsert.Open;

   AssignFile(F, edArqAtivos.Text);
   Reset(F);
   i := 0;
   while not Eof(F) do
   begin
      Readln(F, sLinha);
      //P.RAMOS-30.06.2005
      if trim(sLinha) = '' then
        continue;
      //P.RAMOS-30.06.2005-FIM
      sMatricula := Trim(Copy(sLinha, 3,10));
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPESSOA, PP.IDPLANOPREV, PP.SEQPROPOSTA  '+
                 ' FROM   ELEGPATRO EL, PARTPREVPLAN PP                              '+
                 ' WHERE  EL.MATRICULA LIKE '''+sMatricula+'%''                      '+
                 ' AND    PP.IDPESSJUR = EL.IDPESSJUR                                '+
                 ' AND    PP.IDPESSOA  = EL.IDPESSOA                                 ');
         Open;
         if IsEmpty
         then begin
            memErros.Lines.Add('Matricula : '+sMatricula+' não encontrada. ');
            continue;
         end;
      end;

      try
      qryInsert.Append;
      qryInsert.FieldByName('IDPESSJUR').AsString       := qryAux.FieldByName('IDPESSJUR').AsString;
      qryInsert.FieldByName('IDPLANOPREV').AsString     := qryAux.FieldByName('IDPLANOPREV').AsString;
      qryInsert.FieldByName('IDPESSOA').AsString        := qryAux.FieldByName('IDPESSOA').AsString;
      qryInsert.FieldByName('SEQPROPOSTA').AsString     := qryAux.FieldByName('SEQPROPOSTA').AsString;
      qryInsert.FieldByName('ANOMESREF').AsString       := Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2);
      qryInsert.FieldByName('MATRICULA').AsString       := sMatricula;
      if Copy(sLinha,14,1) = '1'
      then begin
         qryInsert.FieldByName('SITUACAO').AsString     := 'AT';
         qryInsert.FieldByName('NOMESITUACAO').AsString := 'Ativo';
      end
      else if Copy(sLinha,14,1) = '2'
      then begin
         qryInsert.FieldByName('SITUACAO').AsString     := 'MA';
         qryInsert.FieldByName('NOMESITUACAO').AsString := 'Autopatrocinado';
      end
      else if Copy(sLinha,14,1) = '3'
      then begin
         qryInsert.FieldByName('SITUACAO').AsString     := 'MP';
         qryInsert.FieldByName('NOMESITUACAO').AsString := 'Ativo';
      end
      else if Copy(sLinha,14,1) = '4'
      then begin
         qryInsert.FieldByName('SITUACAO').AsString      := 'AT';
         qryInsert.FieldByName('NOMESITUACAO').AsString  := 'Auxílio Doença';
      end
      else if Copy(sLinha,14,1) = '5'
      then begin
         qryInsert.FieldByName('SITUACAO').AsString      := 'AT';
         qryInsert.FieldByName('NOMESITUACAO').AsString  := 'Auxílio Doença';
      end
      else begin
         qryInsert.FieldByName('SITUACAO').AsString      := 'AT';
         qryInsert.FieldByName('NOMESITUACAO').AsString := 'Ativo';
      end;

      qryInsert.FieldByName('NOME').AsString            := Copy(sLinha,15,40);
      if Copy(sLinha,55,1) = '1'
      then qryInsert.FieldByName('SEXO').AsString       := 'M'
      else qryInsert.FieldByName('SEXO').AsString       := 'F';

      if  Copy(sLinha,56,1) = '1' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'S';
      if  Copy(sLinha,56,1) = '2' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'C';
      if  Copy(sLinha,56,1) = '3' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'V';
      if  Copy(sLinha,56,1) = '4' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'E';
      if  Copy(sLinha,56,1) = '5' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'M';
      if  Copy(sLinha,56,1) = '6' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'D';
      if  Copy(sLinha,56,1) = '7' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'J';
      if  Copy(sLinha,56,1) = '8' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'O';
      if  Copy(sLinha,56,1) = '9' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'P';


      try
         StrToDate(Copy(sLinha,57,2)+'/'+Copy(sLinha,59,2)+'/'+Copy(sLinha,61,4));
         qryInsert.FieldByName('DATANASC').AsString        := Copy(sLinha,57,2)+'/'+Copy(sLinha,59,2)+'/'+Copy(sLinha,61,4);
      except
         qryInsert.FieldByName('DATANASC').AsString        := '';
      end;

      try
         StrToDate(Copy(sLinha,65,2)+'/'+Copy(sLinha,67,2)+'/'+Copy(sLinha,69,4));
         qryInsert.FieldByName('DATAADMISSAO').AsString    := Copy(sLinha,65,2)+'/'+Copy(sLinha,67,2)+'/'+Copy(sLinha,69,4);
      except
         qryInsert.FieldByName('DATAADMISSAO').AsString    := '';
      end;

      try
         StrToDate(Copy(sLinha,73,2)+'/'+Copy(sLinha,75,2)+'/'+Copy(sLinha,77,4));
         qryInsert.FieldByName('INSCRICAODATA').AsString   := Copy(sLinha,73,2)+'/'+Copy(sLinha,75,2)+'/'+Copy(sLinha,77,4);
      except
         qryInsert.FieldByName('INSCRICAODATA').AsString   := '';
      end;
      qryInsert.FieldByName('REMUNERACAO').AsFloat      := StrToFloat(ClienteNumero(Copy(sLinha,81,7))) / 100;
      qryInsert.FieldByName('SALPARTICIPACAO').AsFloat  := StrToFloat(ClienteNumero(Copy(sLinha,88,7))) / 100;
      qryInsert.FieldByName('CONTRIBUICAO').AsFloat     := StrToFloat(ClienteNumero(Copy(sLinha,95,7))) / 100;
      qryInsert.FieldByName('TEMPOINSS').AsFloat        := StrToFloat(ClienteNumero(Copy(sLinha,102,3))) ;
      qryInsert.FieldByName('JOIA').AsFloat             := StrToFloat(ClienteNumero(Copy(sLinha,105,7))) / 100;
      qryInsert.FieldByName('PRAZOJOIAFALTA').AsString  := ClienteNumero(Copy(sLinha,112,3));
      qryInsert.FieldByName('PRAZOJOIAPAGO').AsString   := ClienteNumero(Copy(sLinha,115,3));
      qryInsert.FieldByName('TAXAJOIA').AsFloat         := StrToFloat(ClienteNumero(Copy(sLinha,118,8)))  / 10000000;
      qryInsert.FieldByName('RPTRIBUTAVEL').AsFloat     := StrToFloat(ClienteNumero(Copy(sLinha,126,12))) / 100;
      qryInsert.FieldByName('RPNAOTRIBUTAVEL').AsFloat  := StrToFloat(ClienteNumero(Copy(sLinha,138,12))) / 100;
      qryInsert.FieldByName('SRB').AsFloat              := StrToFloat(ClienteNumero(Copy(sLinha,162,12)))  / 100;
      qryInsert.FieldByName('FATORPREVIDENC').AsFloat   := StrToFloat(ClienteNumero(Copy(sLinha,186,8)))  / 10000000;
      qryInsert.FieldByName('TEMPOMINCONTRIB').AsString := ClienteNumero(Copy(sLinha,194,2));
      qryInsert.FieldByName('DATAINICIOFUND').AsString  := '';
      qryInsert.FieldByName('VALORATUAL').AsString      := '';
      qryInsert.FieldByName('VLRINFINSS').AsFloat       := StrToFloat(ClienteNumero(Copy(sLinha,174,12))) / 100;
      qryInsert.FieldByName('IDADEAPOS').AsString       := ClienteNumero(Copy(sLinha,196,3)) ;
      qryInsert.FieldByName('IDBENEFICIO').AsString     := '';
      qryInsert.FieldByName('VALORABONO').AsString      := '';
      qryInsert.FieldByName('DATAULTSIMULA').AsString   := '';
      qryInsert.FieldByName('OPCAO').AsString           := '';
      qryInsert.FieldByName('CONTRIBUICAOEXTRA').AsFloat := StrToFloat(ClienteNumero(Copy(sLinha,301,7))) / 100; { Augusto 29/06/2005 }
      qryInsert.FieldByName('IDEVENTOGERADOR').AsString  := Copy(sLinha,308,2); { Augusto 04/07/2005 }
                                        
      qryInsert.Post;
      inc(i);
      lblProcessando.Caption := 'Linhas Processadas : '+IntToStr(i);
      Application.ProcessMessages;
      except
        memErros.Lines.Add(sLinha);
      end;
   end;

   try
      frmAguarde.Mostra('Gravando Informações ...');
      qryInsert.ApplyUpdates;
   finally
      frmAguarde.Apaga;
   end;

   CloseFile(F);
end;

procedure TfrmImportaSimulador.ImportaRESERVAS;
var F          : TextFile;
    sLinha,
    sMatricula,
    sRP, sRM, sRT, sRMC, sRTC  : string;
    i          : word;
begin

   cCodProcesso := 'A';
   if (Trim(edReservas.Text) = '')
   then Exit;

   { Inicio Augusto 08/07/2005 - Verificar se existe arquivo }
   If Not FileExists(edReservas.Text)  Then Begin
     MsgDlg('Arquivo de Reservas não encontrado, não será inportado!',
            'Erro', mtError, [mbOK],0);
     frmAguarde.Apaga;
     Exit;
   End;
   { Fim Augusto 08/07/2004 }

   AssignFile(F, edReservas.Text);
   Reset(F);
   i := 0;
   frmAguarde.Mostra('Atualizando Reservas...');

   If dtmBaseDados.dbBaseDados.InTransaction Then dtmBaseDados.dbBaseDados.Rollback; { Augusto 23/06/2005 }
   dtmBaseDados.dbBaseDados.StartTransaction;
   while not Eof(F) do
   begin
      Readln(F, sLinha);
      //P.RAMOS-29.06.2005
      if trim(sLinha) = '' then
        continue;
      //P.RAMOS-29.06.2005-FIM
      sMatricula := Trim(Copy(sLinha, 1, 10));
      { Inicio Augusto 23/06/2005 - Novos Campos }
      Try
        sRP        := FloatToStr(StrToFloat(Trim(Copy(sLinha, 11,12)))/100);
        sRM        := FloatToStr(StrToFloat(Trim(Copy(sLinha, 23,12)))/100);
        sRT        := FloatToStr(StrToFloat(Trim(Copy(sLinha, 35,12)))/100);
        sRMC        := FloatToStr(StrToFloat(Trim(Copy(sLinha, 47,12)))/100); { Res. Mat. com Contribuição Extra }
        sRTC        := FloatToStr(StrToFloat(Trim(Copy(sLinha, 59,12)))/100); { Res. Trans. com Contribuição Extra }
      Except
        MsgDlg('Linha do arquivo com formato incorreto.'+#13+
               sLinha ,'Erro', mtError, [mbOK],0);
        frmAguarde.Apaga;
        Exit;
      End;
      { Fim Augusto 23/06/2005 }


      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE SIMULAMIGRACAO SET CAMPOOP1 = '+OraNumero(sRP)+','+
                 '                           CAMPOOP2 = '+OraNumero(sRM)+','+
                 '                           CAMPOOP3 = '+OraNumero(sRT)+','+
                 { Inicio Augusto 23/06/2005 - Novos Campos }
                 '                           CAMPOOP5 = '+OraNumero(sRMC)+','+
                 '                           CAMPOOP6 = '+OraNumero(sRTC)+
                 { Fim Augusto 23/06/2005 }
                 ' WHERE  ANOMESREF = '''+Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2)+''''+
                 ' AND    RTRIM(LTRIM(MATRICULA)) LIKE '''+sMatricula+'%'' ');
         try
            ExecSQL;
         except
            memErros.Lines.Add(sLinha);
         end;
      end;
   end;
   frmAguarde.Apaga;
   dtmBaseDados.dbBaseDados.Commit;

   CloseFile(F);
end;

procedure TfrmImportaSimulador.GeraImportacaoASSISTIDOS;
var F          : TextFile;
    sLinha,
    sMatricula : string;
    i          : word;
begin
   cCodProcesso := 'S';
   if (Trim(edArqASSISTIDOS.Text) = '')
   then Exit;

   qryInsert.Close;
   qryInsert.Open;

   AssignFile(F, edArqASSISTIDOS.Text);
   Reset(F);
   i := 0;
   while not Eof(F) do
   begin
      Readln(F, sLinha);
      //P.RAMOS-30.06.2005
      if trim(sLinha) = '' then
        continue;
      //P.RAMOS-30.06.2005-FIM
      sMatricula := Trim(Copy(sLinha, 5,10));
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPESSOA, PP.IDPLANOPREV, PP.SEQPROPOSTA  '+
                 ' FROM   ELEGPATRO EL, PARTPREVPLAN PP                              '+
                 ' WHERE  EL.MATRICULA = '''+sMatricula+'''                          '+
                 ' AND    PP.IDPESSJUR = EL.IDPESSJUR                                '+
                 ' AND    PP.IDPESSOA  = EL.IDPESSOA                                 ');
         Open;
         if IsEmpty
         then begin
            memErros.Lines.Add('Matricula : '+sMatricula+' não encontrada. ');
            continue;
         end;

      end;

      try
      qryInsert.Append;
      qryInsert.FieldByName('IDPESSJUR').AsString       := qryAux.FieldByName('IDPESSJUR').AsString;
      qryInsert.FieldByName('IDPLANOPREV').AsString     := qryAux.FieldByName('IDPLANOPREV').AsString;
      qryInsert.FieldByName('IDPESSOA').AsString        := qryAux.FieldByName('IDPESSOA').AsString;
      qryInsert.FieldByName('SEQPROPOSTA').AsString     := qryAux.FieldByName('SEQPROPOSTA').AsString;
      qryInsert.FieldByName('ANOMESREF').AsString       := Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2);
      qryInsert.FieldByName('MATRICULA').AsString       := sMatricula;
      qryInsert.FieldByName('SITUACAO').AsString        := 'AS';
      qryInsert.FieldByName('NOMESITUACAO').AsString    := 'Assistido';


      qryInsert.FieldByName('NOME').AsString            := Copy(sLinha,15,40);
      if Copy(sLinha,55,1) = '1'
      then qryInsert.FieldByName('SEXO').AsString       := 'M'
      else qryInsert.FieldByName('SEXO').AsString       := 'F';

      if  Copy(sLinha,56,1) = '1' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'S';
      if  Copy(sLinha,56,1) = '2' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'C';
      if  Copy(sLinha,56,1) = '3' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'V';
      if  Copy(sLinha,56,1) = '4' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'E';
      if  Copy(sLinha,56,1) = '5' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'M';
      if  Copy(sLinha,56,1) = '6' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'D';
      if  Copy(sLinha,56,1) = '7' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'J';
      if  Copy(sLinha,56,1) = '8' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'O';
      if  Copy(sLinha,56,1) = '9' then qryInsert.FieldByName('ESTADOCIVIL').AsString := 'P';


      try
         StrToDate(Copy(sLinha,57,2)+'/'+Copy(sLinha,59,2)+'/'+Copy(sLinha,61,4));
         qryInsert.FieldByName('DATANASC').AsString        := Copy(sLinha,57,2)+'/'+Copy(sLinha,59,2)+'/'+Copy(sLinha,61,4);
      except
         qryInsert.FieldByName('DATANASC').AsString        := '';
      end;

      try
         StrToDate(Copy(sLinha,65,2)+'/'+Copy(sLinha,67,2)+'/'+Copy(sLinha,69,4));
         qryInsert.FieldByName('DATAADMISSAO').AsString    := Copy(sLinha,65,2)+'/'+Copy(sLinha,67,2)+'/'+Copy(sLinha,69,4);
      except
         qryInsert.FieldByName('DATAADMISSAO').AsString    := '';
      end;

      try
         StrToDate(Copy(sLinha,73,2)+'/'+Copy(sLinha,75,2)+'/'+Copy(sLinha,77,4));
         qryInsert.FieldByName('INSCRICAODATA').AsString   := Copy(sLinha,73,2)+'/'+Copy(sLinha,75,2)+'/'+Copy(sLinha,77,4);
      except
         qryInsert.FieldByName('INSCRICAODATA').AsString   := '';
      end;

      try
         StrToDate(Copy(sLinha,81,2)+'/'+Copy(sLinha,83,2)+'/'+Copy(sLinha,85,4));
         qryInsert.FieldByName('DATAINICIOFUND').AsString   := Copy(sLinha,81,2)+'/'+Copy(sLinha,83,2)+'/'+Copy(sLinha,85,4);
      except
         qryInsert.FieldByName('DATAINICIOFUND').AsString   := '';
      end;

      qryInsert.FieldByName('REMUNERACAO').AsFloat      := 0;
      qryInsert.FieldByName('SALPARTICIPACAO').AsFloat  := 0;
      qryInsert.FieldByName('TEMPOINSS').AsFloat        := 0;
      qryInsert.FieldByName('JOIA').AsFloat             := 0;
      qryInsert.FieldByName('PRAZOJOIAFALTA').AsFloat   := 0;
      qryInsert.FieldByName('PRAZOJOIAPAGO').AsFloat    := 0;
      qryInsert.FieldByName('TAXAJOIA').AsFloat         := 0;
      qryInsert.FieldByName('RPTRIBUTAVEL').AsFloat     := 0;
      qryInsert.FieldByName('RPNAOTRIBUTAVEL').AsFloat  := 0;
      qryInsert.FieldByName('TEMPOMINCONTRIB').AsFloat  := 0;
      qryInsert.FieldByName('VALORATUAL').AsFloat       := StrToFloat(ClienteNumero(Copy(sLinha,97,7))) / 100;
      qryInsert.FieldByName('VLRINFINSS').AsFloat       := StrToFloat(ClienteNumero(Copy(sLinha,104,7))) / 100;
      qryInsert.FieldByName('FATORPREVIDENC').AsString  := ClienteNumero(Copy(sLinha,111,7));
      qryInsert.FieldByName('CONTRIBUICAO').AsFloat     := StrToFloat(ClienteNumero(Copy(sLinha,118,7))) / 100;
      qryInsert.FieldByName('SRB').AsFloat              := StrToFloat(ClienteNumero(Copy(sLinha,125,7))) / 100;
      qryInsert.FieldByName('VALORABONO').AsFloat       := StrToFloat(ClienteNumero(Copy(sLinha,132,7))) / 100;
      qryInsert.FieldByName('PROPORCAO').AsFloat        := StrToFloat(ClienteNumero(Copy(sLinha,139,6)))/100000;
      qryInsert.FieldByName('NUMDEPEN').AsString        := ClienteNumero(Copy(sLinha,145,2));
      qryInsert.FieldByName('CAMPOOP4').AsFloat         := StrToFloat(ClienteNumero(Copy(sLinha,147,7))) / 100;

      if StrToInt(Copy(sLinha,3,2)) = 6
      then begin
         qryInsert.FieldByName('IDBENEFICIO').AsInteger   := 5;
         qryInsert.FieldByName('NOMEBENEFICIO').AsString := 'Invalidez';
      end
      else if StrToInt(Copy(sLinha,3,2)) = 9
      then begin
         qryInsert.FieldByName('IDBENEFICIO').AsInteger   := 6;
         qryInsert.FieldByName('NOMEBENEFICIO').AsString := 'Idade';
      end
      else if StrToInt(Copy(sLinha,3,2)) = 4
      then begin
         qryInsert.FieldByName('IDBENEFICIO').AsInteger   := 7;
         qryInsert.FieldByName('NOMEBENEFICIO').AsString := 'T. Serviço';
      end
      else if StrToInt(Copy(sLinha,3,2)) = 5
      then begin
         qryInsert.FieldByName('IDBENEFICIO').AsInteger   := 8;
         qryInsert.FieldByName('NOMEBENEFICIO').AsString := 'Proporcional';
      end
      else if StrToInt(Copy(sLinha,3,2)) = 8
      then begin
         qryInsert.FieldByName('IDBENEFICIO').AsInteger   := 9;
         qryInsert.FieldByName('NOMEBENEFICIO').AsString := 'Especial';
      end
      else if StrToInt(Copy(sLinha,3,2)) = 7
      then begin
         qryInsert.FieldByName('IDBENEFICIO').AsInteger   := 14;
         qryInsert.FieldByName('NOMEBENEFICIO').AsString := 'Invalidez Acid.';
      end;

      qryInsert.FieldByName('DATAULTSIMULA').AsString   := '';
      qryInsert.FieldByName('OPCAO').AsString           := '';
      qryInsert.FieldByName('CONTRIBUICAOEXTRA').AsFloat := StrToFloat(ClienteNumero(Copy(sLinha,254,7))) / 100; { Augusto 29/06/2005 }
      qryInsert.FieldByName('IDEVENTOGERADOR').AsString  := Copy(sLinha,261,2); { Augusto 04/07/2005 }

      qryInsert.Post;
      inc(i);
      lblProcessando.Caption := 'Linhas Processadas : '+IntToStr(i);
      Application.ProcessMessages;
      except
        memErros.Lines.Add(sLinha);
      end;
   end;

   try
      frmAguarde.Mostra('Gravando Informações ...');
      qryInsert.ApplyUpdates;
   finally
      frmAguarde.Apaga;
   end;

   CloseFile(F);
end;

procedure TfrmImportaSimulador.MontaDadosDependentes( psLinha : string);
var strDependentes,
    sDadosDepen : string;
    iNumDepVit,
    iNumDepTemp : word;
    sDataAux,
    sDataNascVit,
    sDataNascTemp : string;
begin
   strDependentes := Copy(psLinha, 143, Length(psLinha)-143+1);

   iNumDepVit    := 0;
   iNumDepTemp   := 0;
   sDataNascVit  := '01/01/0001';
   sDataNascTemp := '01/01/0001';

   // DATANASC, 1,8
   // SEXO    , 9,1
   // TIPO    ,10,1

   while (Copy(strDependentes,1,2) <> '') and (Copy(strDependentes,1,2) <> '00') do
   begin
      sDadosDepen    := Copy(strDependentes,1,10);
      strDependentes := Copy(strDependentes,11,Length(strDependentes)-11+1);
      if Copy(sDadosDepen,10,1) = 'V'
      then begin
         inc(iNumDepVIt);
         sDataAux := Copy(sDadosDepen,1,2)+'/'+Copy(sDadosDepen,3,2)+'/'+Copy(sDadosDepen,5,4);
         if StrToDate(sDataAux) > StrToDate(sDataNascVit)
         then sDataNascVit := sDataAux;
      end
      else if Copy(sDadosDepen,10,1) = 'T'
      then begin
         inc(iNumDepTemp);
         sDataAux := Copy(sDadosDepen,1,2)+'/'+Copy(sDadosDepen,3,2)+'/'+Copy(sDadosDepen,5,4);
         if StrToDate(sDataAux) > StrToDate(sDataNascTemp)
         then sDataNascTemp := sDataAux;
      end;
   end;

   qryInsert.FieldByName('NUMDEPENVIT').AsInteger  := iNumDepVit;
   qryInsert.FieldByName('NUMDEPENTEMP').AsInteger := iNumDepTemp;
   if iNumDepVit > 0
   then qryInsert.FieldByName('DATANASCVIT').AsString  := sDataNascVit;

   if iNumDepTemp > 0
   then qryInsert.FieldByName('DATANASCTEMP').AsString  := sDataNascTemp;


end;

procedure TfrmImportaSimulador.GeraImportacaoPENSIONISTAS;
var F          : TextFile;
    sLinha,
    sMatricula : string;
    i          : word;
begin
   cCodProcesso := 'P';
   if (Trim(edArqPENSIONISTAS.Text) = '')
   then Exit;

   qryInsert.Close;
   qryInsert.Open;

   AssignFile(F, edArqPENSIONISTAS.Text);
   Reset(F);
   i := 0;
   while not Eof(F) do
   begin
      Readln(F, sLinha);
      //P.RAMOS-30.06.2005
      if trim(sLinha) = '' then
        continue;
      //P.RAMOS-30.06.2005-FIM
      sMatricula := Trim(Copy(sLinha, 5,10));
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT PP.IDPESSJUR, PP.IDPESSOA, PP.IDPLANOPREV, PP.SEQPROPOSTA  '+
                 ' FROM   ELEGPATRO EL, PARTPREVPLAN PP                              '+
                 ' WHERE  EL.MATRICULA = '''+sMatricula+'''                          '+
                 ' AND    PP.IDPESSJUR = EL.IDPESSJUR                                '+
                 ' AND    PP.IDPESSOA  = EL.IDPESSOA                                 ');
         Open;
         if IsEmpty
         then begin
            memErros.Lines.Add('Matricula : '+sMatricula+' não encontrada. ');
            continue;
         end;
      end;

      try
      qryInsert.Append;
      qryInsert.FieldByName('IDPESSJUR').AsString       := qryAux.FieldByName('IDPESSJUR').AsString;
      qryInsert.FieldByName('IDPLANOPREV').AsString     := qryAux.FieldByName('IDPLANOPREV').AsString;
      qryInsert.FieldByName('IDPESSOA').AsString        := qryAux.FieldByName('IDPESSOA').AsString;
      qryInsert.FieldByName('SEQPROPOSTA').AsString     := qryAux.FieldByName('SEQPROPOSTA').AsString;
      qryInsert.FieldByName('ANOMESREF').AsString       := Copy(dtDataREF.Text,7,4)+'/'+Copy(dtDataREF.Text,4,2);
      qryInsert.FieldByName('MATRICULA').AsString       := sMatricula;
      qryInsert.FieldByName('SITUACAO').AsString        := 'FL';
      qryInsert.FieldByName('NOMESITUACAO').AsString    := 'Pensionista';
      qryInsert.FieldByName('NOMEBENEFICIO').AsString   := 'Pensão';

      qryInsert.FieldByName('NOME').AsString            := Copy(sLinha,15,40);
      if Copy(sLinha,55,1) = '1'
      then qryInsert.FieldByName('SEXO').AsString       := 'M'
      else qryInsert.FieldByName('SEXO').AsString       := 'F';

      try
         StrToDate(Copy(sLinha,56,2)+'/'+Copy(sLinha,58,2)+'/'+Copy(sLinha,60,4));
         qryInsert.FieldByName('DATANASC').AsString        := Copy(sLinha,56,2)+'/'+Copy(sLinha,58,2)+'/'+Copy(sLinha,60,4);
      except
         qryInsert.FieldByName('DATANASC').AsString        := '';
      end;

      try
         StrToDate(Copy(sLinha,64,2)+'/'+Copy(sLinha,66,2)+'/'+Copy(sLinha,68,4));
         qryInsert.FieldByName('DATAADMISSAO').AsString    := Copy(sLinha,64,2)+'/'+Copy(sLinha,66,2)+'/'+Copy(sLinha,68,4);
      except
         qryInsert.FieldByName('DATAADMISSAO').AsString    := '';
      end;

      try
         StrToDate(Copy(sLinha,72,2)+'/'+Copy(sLinha,74,2)+'/'+Copy(sLinha,76,4));
         qryInsert.FieldByName('INSCRICAODATA').AsString   := Copy(sLinha,72,2)+'/'+Copy(sLinha,74,2)+'/'+Copy(sLinha,76,4);
      except
         qryInsert.FieldByName('INSCRICAODATA').AsString   := '';
      end;

      try
         StrToDate(Copy(sLinha,80,2)+'/'+Copy(sLinha,82,2)+'/'+Copy(sLinha,83,4));
         qryInsert.FieldByName('DATAINICIOFUND').AsString   := Copy(sLinha,80,2)+'/'+Copy(sLinha,82,2)+'/'+Copy(sLinha,84,4);
      except
         qryInsert.FieldByName('DATAINICIOFUND').AsString   := '';
      end;

      qryInsert.FieldByName('REMUNERACAO').AsFloat      := 0;
      qryInsert.FieldByName('SALPARTICIPACAO').AsFloat  := 0;
      qryInsert.FieldByName('TEMPOINSS').AsFloat        := 0;
      qryInsert.FieldByName('JOIA').AsFloat             := 0;
      qryInsert.FieldByName('PRAZOJOIAFALTA').AsFloat   := 0;
      qryInsert.FieldByName('PRAZOJOIAPAGO').AsFloat    := 0;
      qryInsert.FieldByName('TAXAJOIA').AsFloat         := 0;
      qryInsert.FieldByName('RPTRIBUTAVEL').AsFloat     := 0;
      qryInsert.FieldByName('RPNAOTRIBUTAVEL').AsFloat  := 0;
      qryInsert.FieldByName('TEMPOMINCONTRIB').AsFloat  := 0;
      qryInsert.FieldByName('VALORATUAL').AsFloat       := StrToFloat(ClienteNumero(Copy(sLinha,97,7))) / 100;
      qryInsert.FieldByName('VLRINFINSS').AsFloat       := StrToFloat(ClienteNumero(Copy(sLinha,104,7))) / 100;
      qryInsert.FieldByName('FATORPREVIDENC').AsString  := '1';
      qryInsert.FieldByName('CONTRIBUICAO').AsFloat     := 0;
      qryInsert.FieldByName('SRB').AsFloat              := StrToFloat(ClienteNumero(Copy(sLinha,111,7))) / 100;
      qryInsert.FieldByName('VALORABONO').AsFloat       := StrToFloat(ClienteNumero(Copy(sLinha,118,7))) / 100;
      qryInsert.FieldByName('PROPORCAO').AsFloat        := StrToFloat(ClienteNumero(Copy(sLinha,125,6)))/100000;
      qryInsert.FieldByName('IDBENEFICIO').AsInteger    := 11;
      qryInsert.FieldByName('COTAPENSAO').AsString      := ClienteNumero(Copy(sLinha,131,3));
      qryInsert.FieldByName('NUMDEPEN').AsString        := ClienteNumero(Copy(sLinha,134,2));
      qryInsert.FieldByName('CAMPOOP4').AsFloat         := StrToFloat(ClienteNumero(Copy(sLinha,136,7))) / 100;

      // Contar beneficiarios temporarios e vitalicios
      MontaDadosDependentes(sLinha);

      qryInsert.FieldByName('DATAULTSIMULA').AsString   := '';
      qryInsert.FieldByName('OPCAO').AsString           := '';
      qryInsert.FieldByName('CONTRIBUICAOEXTRA').AsFloat := StrToFloat(ClienteNumero(Copy(sLinha,243,7))) / 100; { Augusto 29/06/2005 }
      qryInsert.FieldByName('IDEVENTOGERADOR').AsString  := Copy(sLinha,250,2); { Augusto 04/07/2005 }

      qryInsert.Post;
      inc(i);
      lblProcessando.Caption := 'Linhas Processadas : '+IntToStr(i);
      Application.ProcessMessages;
      except
        memErros.Lines.Add(sLinha);
      end;
   end;

   try
      frmAguarde.Mostra('Gravando Informações ...');
      qryInsert.ApplyUpdates;
   finally
      frmAguarde.Apaga;
   end;

   CloseFile(F);
end;

procedure TfrmImportaSimulador.sbtnAtivosClick(Sender: TObject);
begin
  inherited;
  if opendlg.Execute
  then edArqATIVOS.Text := opendlg.FileName;
end;

procedure TfrmImportaSimulador.sbtnAssistidosClick(Sender: TObject);
begin
  inherited;
  if opendlg.Execute
  then edArqASSISTIDOS.Text := opendlg.FileName;

end;

procedure TfrmImportaSimulador.sbtnPensionistasClick(Sender: TObject);
begin
  inherited;
  if opendlg.Execute
  then edArqPENSIONISTAS.Text := opendlg.FileName;

end;

procedure TfrmImportaSimulador.FormShow(Sender: TObject);
begin
  inherited;
  dtDataRef.Text         := DateToStr(date);
  lblProcessando.Visible := True;
end;

procedure TfrmImportaSimulador.bbtnImportarClick(Sender: TObject);
begin
  inherited;
  memErros.Lines.Clear;
  memErros.Lines.Add('Erros Ocorridos durante a Importação : ');
  GeraImportacaoATIVOS;
  GeraImportacaoASSISTIDOS;
  GeraImportacaoPENSIONISTAS;

  if Trim(edReservas.Text) <> ''
  then ImportaReservas;

  MsgDlg('Término da importação dos arquivos.','Informação', mtInformation, [mbOK],0);

end;

procedure TfrmImportaSimulador.sbtnReservasClick(Sender: TObject);
begin
  inherited;
  if opendlg.Execute
  then edReservas.Text := opendlg.FileName;

end;

end.



