unit USistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  registry, uString, shellapi, consts;


type
    TTipoServidor = (tsLocal, tsRemoto);
    TSistema = class
    private
       { Private declarations }
       fSuperUsuario,
       FPedeLogin,
       FFezLogin,
       FSeqCliente,
       FSeqServidor,
       FConectaRemoto,
       FUsaRAD, FUsaPlanoPatro : Boolean;
       fIdModulo,
       FIdiomaAtivo : SmallInt;
       fIdUsuario,
       fIdEmpresa,
       fIdEspAcesso,
       FIdRad : LongInt;
       fNomeUsuario,
       fNomeEmpresa,
       fRazaoSocial,
       fNomeFantasia,
       fNumDocEmpresa,
       fNomeModulo,
       fNomeAplicativo,
       fVersao,
       fDriverServidor,
       fDriverServidorRemoto,
       fOwnerServidor,
       fOwnerServidorRemoto,
       fAliasServidor,
       fAliasServidorRemoto,
       fTempPath,
       FDirVersao,
       FUltScript,
       FDirSys : String;
       fNomeDPL,
       fVersaoDPL,
       fDataDPL,
       fArqDPL : TStringList;
       fSoUpperPessoa :Boolean;
       fUsaEnderecoPessoa :Boolean;

       Registry: TRegistry;
       Key: String;

       function GetNomeCompleto: String;
       procedure SetNomeModulo(n: String);
       procedure SetIdiomaAtivo(n: smallint);
       function GetIdiomaAtivo : smallint;
       function DiretorioVersao : string;

  protected
    { Protected declarations }
  public
    { Public declarations }

    { Variaveis de Controle de Acesso}
    property IdUsuario: LongInt read FIdUsuario write FIdUsuario;
    property NomeUsuario: string read FNomeUsuario write FNomeUsuario;
    property NomeModulo: string read FNomeModulo write SetNomeModulo;
    property NomeAplicativo: string read FNomeAplicativo write FNomeAplicativo;

    property IdModulo: SmallInt read fIdModulo write fIdModulo;
    property Versao: String read fVersao write fVersao;
    property VersaoDPL: TStringList read fVersaoDPL;
    property NomeDPL: TStringList read fNomeDPL;
    property DataDPL: TStringList read fDataDPL;
    property ArqDPL: TStringList read fArqDPL;
    property DirVersao: String read fDirVersao;
    property DirSys: String read fDirSys;

    property PedeLogin: boolean read FPedeLogin write FPedeLogin;
    property FezLogin: boolean read FFezLogin write FFezLogin;

    property SuperUsuario: Boolean read FSuperUsuario write FSuperUsuario;
    property UsaPlanoPatro: Boolean read FUsaPlanoPatro write FUsaPlanoPatro;
    property IdEspAcesso: Integer read FIdEspAcesso write FIdEspAcesso;
    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;
    property NomeEmpresa: string read FNomeEmpresa write FNomeEmpresa;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property NomeFantasia: string read fNomeFantasia write fNomeFantasia;
    property NumDocEmpresa: string read fNumDocEmpresa write fNumDocEmpresa;

    property UsaRAD: boolean read FUsaRAD write FUsaRAD;
    property IdRAD: integer read FIdRAD write FIdRAD;

    property NomeCompleto: String read GetNomeCompleto;

    property DriverServidor: String read fDriverServidor;
    property DriverServidorRemoto: String read fDriverServidorRemoto;
    property AliasServidor: String read fAliasServidor;
    property AliasServidorRemoto: String read fAliasServidorRemoto;
    property PrefixoServidor: String read fOwnerServidor;
    property PrefixoServidorRemoto: String read fOwnerServidorRemoto;
    property TempDir: String read fTempPath;

    // Controle de AcessoRemoto
    property ConectaRemoto: boolean read FConectaRemoto write FConectaRemoto;

    //Indica se no cadastro de pessoa os campos NOME e RAZAOSOCIAL serão inclusos sempre com Caixa Alta
    property SoUpperPessoa: boolean     read fSoUpperPessoa     write fSoUpperPessoa;
    property UsaEnderecoPessoa: boolean read fUsaEnderecoPessoa write fUsaEnderecoPessoa;

    property UltScript: String          read FUltScript         write FUltScript;

    property IdiomaAtivo: smallint read FIdiomaAtivo write SetIdiomaAtivo;

    function GetInfoServidor: Boolean;
    function PegaValor( sChave, sDefault : string) : string;
    function ColocaValor( sChave, sValor : string) : boolean;

    constructor Create;
    destructor Destroy; override;

    function GetGlobalRegString(Item: String; var Value: String): Boolean;
    function GetGlobalRegInteger(Item: String; var Value: Integer): Boolean;
    function GetGlobalRegFloat(Item: String; var Value: Double): Boolean;
    function GetGlobalRegBoolean(Item: String; var Value: Boolean): Boolean;
    function GetGlobalRegDateTime(Item: String; var Value: TDateTime): Boolean;

    function GetRegString(SubKey: String; Item: String; var Value: String): Boolean;
    function GetRegInteger(SubKey: String; Item: String; var Value: Integer): Boolean;
    function GetRegFloat(SubKey: String; Item: String; var Value: Double): Boolean;
    function GetRegBoolean(SubKey: String; Item: String; var Value: Boolean): Boolean;
    function GetRegDateTime(SubKey: String; Item: String; var Value: TDateTime): Boolean;

    function GetServidorParams(TipoServidor : TTipoServidor; var ListaNomes, ListaValores : TStringList): Boolean;

    function VersaoOk : boolean;
    function DPLOk : boolean;
  published
    { Published declarations }

  end;
  const N_DPL = 11;
  aDPL : array[0..N_DPL] of string =
         ( 'CMCompo.dpl' , 'CMForms.dpl', 'CobrCM.dpl' , 'cmback.dpl' , 'parser.dpl' ,
           'regra.dpl'   , 'pprcl.dpl', 'ppch.dpl' , 'ppdsgnr.dpl', 'CM1Class.dpl',
           'ppbde.dpl', 'ppdbchrt.dpl' );

function ShellExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;

function ExecuteFile(const NomedoArquivo, Params: String; EsperaTerminar, MostraJanela : boolean): word;
function CriaDiretorio(Dir:string) : boolean;
function DestroiDiretorio(Dir:string) : boolean;
procedure AbreItemMenu(ItemMenu : String);

var
   Sistema : TSistema;

implementation
uses uMensErro, uDataBase, dBaseDados, menus, filectrl, uVersoes;

constructor  TSistema.Create;
var i : integer;
begin
     inherited Create;
     // Atualiza Versões das bibliotecas
     fVersaoDPL := TStringList.Create;
     fNomeDPL   := TStringList.Create;
     fDataDPL   := TStringList.Create;
     fArqDPL    := TStringList.Create;

     FUsaPlanoPatro := False;

     for i := 0 to V_DPL do
     begin
          fNomeDPL.Add(V_BIBLIOTECAS[i, NOME_DPL]);
          fVersaoDPL.Add(V_BIBLIOTECAS[i, VERSAO_DPL]);
          fDataDPL.Add(V_BIBLIOTECAS[i, DATA_DPL]);
          fArqDPL.Add(V_BIBLIOTECAS[i,PROJETO_DPL]);
     end;

     Registry := TRegistry.Create;
     Registry.RootKey := HKEY_CURRENT_USER;
     fIdEmpresa := -1;
     fSoUpperPessoa := false;
     fUsaEnderecoPessoa := false;
     FPedeLogin := true;
     FFezLogin := false;
     fTempPath := cmGetTempPath;
     FDirVersao := DiretorioVersao;
     FIdRad := 0;

     FDirSys := cmGetSysPath+'\';
     FIdiomaAtivo := GetIdiomaAtivo;
     { Configura o formato Data-Hora do sistema}
     Application.UpdateFormatSettings := False;

     ShortDateFormat := 'dd/mm/yyyy';

     ShortMonthNames[1]  := 'Jan';
     ShortMonthNames[2]  := 'Fev';
     ShortMonthNames[3]  := 'Mar';
     ShortMonthNames[4]  := 'Abr';
     ShortMonthNames[5]  := 'Mai';
     ShortMonthNames[6]  := 'Jun';
     ShortMonthNames[7]  := 'Jul';
     ShortMonthNames[8]  := 'Ago';
     ShortMonthNames[9]  := 'Set';
     ShortMonthNames[10] := 'Out';
     ShortMonthNames[11] := 'Nov';
     ShortMonthNames[12] := 'Dez';

     LongMonthNames[1]  := 'Janeiro';
     LongMonthNames[2]  := 'Fevereiro';
     LongMonthNames[3]  := 'Março';
     LongMonthNames[4]  := 'Abril';
     LongMonthNames[5]  := 'Maio';
     LongMonthNames[6]  := 'Junho';
     LongMonthNames[7]  := 'Julho';
     LongMonthNames[8]  := 'Agosto';
     LongMonthNames[9]  := 'Setembro';
     LongMonthNames[10] := 'Outubro';
     LongMonthNames[11] := 'Novembro';
     LongMonthNames[12] := 'Dezembro';

     ShortDayNames[1] := 'Dom';
     ShortDayNames[2] := 'Seg';
     ShortDayNames[3] := 'Ter';
     ShortDayNames[4] := 'Qua';
     ShortDayNames[5] := 'Qui';
     ShortDayNames[6] := 'Sex';
     ShortDayNames[7] := 'Sab';

     LongDayNames[1]  := 'Domingo';
     LongDayNames[2]  := 'Segunda';
     LongDayNames[3]  := 'Terça';
     LongDayNames[4]  := 'Quarta';
     LongDayNames[5]  := 'Quinta';
     LongDayNames[6]  := 'Sexta';
     LongDayNames[7]  := 'Sábado';

     FSeqCliente    := false;
     FSeqServidor   := false;
     FConectaRemoto := false;
     FUsaRAD        := false;
     FUltScript     := '';
end;

destructor TSistema.Destroy;
begin
     Registry.free;
     fVersaoDPL.free;
     fNomeDPL.free;
     fDataDPL.free;
     fArqDPL.free;
     inherited Destroy;
end;

procedure TSistema.SetNomeModulo(n : String);
begin
     if fNomeModulo <> n then
     begin
        fNomeModulo := n;
     end;
     GetInfoServidor;
end;

procedure TSistema.SetIdiomaAtivo(n : smallint);
begin
     if FIdiomaAtivo <> n then
     begin
          FIdiomaAtivo := n;
          with Registry do
          begin
               OpenKey('Software\CM', True);
               WriteInteger('Idioma ativo', n);
               CloseKey;
          end;
     end;
end;

function TSistema.PegaValor( sChave, sDefault : string) : string;
begin
     sChave := AnsiLowerCase(sChave);
     sDefault := AnsiLowerCase(sDefault);
     if FazQuery( dtmBaseDados.qry, 'SELECT VALOR FROM '+ PrefixoServidor+'AMBIENTE WHERE (CHAVE='''+sChave+''')') then
        Result := dtmBaseDados.qry.fieldbyname('VALOR').AsString
     else
     begin
          ExecutarQuery( dtmBaseDados.qry, 'INSERT INTO '+PrefixoServidor+'AMBIENTE (CHAVE, VALOR) VALUES('''+sChave+''', '''+sDefault+''')');
          Result := sDefault;
     end;
end;

function TSistema.ColocaValor( sChave, sValor : string) : boolean;
begin
     sChave := AnsiLowerCase(sChave);
     sValor := AnsiLowerCase(sValor);
     Result := ExecutarQuery( dtmBaseDados.qry, 'UPDATE '+PrefixoServidor+'AMBIENTE SET VALOR = '''+sValor+''' WHERE CHAVE = '''+sChave+'''');
//     dtmBaseDados.dbBaseDados.AplicaUpdates([dtmBaseDados.qry]);
end;

function TSistema.GetIdiomaAtivo : SmallInt;
begin
     with Registry do
     begin
          OpenKey('Software\CM', True);
          try
             Result := ReadInteger('Idioma ativo');
          except
                WriteInteger('Idioma ativo', 1);
                Result := 1;
          end;
          CloseKey;
     end;
end;

function TSistema.GetNomeCompleto: String;
begin
     Result := fNomeModulo + ' v.' + fVersao;
end;

function TSistema.GetInfoServidor: Boolean;
var fParam : string;
begin
     with Registry do
     begin
          OpenKey('Software\CM\'+fNomeModulo, True);
          try
             fDriverServidor := ReadString('Driver Servidor');
             if FDriverServidor = '' then
             begin
                  fDriverServidor := 'ORACLE';
                  WriteString('Driver Servidor', FDriverServidor);
             end;

             fAliasServidor  := ReadString('Alias Servidor');
             if FAliasServidor = '' then
             begin
                  FAliasServidor := 'CM';
                  WriteString('Alias Servidor', FAliasServidor);
             end;

          except
                fDriverServidor := 'ORACLE';
                FAliasServidor  := 'CM';
                WriteString('Driver Servidor', FDriverServidor);
                WriteString('Alias Servidor', FAliasServidor);
          end;
          CloseKey;

          OpenKey('\Software\CM\'+fNomeModulo+'\Parametros Servidor', True);
          try
             fParam := ReadString('LANGDRIVER');
             if fParam = '' then
                WriteString('LANGDRIVER','BLLT1PT0');
          except
                WriteString('LANGDRIVER','BLLT1PT0');
          end;
          CloseKey;

          if CompareText(fDriverServidor, 'ORACLE') = 0 then
             fOwnerServidor := 'CM.'
          else
              fOwnerServidor := '';

          OpenKey('Software\CM\'+fNomeModulo, True);
          try
             fDriverServidorRemoto := ReadString('Driver Servidor Remoto');
             if fDriverServidorRemoto = '' then
             begin
                  fDriverServidorRemoto := 'ORACLE';
                  WriteString('Driver Servidor Remoto', fDriverServidorRemoto);
             end;

             fAliasServidorRemoto  := ReadString('Alias Servidor Remoto');
             if fAliasServidorRemoto = '' then
             begin
                  fAliasServidorRemoto := 'CM';
                  WriteString('Alias Servidor Remoto', fAliasServidorRemoto);
             end;

          except
                  fDriverServidorRemoto := 'ORACLE';
                  fAliasServidorRemoto := 'CM';
                  WriteString('Driver Servidor Remoto', fDriverServidorRemoto);
                  WriteString('Alias Servidor Remoto', fAliasServidorRemoto);
          end;
          CloseKey;

          OpenKey('\Software\CM\'+fNomeModulo+'\Parametros Servidor Remoto', True);
          try
             fParam := ReadString('LANGDRIVER');
             if fParam = '' then
                WriteString('LANGDRIVER','BLLT1PT0');
          except
                WriteString('LANGDRIVER','BLLT1PT0');
          end;
          CloseKey;

          if CompareText(fDriverServidorRemoto, 'ORACLE') = 0 then
             fOwnerServidorRemoto := 'CM.'
          else
              fOwnerServidorRemoto := '';
     end;
     Result := true;
end;

function TSistema.GetGlobalRegString(Item: String; var Value: String): Boolean;
begin
     Result := False;
     Key := 'Software\CM';
     if Registry.OpenKey(Key, False) then
     begin
     	  if Registry.ValueExists(Item) then
          begin
	       Value := Registry.ReadString(Item);
	       Result := True;
          end
          else
              ShowMessage('Chave: '+ Item +' não encontrada');
     end
     else
         ShowMessage('Chave: '+ Key+' não encontrada');
     Registry.CloseKey;
end;

function TSistema.GetGlobalRegInteger(Item: String; var Value: Integer): Boolean;
begin
	Result := False;
	Key := 'Software\CM';
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadInteger(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetGlobalRegFloat(Item: String; var Value: Double): Boolean;
begin
	Result := False;
	Key := 'Software\CM';
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadFloat(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetGlobalRegBoolean(Item: String; var Value: Boolean): Boolean;
begin
	Result := False;
 	Key := 'Software\CM';
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadBool(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetGlobalRegDateTime(Item: String; var Value: TDateTime): Boolean;
begin
	Result := False;
 	Key := 'Software\CM';
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadDateTime(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetRegString(SubKey: String; Item: String; var Value: String): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadString(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetRegInteger(SubKey: String; Item: String; var Value: Integer): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadInteger(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetRegFloat(SubKey: String; Item: String; var Value: Double): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadFloat(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetRegBoolean(SubKey: String; Item: String; var Value: Boolean): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReadBool(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;

function TSistema.GetRegDateTime(SubKey: String; Item: String; var Value: TDateTime): Boolean;
begin
	Result := False;
 	Key := 'Software\CM\'+fNomeModulo;
	if not (SubKey = '') then Key := Key+'\'+SubKey;
		if Registry.OpenKey(Key, False) then begin
			if Registry.ValueExists(Item) then begin
				Value := Registry.ReaddateTime(Item);
				Result := True;
         end
         else ShowMessage('Chave: '+ Item +' não encontrada');
		end
      else ShowMessage('Chave: '+ Key+' não encontrada');
   Registry.CloseKey;
end;


function TSistema.GetServidorParams(TipoServidor : TTipoServidor; var ListaNomes, ListaValores : TStringList): Boolean;
var i : integer;
    sufxServidor : string;
begin
     if TipoServidor = tsRemoto then
        sufxServidor := ' Remoto'
     else
         sufxServidor := '';
     ListaNomes.Clear ;
     ListaValores.Clear ;
     Key := 'Software\CM\'+fNomeModulo+'\Parametros Servidor'+sufxServidor;
     if Registry.OpenKey(Key, False) then
     begin
          Registry.GetValueNames(ListaNomes);
          for i := 0 to ListaNomes.count-1 do
              ListaValores.Add(Registry.ReadString(ListaNomes[i]));
          Result := true;
          Registry.CloseKey;
     end
     else
          Result := false;
end;

function ShellExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir: array[0..255] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, nil,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;


function TSistema.VersaoOk : boolean;
begin
     Result := true;
     if FDirVersao <> '' then
     begin
          if not FileExists(FDirVersao+ExtractFileName(Application.ExeName)) then
             //MsgDlg('Não encontrei o arquivo '+FDirVersao+ExtractFileName(Application.ExeName), 'Atualização de versão', mtWarning, [mbOk], 0)
          else
          begin
               if FileAge(FDirVersao+ExtractFileName(Application.ExeName)) > FileAge(Application.ExeName) then
               begin
                    if MsgDlg('Existe uma versão mais recente do Módulo: '+AnsiUpperCase(Sistema.NomeAplicativo) + #10#13+
                              'Deseja atualizar agora?', 'Atualização de Versão', mtConfirmation ,[mbYes, mbNo],0) = mrYes then
                    begin
                         ExecuteFile(FDirVersao+'AtuVersaoCM', FDirVersao+' '+ParamStr(0), false, true);
                         Result := false;
                    end;
               end;
               if not DPLOk then
               begin
                     if MsgDlg( 'Existe uma versão mais recente das bibliotecas CM'+ #10#13+
                                'Deseja atualizar agora?', 'Atualização de Versão', mtConfirmation ,[mbYes, mbNo],0) = mrYes then
                     begin
                          ExecuteFile(FDirVersao+'AtuVersaoCM', FDirVersao+' '+ParamStr(0), false, true);
                          Result := false;
                     end;
               end;
          end;
     end;
end;

function TSistema.DPLOk : boolean;
var i : integer;
begin
     i := 0;
     Result := true;
     while (i <= N_DPL) and (Result) do
     begin
          if not FileExists(FDirVersao+aDPL[i]) then
             //MsgDlg('Não encontrei o arquivo '+FDirVersao+aDPL[i], 'Atualização de versão', mtWarning, [mbOk], 0)
          else
          begin
               if FileAge(FDirVersao+aDPL[i]) > FileAge(FDirSys+aDPL[i]) then
                  Result := false;
          end;
          Inc(i);
     end;
end;

function TSistema.DiretorioVersao : string;
begin
     with Registry do
     begin
          OpenKey('Software\CM', True);
          Result := ReadString('Diretorio Versao');
          if Result = '' then
             WriteString('Diretorio Versao', '')
          else
              if Copy(Result,Length(Result),1) <> '\' then
                 Result := Result+'\';
          CloseKey;
     end;
end;

function CriaDiretorio(Dir:string) : boolean;
var TempDir : string;
    ListaBarra : TStringList;
    lFim : boolean;
    iPos, AtuPos, UltPos : integer;
begin
     ListaBarra := TStringList.Create;
     TempDir := Dir;
     lFim := false;
     UltPos := 0;
     Result := false;
     while not lFim do
     begin
          iPos := Pos('\',TempDir);
          if iPos = 0 then
          begin
               lFim := true;
          end
          else
          begin
                TempDir := Copy(TempDir,iPos+1,100);
                UltPos := UltPos+iPos;
                ListaBarra.Add(IntToStr(UltPos));
          end;
     end;

     TempDir := Dir;
     lFim := false;
     AtuPos := ListaBarra.Count-1;
     while not lFim do
     begin
          if not CreateDir(TempDir) then
          begin
               if AtuPos = 0 then
               begin
                    Result := false;
                    lFim := true;
               end
               else
               begin
                    TempDir := Copy(TempDir,1,StrToInt(ListaBarra[AtuPos]));
                    Dec(AtuPos);
               end;
          end
          else
              if TempDir = Dir then
              begin
                   Result := true;
                   lFim := true;
              end
              else
              begin
                   TempDir := Dir;
                   AtuPos := ListaBarra.Count-1;
              end;
     end;
     ListaBarra.free;
end;

function DestroiDiretorio(Dir:string) : boolean;
var
   ArqLista : TSearchRec;
begin
     Result := true;
     if (copy(Dir, length(Dir), 1) <> '\') and (copy(Dir, length(Dir), 1) <> '/') then
        Dir := Dir + '\';
     if directoryexists(Dir) then
     begin
          // Apaga os subdiretorios
          FindFirst(Dir+'*.*', faDirectory, ArqLista);
          repeat
                if (ArqLista.Name <> '.') and (ArqLista.Name <> '..') and
                   (ArqLista.Attr and faDirectory > 0) then
                   DestroiDiretorio(Dir+ArqLista.Name);
                Application.ProcessMessages;
          until (FindNext(ArqLista) <> 0);
          FindClose(ArqLista);

          FindFirst(Dir+'*.*', faAnyFile, ArqLista);
          repeat
                DeleteFile(Dir+ArqLista.Name);
                Application.ProcessMessages;
          until (FindNext(ArqLista) <> 0);
          FindClose(ArqLista);
          SetCurrentDir(Sistema.TempDir);
          RemoveDir(Dir);
          Application.ProcessMessages;
     end;
end;

function ExecuteFile(const NomedoArquivo, Params: String; EsperaTerminar, MostraJanela : boolean): word;
var
   CmdLine: String;
   StartupInfo: TStartupInfo;
   ProcessInfo: TProcessInformation;
begin
     Result := 0;
     CmdLine := '"'+NomeDoArquivo+'"' + ' ' + Params ;
     FillChar (StartupInfo, SizeOf(StartupInfo), 0);
     StartupInfo.cb := SizeOf(StartupInfo);
     StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
     if MostraJanela then
        StartupInfo.wShowWindow := SW_SHOW
     else
        StartupInfo.wShowWindow := SW_MINIMIZE;

     if not CreateProcess(nil, PChar(CmdLine), nil, nil, False, 0, nil, nil,StartupInfo, ProcessInfo) then
     begin
          ShowMessage('Erro na execução do arquivo '+NomedoArquivo);
          Exit;
     end;
     with ProcessInfo do
     begin
          { Don't need the thread handle, so close it now }
          CloseHandle (hThread);
          if EsperaTerminar then
          { Wait until the process returns, but still process any messages that arrive. }
          repeat
                { Process any pending messages first because MsgWaitForMultipleObjects
                (called below) only returns when *new* messages arrive }
                Application.ProcessMessages;
                //ShowMessage(IntToStr(MsgWaitForMultipleObjects(1, hProcess, False, INFINITE, QS_ALLINPUT)));
                GetExitCodeProcess(hProcess, ExitCode);
                if (ExitCode <> STILL_ACTIVE) and (ExitCode <> STATUS_WAIT_0) then
                begin
                     Result := ExitCode;
                end;
          until ExitCode <> STILL_ACTIVE;
          { Then close the process handle }
          CloseHandle (hProcess);
    end;
end;

procedure AbreItemMenu(ItemMenu : String);
begin
     TMenuItem(Application.MainForm.FindComponent(ItemMenu)).Click;
end;

end.


