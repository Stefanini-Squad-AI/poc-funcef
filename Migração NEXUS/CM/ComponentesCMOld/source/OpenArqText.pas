unit OpenArqText;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Wwquery,Db, DBTables;

type
  TLinha = array[1..255] of char;
  TOpenArqText = class(TOpenDialog)
  private
    { Private declarations }
    function ArquivoOK : boolean;
    procedure LerTamArquivo;
  protected
    { Protected declarations }
    qryCampos,             { qry na tabela CampoArq }
    qryHeader   : TwwQuery;{ qry na tabela Header }
    bEOF        : boolean; { se Eof = true }
    bArqAberto  : boolean; { se arquivo ja foi aberto = true }
    bQryCriada  : boolean; { se as querys auxiliares já foram
                             criadas ou não }
    bArqTestado : boolean; { se arquivo já testado }
    bArqValido  : boolean;

    iIdArq     : integer;  { id do arquivo }
    iIdArqAnt  : integer;
    bytesHeaderLidos,
    bytesHeaderLer,
    bytesLidos,           { bytes lidos por vez }
    bytesLer   : integer;  { bytes a ler por vez }
    sHeader,
    sLinha     : string; { linha atual }
    sArqAnt    : string;
    sLinhaSaida : TLinha; // linha para escrita em arquivo
    sDataBaseName : string;
    FileHandle : Integer;
    buffer : PChar;
    function FormaLinhaSaida : string;     { Escreve a linha de Saída }
  public
    { Public declarations }
    strEscrita : string;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function    Execute: Boolean; override;
    property    EOF : boolean read bEOF;
    function    LeLinha : string;
    function    LeCampo(nomeCampo : string) : string;
    function    LeHeader : string;
    function    EscreveLinha : boolean;
    function    AbreArquivo(cLeituraEscrita : char): boolean;
    procedure   AddCampoSaida(nomeCampo,sConteudo : string);
    procedure CalcBytesHeader;
    procedure CalcBytes;
  published
    { Published declarations }
    property    IdArq : integer read iIdArq write iIdArq;
    property    DataBaseName : string read sDataBaseName write sDataBaseName;
  end;


implementation

// *******************   Métodos Gerais *********************
// Método Create do Objeto
constructor TOpenArqText.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  { Inicializar variaveis }
  bArqAberto := False;
  bQryCriada := False;
  bytesLer := 0;
  bytesLidos := 0;
  bEof := False;
  bArqTestado := False;
  iIdArqAnt := -1;
  sArqAnt := '';
end;

// Método Destroy do Objeto
destructor TOpenArqText.Destroy;
begin
   if bArqAberto then FileClose(fileHandle);
   qryCampos.Free;
   qryHeader.Free;
   inherited Destroy;
end;

// Método Execute do Objeto
// Herda do TOpenDialog mas antes verifica se as propriedades
// DataBaseName e IdArq estão preenchidas
function TOpenArqText.Execute: Boolean;
var i :integer;
begin
     Result := false;
   if Trim(sDataBaseName) = ''
   then begin
      ShowMessage('Nome do banco de dados não preenchido.');
      Abort;
   end;

   if iIdArq <= 0
   then begin
      ShowMessage('Identificador do arquivo não preenchido.');
      Abort;
   end;

   for i := 1 to 255 do sLinhaSaida[i] := ' ';

   { Para executar o open Dialog é necessário que o IdArq esteja
     preenchido }
   inherited Execute;
end;

// Método de Leitura do Tamanho do Arquivo

procedure TOpenArqText.LerTamArquivo;
begin
  { Verificar bytesLidos e bytesLer }
  if (bytesHeaderLidos = 0) or (bytesHeaderLer = 0)
  then  begin
     CalcBytesHeader;
  end;//if

  { Verificar bytesLidos e bytesLer }
  if (bytesLidos = 0) or (bytesLer = 0)
  then  begin
     CalcBytes;
  end;//if
end; // LerTamArquivo


// Método de Teste da validade do arquivo
function TOpenArqText.ArquivoOK : boolean;
begin
  Result := False;

  LerTamArquivo;

  if bytesLer <> bytesLidos
  then Exit;

  if not bArqAberto
  then begin
     FileHandle := FileOpen(FileName, fmOpenRead );
     if FileHandle < 0
     then Exit;
     bArqAberto := True;
     bArqTestado := False;
  end;
  Result := True;
end; // ArquivoOK

function TOpenArqText.AbreArquivo(cLeituraEscrita : char): boolean;
var sLinha : string;
    F: TextFile;
begin
   Result := False;
   { Se o execute retornar Ok :
      - Criar querys com header e campos
      - Ler tamanho a ler
      - Comparar com linha
   }
   if Trim(FileName) = '' then Exit;

   if iIdArq <> iIdArqAnt
   then begin
      bArqTestado := False;
      iIdArqAnt := iIdArq;
   end;

  if sArqAnt <> FileName
  then begin
     bArqTestado := False;
     sArqAnt := FileName;
  end;

   if not bQryCriada
   then begin
      { Criar Query }
      qryCampos := TwwQuery.Create(Application);
      qryCampos.DatabaseName := DataBaseName;

      qryHeader := TwwQuery.Create(Application);
      qryHeader.DatabaseName := DataBaseName;
      bQryCriada := True;
   end;

  { Abrir query Campo e Header }
  with qryCampos do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT C.*, CB.NOMEDOCAMPO AS CAMPOBANCO '+
             ' FROM CAMPOARQ C, CMPBD CB         '+
             ' WHERE C.IDARQ = '+IntToStr(iIdArq)+' AND '+
             '       C.IDCAMPO = CB.IDCAMPO(+) AND      '+
             '       1         = CB.CAMPODOBANCO(+)            '+
             ' ORDER BY C.NUMORDEM ');
     Open;
  end;

  with qryHeader do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT H.*, CB.NOMEDOCAMPO AS CAMPOBANCO '+
             ' FROM HEADER H, CMPBD CB                  '+
             ' WHERE H.IDARQ = '+IntToStr(iIdArq)+' AND '+
             '       H.IDCAMPO = CB.IDCAMPO(+) AND      '+
             '       1         = CB.CAMPODOBANCO(+)            '+
             ' ORDER BY H.NUMORDEMHEAD ');
     Open;
  end;

  LerTamArquivo;

  if cLeituraEscrita = 'L' // Leitura
  then begin
     if not bArqTestado
     then begin
        if not ArquivoOK then Exit;
        if bytesLer = 0 then Exit;
        if bArqAberto then FileClose(fileHandle);
        bArqAberto := False;

        AssignFile(F,FileName);
        Reset(F);
        Readln(F, sLinha);
        CloseFile(F);

        if length(sLinha) <> (bytesLer - 2)
        then Result := False
        else Result := True;
        bArqTestado := True;
        bArqValido  := Result;
     end
     else Result := bArqValido;
  end //end-leitura
  else begin
     bArqTestado := True;
  end; //end-escrita

//  Result := True;
end;

// *******************   Métodos de Leitura *********************
// Método de Leitura de Campo
function TOpenArqText.LeCampo(nomeCampo : string) : string;
var iNumOrdem : integer;
    iPosCampo : integer;
    iTamCampo : integer;
    sCampo    : string;
begin

   with qryCampos do
   begin
      iPosCampo := 1;
      if Locate('CAMPOBANCO',nomeCampo,[loPartialKey])
      then begin
         iNumOrdem := FieldByName('NumOrdem').AsInteger;
         iTamCampo := FieldByName('TamCOLUNA').AsInteger;
         First;
         while iNumOrdem > FieldByName('NumOrdem').AsInteger do
         begin
            iPosCampo := iPosCampo + FieldByName('TamCOLUNA').AsInteger;
            Next;
         end;
         sCampo := Copy(sLinha,iPosCampo,iTamCampo);
      end
      else begin // Campo a Ler nao é um campo do banco
         if Locate('NomeColuna',nomeCampo+' ',[loPartialKey])
         then begin
            iNumOrdem := FieldByName('NumOrdem').AsInteger;
            iTamCampo := FieldByName('TamCOLUNA').AsInteger;
            First;
            while iNumOrdem > FieldByName('NumOrdem').AsInteger do
            begin
               iPosCampo := iPosCampo + FieldByName('TamCOLUNA').AsInteger;
               Next;
            end;
            sCampo := Copy(sLinha,iPosCampo,iTamCampo);
         end;
      end;
   end; //with
   Result := sCampo;
end;

function TOpenArqText.LeLinha : string;
begin

  if not ArquivoOK then Exit;

  { Leitura da linha }
  buffer := AllocMem(bytesLer);

  bytesLidos := FileRead(FileHandle, Buffer^, bytesLer);

  if bytesLidos = bytesLer
  then begin
      sLinha := StrPas(Buffer);
      setlength(sLinha, bytesler-2);
  end
  else begin
    bEof := True;
    sLinha := '';
  end;
  FreeMem(buffer,bytesLer);
  Result := sLinha;
end;

function TOpenArqText.LeHeader : string;
begin

  if not ArquivoOK then Exit;

  { Leitura da linha }

  buffer := AllocMem(bytesHeaderLer);

  bytesHeaderLidos := FileRead(FileHandle, Buffer^, bytesHeaderLer);

  if bytesHeaderLidos = bytesHeaderLer
  then begin
      sHeader := StrPas(Buffer);
      setlength(sHeader, bytesHeaderler-2);
  end
  else begin
    bEof := True;
    sHeader := '';
  end;
  FreeMem(buffer,bytesHeaderLer);
  Result := sHeader;
end;


// *******************   Métodos de Escrita *********************

// Método de escrita do campo na linha
procedure TOpenArqText.AddCampoSaida(nomeCampo, sConteudo : string);

var iNumOrdem : integer;
    iPosCampo : integer;
    iTamCampo,i : integer;
    qrycamp : TwwQuery;
begin

   if Trim(sConteudo) = '' then Exit;
   // Abrir query com campos do arquivo
   qryCamp := TwwQuery.Create(Application);
   qryCamp.DatabaseName := sDataBaseName;

   with qryCamp do
   begin
     SQL.Clear;
     SQL.Add(' SELECT C.*, CB.NOMEDOCAMPO AS CAMPOBANCO '+
             ' FROM CAMPOARQ C, CMPBD CB         '+
             ' WHERE C.IDARQ = '+IntToStr(iIdArq)+' AND '+
             '       C.IDCAMPO = CB.IDCAMPO(+) AND      '+
             '       1         = CB.CAMPODOBANCO(+)            '+
             ' ORDER BY C.NUMORDEM ');
     Open;
      // Localizar a posicao inicial e o tamanho do campo a adicionar
     iPosCampo := 0;
     if Locate('CAMPOBANCO',nomeCampo+' ',[loPartialKey])
     then begin
        iNumOrdem := FieldByName('NumOrdem').AsInteger;
        iTamCampo := FieldByName('TamCOLUNA').AsInteger;

        First;
        while iNumOrdem > FieldByName('NumOrdem').AsInteger do
        begin
           iPosCampo := iPosCampo + FieldByName('TamCOLUNA').AsInteger;
           Next;
        end;

        // Adicionar, a partir da posicao inicial do campo, caracter por caracter
        // da string resultante
        for i := 1 to iTamCampo
        do sLinhaSaida[i+iPosCampo] := sConteudo[i];
     end //if locate
     else begin
        // Se não encontrou a coluna a adicionar como  CAMPOBANCO
        // ou a coluna é um campo do banco e o arquivo está cadastrado
        // erradamente ou a coluna não é um campo do banco. Caso a coluna
        // não seja um campo do banco, procurar o parametro nomeCampo
        // em 'NomeColuna'  da tabela 'CampoArq'
        if Locate('NOMECOLUNA',nomeCampo+' ',[loPartialKey])
        then begin
           iNumOrdem := FieldByName('NumOrdem').AsInteger;
           iTamCampo := FieldByName('TamCOLUNA').AsInteger;

           First;
           while iNumOrdem > FieldByName('NumOrdem').AsInteger do
           begin
              iPosCampo := iPosCampo + FieldByName('TamCOLUNA').AsInteger;
              Next;
           end;

           // Adicionar, a partir da posicao inicial do campo, caracter por caracter
           // da string resultante
           for i := 1 to iTamCampo
           do sLinhaSaida[i+iPosCampo] := sConteudo[i];
        end; //if locate('nomecoluna')
     end;
   end; //with
end;

// Método de escrita na linha de saída
function TOpenArqText.FormaLinhaSaida : string;
var sResult : string;
    i : Integer;
begin
   sResult := '';
   for i := 1 to 255 do
   begin
      sResult := sResult + sLinhaSaida[i];
   end;
   if bytesLer = 0 then Exit;
   sResult := Copy(sResult,1,bytesler);
   Result := sResult;
end;

// Método de escrita da linha no arquivo
function TOpenArqText.EscreveLinha : boolean;
var
   f : textfile;
   sLinhaAEscrever : string;
begin
     Result := false;
     if (not bArqTestado) then Exit;
     sLinhaAEscrever := FormaLinhaSaida;
     try
        assignfile(F,FileName);
        Append(F);
        writeln(F,sLinhaAEscrever);
        closefile(F);
     except
        assignfile(F,FileName);
        ReWrite(F);
        writeln(F,sLinhaAEscrever);
        closefile(F);
     end;
     strEscrita := sLinhaAEscrever;
end;

procedure TOpenArqText.CalcBytesHeader;
var iTamCol : integer;
begin
     with qryHeader do begin
        if RecordCount = 0 then Exit;
        iTamCol := 0;
        First;
        While not Eof do
        begin
          iTamCol := iTamCol + FieldByName('TamCOLUNAHead').AsInteger;
          Next;
        end;//while
        bytesHeaderLer := iTamCol + 2;
        bytesHeaderLidos := bytesHeaderLer;
     end;//with
end;

procedure TOpenArqText.CalcBytes;
var iTamCol : integer;
begin
     with qryCampos do begin
        if RecordCount = 0 then Exit;
        iTamCol := 0;
        First;
        While not Eof do
        begin
          iTamCol := iTamCol + FieldByName('TamCOLUNA').AsInteger;
          Next;
        end;//while
        bytesLer := iTamCol + 2;
        bytesLidos := bytesLer;
     end;//with
end;

end.
