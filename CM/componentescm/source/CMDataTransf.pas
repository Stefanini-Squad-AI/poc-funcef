// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina     : ImportFile
Data       : 19.06.2008
Pendencia  : 28225
Autor      : David Ayrolla
Descrição  : Retiradas exclusões indevidas
---------------------------------------------------------------------------------------------------
Rotina     : GravaBackup
Data       : 06.08.2006
Pendencia  : 17382 - Ajuste
Autor      : Antonio Marcos
Colaborador: Paulo Ramos (otimizou a rotina de backup do autor) 01/08/2007
Descrição  : Otimização de rotina de backup na geração do TransfRelatorio
---------------------------------------------------------------------------------------------------
Rotina    : ImportFile
Data      : 18.08.2006
Pendencia : 17382
Autor     : Antonio Marcos Fernandes de Souza(amf)
Descrição : Retirei do teste de GRUPORELATORIO da função IntegridadeOK
---------------------------------------------------------------------------------------------------
Rotina    : ImportFile
Data      : 07.08.2006
Pendencia : 17382
Autor     : Antonio Marcos Fernandes de Souza(amf)
Descrição : Nova rotina de gravação de AUTORIZA a partir de AUTORIZABACK
---------------------------------------------------------------------------------------------------
Rotina    : ImportFile/RestoreGrants
Data      : 07.07.2006
Pendencia : 17382
Autor     : Antonio Marcos Fernandes de Souza(amf)
Descrição : Alteração da rotina ImportFile para eliminar o bugs que ocorriam na
            autorização.
            Criação da Rotina de restauração dos bkps gerados na importação
            das autorizações.
---------------------------------------------------------------------------------------------------
Rotina    : ImportFile
Data      : 26/03/2004
Pendencia : 15769
Autor     : Marchetti
Descrição : No processo de importação de Autorizações, as mesmas não serão mais deletadas. Apenas serão
            inseridas as novas.
---------------------------------------------------------------------------------------------------
{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit CMDataTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, dbTables, ZipMstr, wwQuery, uSistema, DbClient;

{$I CM.inc}

const
  NumTabelas = 16;
  ImportFileNotFound = $A;
  ConnectionNotFound = $B;
  InvalidPassword = $C;

resourcestring
  sImportFileNotFound = 'Não foi possível encontrar o arquivo para importação' + #13 + #10 + '%s';
  sConnectionNotFound = 'Não foi encontrada a conexão com o Banco de Dados' + #13 + #10 + '%s';
  sInvalidPassword = 'Senha não confere. Não foi possível abrir o arquivo para importação' + #13 + #10 + '%s';

type
  EDataTransfError = class(Exception)
  private
    FFileName: TFileName;
    FMsgId: Integer;
  protected
  public
    constructor Create(const AFileName: string; ID: Integer);
    property FileName: TFileName read FFileName write FFileName;
    property MsgId: Integer read FMsgId write FMsgId;
  end;


  TCMFileTransf = (ftReports, ftDataView, ftGrupoRelatorio, ftConsultas,
    ftAutorizacoes, ftDDTable, ftDDField);

  TCMFileTransfs = set of TCMFileTransf;

  TTransfOperation = (toCreatingFile, toDeletingTable, toFillingQuery, toImportingFile);

  TOnTransfProgress = procedure (const Msg: string; Operation: TTransfOperation;
    StepNum, TotalSteps: Integer) of object;
  TOnRequestLoginDBA = procedure (Sender: TObject; var LoginName,
    Password: string; var Continue: Boolean) of object;
  TOnErrorMessage = procedure (Sender: TObject; sMessage: String) of Object;

  TCMDataTransf = class(TComponent)
  private
    iNumErro: Integer;
    _BaseReports: TDatabase;
    _ZipMaster: TZipMaster;
    _QryFonte: TwwQuery;
    {$IFDEF CM4}
    TabelasFonte: array of string;
    SQLFonte, SQLFonteOld: array of string;
    {$ELSE}
    TabelasFonte: array[0..NumTabelas - 1] of string;
    SQLFonte, SQLFonteOld: array[0..NumTabelas - 1] of string;
    {$ENDIF}
    FStepNum: Integer;
    FTotalSteps: Integer;
    FOperation: TTransfOperation;
    FPrefixoServidor: string;
    FFileTransfs: TCMFileTransfs;
    {$IFDEF CM4}
    FFileName: TFileName;
    {$ENDIF}
    _DBALoginName: string;
    _DBAPassword: string;
    _Continue: Boolean;
    _SenhaInvalida: Boolean;
    FOnTransfProgress: TOnTransfProgress;
    FOnRequestLoginDBA: TOnRequestLoginDBA;
    FDatabaseName: string;
    fOrigemCM: Integer;
    fPassWord :String;
    FOnErrorMessage: TOnErrorMessage;
    procedure SetFileTransfs(const Value: TCMFileTransfs);
    {$IFDEF CM4}
    procedure SetFileName(const Value: TFileName);
    {$ENDIF}
    procedure SetOnTransfProgress(const Value: TOnTransfProgress);
    procedure SetPrefixoServidor(const Value: string);
    procedure SetOnRequestLoginDBA(const Value: TOnRequestLoginDBA);
    procedure SetDatabaseName(const Value: string);
    procedure ZipMasterMessage(Sender: TObject;
              ErrCode: Integer; sMessage: String);
    procedure SetOnErrorMessage(const Value: TOnErrorMessage);
  protected
    WorkingDir: string;
    procedure InternalInit;
    procedure InternalFree;
    procedure DoTransfProgress(const Msg: string);
    procedure DoRequestLoginDBA;
    procedure DoOnErrorMessage(Sender: TObject; sMessage: String);
    //Métodos para Importação do Arquivo:
    procedure DeleteTable(const TableName, KeyField: string);
    procedure FillQuery(const TableName: string; qry: TwwQuery; FailOnError: Boolean {$IFDEF CM4} = False {$ENDIF});
  public
    constructor Create(AOwner: TComponent); override;
    function CreateFile(const AFileName: TFileName): Boolean; {$IFDEF CM4} overload;
    function CreateFile: Boolean; overload; {$ENDIF}
    function ImportFile(const AFileName: TFileName): Boolean; {$IFDEF CM4} overload;
    function ImportFile: Boolean; overload; {$ENDIF}
    function RestoreGrants(iIdBack: integer): boolean;
  published
    property DatabaseName: string read FDatabaseName write SetDatabaseName;
    property FileTransfs: TCMFileTransfs read FFileTransfs write SetFileTransfs;
    property OrigemCM: Integer Read fOrigemCM write fOrigemCM;
    property PassWord: String Read fPassWord write fPassWord;
    {$IFDEF CM4}
    property Filename: TFileName read FFileName write SetFileName;
    {$ENDIF}
    property PrefixoServidor: string read FPrefixoServidor write SetPrefixoServidor;
    property OnTransfProgress: TOnTransfProgress read FOnTransfProgress write SetOnTransfProgress;
    property OnRequestLoginDBA: TOnRequestLoginDBA read FOnRequestLoginDBA write SetOnRequestLoginDBA;
    property OnErrorMessage: TOnErrorMessage read FOnErrorMessage write SetOnErrorMessage;
  end;

procedure register;

implementation

uses
  FSM_FxLib, FSM_WinApiLib, Filectrl, uDatabase, uMensErro;

procedure register;
begin
  RegisterComponents('CM 2000',[TCMDataTransf]);
end;

{ TCMDataTransf }

function TCMDataTransf.CreateFile(const AFileName: TFileName): Boolean;
var
  TabelaReports: TTable;
  I, J         : Integer;
  sWhere       : String;
begin
  FOperation := toCreatingFile;
  FTotalSteps := NumTabelas * 2;
  DoTransfProgress('Gerando arquivo de transferencia');
  InternalInit;
  for I := 0 to Pred(NumTabelas) do
  begin
     //Verifica se o relatórió é um relatório válido
     If (((I = 4) Or (I = 15)) And (ftReports In FFileTransfs)) Or
        ((I = 3) And (ftDataView In FFileTransfs)) Or
        ((I = 0) And (ftGrupoRelatorio In FFileTransfs)) Or
        ((I In [5,6,7,8]) And (ftConsultas In FFileTransfs)) Or
        ((I In [9,10,11,12,13,14]) And (ftAutorizacoes In FFileTransfs)) Or
        ((I = 1) And (ftDDTable In FFileTransfs)) Or
        ((I = 2) And (ftDDField In FFileTransfs)) Then
     Begin
        // Criação da tabela
        TabelaReports := TTable.Create(self);
        with TabelaReports do
        begin
          Active := False;
          DatabaseName := _BaseReports.DatabaseName;
          TableName := TabelasFonte[I];
          TableType := ttDefault;
          FieldDefs.Clear;
          //Filtra Somente relatório cadastrados na empresa
          Case I Of
            0: sWhere := ' WHERE ORIGEMCMGR = 0';
            3: sWhere := ' WHERE ORIGEMCMDV = 0';
            4, 15: sWhere := ' WHERE ORIGEMCM = 0';
          Else
            sWhere := '';
          End;

          _QryFonte.Close;
          _QryFonte.SQL.Clear;
          _QryFonte.SQL.Add('SELECT * FROM ' + TabelasFonte[I] + sWhere );
          _QryFonte.Open;

          for J := 0 to Pred(_QryFonte.FieldDefs.Count) do
          begin
            if (UpperCase(Copy(_QryFonte.Fields[J].FieldName, 1, 3)) <> 'TRG') and
              (UpperCase(_QryFonte.Fields[J].FieldName) <> 'TEMPLATEVAR') and
              (UpperCase(_QryFonte.Fields[J].FieldName) <> 'FLGAUDITORIAFRONT') then
              try
                FieldDefs.Add(_QryFonte.FieldDefs[J].name,
                  _QryFonte.FieldDefs[J].DataType,
                  _QryFonte.FieldDefs[J].Size,
                  _QryFonte.FieldDefs[J].Required);
              except
                On E:Exception Do
                  DoOnErrorMessage(self,E.Message);
              end;
          end;
          DoTransfProgress('Gerando arquivo de transferencia');
          IndexDefs.Clear;

          CreateTable;

          // Preenchimento dos dados
          TabelaReports.Open;
          _QryFonte.First;
          while not _QryFonte.EOF do
          begin
            TabelaReports.Append;
            for J := 0 to Pred(_QryFonte.FieldCount) do
              if (UpperCase(Copy(_QryFonte.Fields[J].FieldName, 1, 3)) <> 'TRG') and
                (UpperCase(_QryFonte.Fields[J].FieldName) <> 'TEMPLATEVAR') and
                (UpperCase(_QryFonte.Fields[J].FieldName) <> 'FLGAUDITORIAFRONT') then
              begin
                if (Pos('ORIGEMCM', UpperCase(_QryFonte.Fields[J].FieldName)) = 0) then
                  TabelaReports.FieldByName(_QryFonte.Fields[J].FieldName).Value := _QryFonte.Fields[J].Value
                else
                Begin
                  //Testa o valor do ORIGEMCMGR para a tabela REPORTS no caso de importação entre instâncias
                  If ((I = 4) Or (I = 15)) AND
                     ((UpperCase(_QryFonte.Fields[J].FieldName) = 'ORIGEMCMGR') OR
                      (UpperCase(_QryFonte.Fields[J].FieldName) = 'ORIGEMCMDV')) then
                  Begin
                     If _QryFonte.Fields[J].Value = 0 Then
                       TabelaReports.FieldByName(_QryFonte.Fields[J].FieldName).Value := fOrigemCM
                     Else
                       TabelaReports.FieldByName(_QryFonte.Fields[J].FieldName).Value := _QryFonte.Fields[J].Value;
                  End
                  Else
                     TabelaReports.FieldByName(_QryFonte.Fields[J].FieldName).Value := fOrigemCM;
                End;
              end;
            TabelaReports.Post;
            _QryFonte.Next;
          end;
          DoTransfProgress('Gerando arquivo de transferencia');
          TabelaReports.Close;
          TabelaReports.Free;
        end;
     end
     Else
     Begin
        DoTransfProgress('Gerando arquivo de transferencia');
        DoTransfProgress('Gerando arquivo de transferencia');
     End;
  end;
  _ZipMaster.FSpecArgs.Clear;
  for I := 0 to NumTabelas - 1 do
  begin
    _ZipMaster.FSpecArgs.Add(WorkingDir + TabelasFonte[I] + '.db');
    _ZipMaster.FSpecArgs.Add(WorkingDir + TabelasFonte[I] + '.mb');
  end;
  _ZipMaster.ZipFileName := AFileName;

  If fPassWord = '' Then
     _ZipMaster.AddOptions := [AddMove]
  Else
     _ZipMaster.AddOptions := [AddMove,AddEncrypt];

  _ZipMaster.Password := fPassWord;
  _ZipMaster.Add;
  DoTransfProgress('arquivo gerado');
  InternalFree;
  Result := FileExists(AFileName);
  MsgInfo('Término da gravação');
end;

function TCMDataTransf.ImportFile(const AFileName: TFileName): Boolean;
const
  MSGLOGIN = ' Caso não seja um usuário do banco autorizado desmarque a opção de "Autorização" e solicite o login de um "DBA"';
var
  I, J         : Integer;
  sMensErro, Constraint: string;
  bErroLogin: Boolean;
  DtbConstraint, DtbBaseDados: TDatabase;
  QryConstraint, QryAtualiza, Qry: TwwQuery;

  qryBackCtrl: TwwQuery;

  qryFonte: TwwQuery;
  qrySequence: TwwQuery;
  sSQL: string;
  IdBack: Integer;
  sFieldName: string;
  TabelasBack: array[9..14] of string;

      {***} procedure GravaBackup(IdBackCtrl: integer);
            var

              sSQL: string;
            begin

               DoTransfProgress('Gerando Backup --- ' + TabelasFonte[10]);
               sSQL :=
                 'INSERT INTO OPERACAOBACK (IDBACKCTRL, IDOPERACAO, NOMEOPERACAO) '+
                 'SELECT '+inttostr(IdBackCtrl)+', IDOPERACAO, NOMEOPERACAO FROM OPERACAO ';
               qryFonte.SQL.Text := ssql;
               qryFonte.execsql;

               DoTransfProgress('Gerando Backup --- ' + TabelasFonte[09]);
               sSQL :=
                 'INSERT INTO FUNCAOBACK (IDBACKCTRL, IDFUNCAO, NOMEFUNCAO, IDMODULO, '+
                 'IDFUNCAOPAI) '+
                 'SELECT '+inttostr(IdBackCtrl)+', IDFUNCAO, NOMEFUNCAO, IDMODULO, IDFUNCAOPAI FROM FUNCAO ';
               qryFonte.SQL.Text := ssql;
               qryFonte.execsql;

               DoTransfProgress('Gerando Backup --- ' + TabelasFonte[13]);
               sSQL :=
                 'INSERT INTO OPERFUNCBACK (IDBACKCTRL, IDOPERFUNC, IDMODULO, IDFUNCAO, '+
                 'IDOPERACAO) '+
                 'SELECT '+inttostr(IdBackCtrl)+', IDOPERFUNC, IDMODULO, IDFUNCAO, IDOPERACAO FROM OPERFUNC ';
               qryFonte.SQL.Text := ssql;
               qryFonte.execsql;




               DoTransfProgress('Gerando Backup --- ' + TabelasFonte[12]);
               sSQL :=
                 'INSERT INTO OBJETOBACK (IDBACKCTRL, IDOBJETO, NOMEOBJETO) '+
                 'SELECT '+inttostr(IdBackCtrl)+', IDOBJETO, NOMEOBJETO FROM OBJETO ';
               qryFonte.SQL.Text := ssql;
               qryFonte.execsql;

               DoTransfProgress('Gerando Backup --- AUTORIZABACK');
               sSQL :=
                 'INSERT INTO AUTORIZABACK (IDBACKCTRL, IDESPACESSO, IDOPERFUNC, IDPESSOA) '+
                 'SELECT '+inttostr(IdBackCtrl)+', IDESPACESSO, IDOPERFUNC, IDPESSOA FROM AUTORIZA ';
               qryFonte.SQL.Text := ssql;
               qryFonte.execsql;

               DoTransfProgress('Gerando Backup --- FORMBACK');
               sSQL :=
                 'INSERT INTO FORMBACK (IDBACKCTRL, IDFORM, NOMEFORM, IDMODULO, DESCFORM) '+
                 'SELECT '+inttostr(IdBackCtrl)+', IDFORM, NOMEFORM, IDMODULO, DESCFORM FROM FORM ';
               qryFonte.SQL.Text := ssql;
               qryFonte.execsql;

               DoTransfProgress('Gerando Backup --- FROBFNOPBACK');
               sSQL :=
                 'INSERT INTO FROBFNOPBACK (IDBACKCTRL, IDOPERFUNC, IDOBJETO, IDFORM) '+
                 'SELECT '+inttostr(IdBackCtrl)+', IDOPERFUNC, IDOBJETO, IDFORM FROM FROBFNOP ';
               qryFonte.SQL.Text := ssql;
               qryFonte.execsql;

      {***} end;

      {***} function EncontrouNaOPERFUNC(iIdOperFunc: integer): boolean;
            var
               qryOper: TwwQuery;
            begin
               Result := True;
               qryOper              := TwwQuery.Create(nil);
               qryOper.DatabaseName := FDataBaseName;

               sSQL :=
                 'SELECT OPERFUNC.IDOPERFUNC                '+
                 'FROM OPERFUNC                             '+
                 'WHERE IDOPERFUNC = ' + IntToStr(iIdOPerFunc);
               qryOper.SQL.Text := sSQL;
               qryOper.Open;
               Result := qryOper.RecordCount > 0;

               FreeAndNil(qryOper);
            end;
      {***}

      {***} procedure GravaAutorizaDeAutorizaBack;
            var
               qryBack: TwwQuery;
            begin

              DoTransfProgress('Gravando --- ' + 'AUTORIZA');
              qryBack              := TwwQuery.Create(nil);
              qryBack.DatabaseName := FDataBaseName;

              sSQL :=
                'SELECT AUTORIZABACK.IDESPACESSO, AUTORIZABACK.IDOPERFUNC, '+
                'AUTORIZABACK.IDPESSOA                              '+
                'FROM ' + FPrefixoServidor + 'AUTORIZABACK          '+
                'WHERE AUTORIZABACK.IDBACKCTRL = '+ IntToStr(IdBack);
              qryBack.SQL.Text := sSQL;
              qryBack.Open;

              sSQL :=
                'SELECT AUTORIZA.IDESPACESSO, AUTORIZA.IDOPERFUNC, '+
                'AUTORIZA.IDPESSOA                                 '+
                'FROM ' + FPrefixoServidor + 'AUTORIZA             '+
                'WHERE IDOPERFUNC = -1                             ';
              qryAtualiza.Close;
              qryAtualiza.SQL.Text := sSQL;
              qryAtualiza.Open;

              while (not qryBack.Eof) do
              begin
                 if not EncontrouNaOPERFUNC(qryBack.FieldByName('IDOPERFUNC').AsInteger) then
                 begin
                    qryBack.Next;
                    Continue;
                 end;


                 qryAtualiza.Append;
                 qryAtualiza.FieldByName('IDESPACESSO').AsInteger :=
                   qryBAck.FieldByName('IDESPACESSO').AsInteger;
                 qryAtualiza.FieldByName('IDOPERFUNC').AsInteger :=
                   qryBAck.FieldByName('IDOPERFUNC').AsInteger;
                 qryAtualiza.FieldByName('IDPESSOA').AsInteger :=
                   qryBAck.FieldByName('IDPESSOA').AsInteger;
                 qryAtualiza.Post;

                 qryBack.Next;
              end;
              FreeAndNil(qryBack);
      {***} end;

begin
  Result := False;
  FOperation := toImportingFile;
  FStepNum := 0;
  FTotalSteps := 0;
  DtbBaseDados := Session.FindDatabase(FDatabaseName);
  if DtbBaseDados = nil then
    raise EDataTransfError.Create(FDatabaseName, ConnectionNotFound);
  InternalInit;
  DtbConstraint := TDatabase.Create(Self);
  Qry := TwwQuery.Create(Self);
  QryAtualiza := TwwQuery.Create(Self);
  QryConstraint := TwwQuery.Create(Self);


  TabelasBack[09] := 'FUNCAOBACK';
  TabelasBack[10] := 'OPERACAOBACK';
  TabelasBack[11] := 'FORMBACK';
  TabelasBack[12] := 'OBJETOBACK';
  TabelasBack[13] := 'OPERFUNCBACK';
  TabelasBack[14] := 'FROBFNOPBACK';

  qryBackCtrl              := TwwQuery.Create(nil);
  qryBackCtrl.DatabaseName := FDataBaseName;
  qryBackCtrl.RequestLive  := True;


  qrySequence              := TwwQuery.Create(nil);
  qrySequence.DatabaseName := FDataBaseName;

  qryFonte                 := TwwQuery.Create(nil);
  qryFonte.DataBaseName    := FDataBaseName;


  try
    try
      _SenhaInvalida := False;

      with DtbConstraint do
      begin
        Params.Assign(DtbBaseDados.Params);
        LoginPrompt := False;
        DatabaseName := 'dbnConstraint';
        AliasName := DtbBaseDados.AliasName;
        DriverName := DtbBaseDados.DriverName;
      end;
      with QryAtualiza do
      begin
        DatabaseName := FDatabaseName;
        RequestLive := True;
      end;
      Qry.DatabaseName := FDatabaseName;
      with QryConstraint do
      begin
        DatabaseName := DtbConstraint.DatabaseName;

      end;
      EmptyDir(WorkingDir);

      if FileExists(AFileName) then
      begin
        _ZipMaster.ZipFileName := AFileName;
        _ZipMaster.ExtrBaseDir := WorkingDir;
        _ZipMaster.PassWord := fPassword;
        _ZipMaster.Extract;
      end else
        raise EDataTransfError.Create(AFileName, ImportFileNotFound);

      If _SenhaInvalida Then
         raise EDataTransfError.Create(AFileName, InvalidPassword);

      if not DtbBaseDados.Connected then
        DtbBaseDados.Open;
      DtbBaseDados.StartTransaction;
      Constraint := '';
      sMensErro := 'Erro Ao Conectar com usuário para atualização da Autorização.' + MSGLOGIN;

      if ftAutorizacoes in FFileTransfs then
      begin
        bErroLogin := False;
        DoRequestLoginDBA;
        if (_Continue) and (_DBALoginName <> '') then
        begin
          with DtbConstraint do
          begin
            Params.Values['USER NAME'] := _DBALoginName;
            Params.Values['PASSWORD'] := lowerCase(_DBAPassword);
            try
              Open;
            except
               On E:Exception Do
               Begin
                  sMensErro := FormatErrorMessage(Self,E,sMensErro);
                  bErroLogin := True;
                  DoOnErrorMessage(self,E.Message);
               End;
            end;
          end;
        end;

        if ((bErroLogin) or (not DtbConstraint.Connected)) then
          raise EdataBaseError.Create(sMensErro);



        with QryConstraint do
        begin
          If DtbConstraint.DriverName = 'ORACLE' Then
            if not Sistema.UsuarioUnico then
               SQL.Text := 'SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
                 'WHERE OWNER = ''CM'' AND TABLE_NAME = ''AUTORIZA'' AND R_CONSTRAINT_NAME = ( ' +
                 'SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
                 'WHERE OWNER = ''CM'' AND TABLE_NAME = ''OPERFUNC'' AND CONSTRAINT_TYPE = ''P'')'
            else
               SQL.Text := 'SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
                 'WHERE OWNER = ' + QuotedStr(Sistema.Owner) + ' AND TABLE_NAME = ''AUTORIZA'' AND R_CONSTRAINT_NAME = ( ' +
                 'SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
                 'WHERE OWNER = ' + QuotedStr(Sistema.Owner) + ' AND TABLE_NAME = ''OPERFUNC'' AND CONSTRAINT_TYPE = ''P'')'

          Else
            SQL.Text := 'SELECT CONSTNAME FROM SYSCAT.REFERENCES ' +
              'WHERE TABNAME = ''AUTORIZA'' AND REFTABNAME = ''OPERFUNC'' AND TABSCHEMA = ''CM''';

          Open;
          if not IsEmpty then
          begin
            Constraint := Fields[0].AsString;
            Close;

            If DtbConstraint.DriverName = 'ORACLE' Then
            Begin

            End
            Else
            Begin

            End;
          end;
        end;

        FStepNum := 0;
        FTotalSteps := 5;


        sSQL := 'select seqbackctrl.nextval from dual ';
        qrySequence.Sql.Text := sSQL;
        qrySequence.Open;


        IdBack := qrySequence.FieldByName('NEXTVAL').AsInteger;


        sSQL := 'insert into BACKCTRL (IDBACKCTRL) VALUES (' + IntToStr(IdBack) + ')';
        Qry.SQL.Text := sSQL;
        qry.ExecSQL;



        GravaBackup(IdBack);



        DoTransfProgress('Deletando tabela ' + TabelasFonte[14]);
        ExecutarQuery(qry, 'DELETE ' + TabelasFonte[14]);


        DoTransfProgress('Deletando tabela ' + TabelasFonte[11]);
        ExecutarQuery(qry, 'DELETE ' + TabelasFonte[11]);


        DoTransfProgress('Deletando tabela ' + TabelasFonte[12]);
        ExecutarQuery(qry, 'DELETE ' + TabelasFonte[12]);


        DoTransfProgress('Deletando tabela ' + 'AUTORIZA');
        ExecutarQuery(qry, 'DELETE ' + 'AUTORIZA');


        DoTransfProgress('Deletando tabela ' + TabelasFonte[13]);
        ExecutarQuery(qry, 'DELETE ' + TabelasFonte[13]);


        DoTransfProgress('Deletando tabela ' + TabelasFonte[09]);
        ExecutarQuery(qry, 'DELETE ' + TabelasFonte[09]);


        DoTransfProgress('Deletando tabela ' + TabelasFonte[10]);
        ExecutarQuery(qry, 'DELETE ' + TabelasFonte[10]);


        qryAtualiza.Close;
        qryAtualiza.SQL.Text := SQLFonte[10];
        qryAtualiza.Open;
        FillQuery(TabelasFonte[10], qryAtualiza, True);
        qryAtualiza.Close;


        qryAtualiza.Close;
        qryAtualiza.SQL.Text := SQLFonte[09];
        qryAtualiza.Open;
        FillQuery(TabelasFonte[09], qryAtualiza, True);
        qryAtualiza.Close;


        qryAtualiza.Close;
        qryAtualiza.SQL.Text := SQLFonte[13];
        qryAtualiza.Open;
        FillQuery(TabelasFonte[13], qryAtualiza, True);
        qryAtualiza.Close;


        qryAtualiza.Close;
        qryAtualiza.SQL.Text := SQLFonte[12];
        qryAtualiza.Open;
        FillQuery(TabelasFonte[12], qryAtualiza, True);
        qryAtualiza.Close;


        qryAtualiza.Close;
        qryAtualiza.SQL.Text := SQLFonte[11];
        qryAtualiza.Open;
        FillQuery(TabelasFonte[11], qryAtualiza, True);
        qryAtualiza.Close;


        qryAtualiza.Close;
        qryAtualiza.SQL.Text := SQLFonte[14];
        qryAtualiza.Open;
        FillQuery(TabelasFonte[14], qryAtualiza, True);
        qryAtualiza.Close;

        GravaAutorizaDeAutorizaBack;
      end;

      If (ftGrupoRelatorio in FFileTransfs) Or
         (ftReports in FFileTransfs) Or
         (ftDataView in FFileTransfs) Or
         (ftGrupoRelatorio in FFileTransfs) Then
      Begin
        If Not (ftAutorizacoes in FFileTransfs) Then
        Begin
           bErroLogin := False;
           sMensErro := 'Erro Ao Conectar com usuário para atualização da Autorização.' + MSGLOGIN;
           DoRequestLoginDBA;
           if (_Continue) and (_DBALoginName <> '') then
           begin
             with DtbConstraint do
             begin
               Params.Values['USER NAME'] := _DBALoginName;
               Params.Values['PASSWORD'] := _DBAPassword;
               try
                 Open;
               except
                 On E:Exception Do
                 Begin
                   sMensErro := FormatErrorMessage(Self,E,sMensErro);
                   bErroLogin := True;
                   DoOnErrorMessage(self,E.Message);
                 End;
               end;
             end;
           end;
           if ((bErroLogin) or (not DtbConstraint.Connected)) then
             raise EdataBaseError.Create(sMensErro);
        End;


        with QryConstraint do
        begin
          If DtbConstraint.DriverName = 'ORACLE' Then
            if not Sistema.UsuarioUnico then
               SQL.Text := 'SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
               ' WHERE OWNER = ''CM'' AND TABLE_NAME = ''USUXRELXEMP'' AND R_CONSTRAINT_NAME = ( ' +
               ' SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
               ' WHERE OWNER = ''CM'' AND TABLE_NAME = ''REPORTS'' AND CONSTRAINT_TYPE = ''P'') '
            else
               SQL.Text := 'SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
               ' WHERE OWNER = ' + QuotedStr(Sistema.Owner) + ' AND TABLE_NAME = ''USUXRELXEMP'' AND R_CONSTRAINT_NAME = ( ' +
               ' SELECT CONSTRAINT_NAME FROM ALL_CONSTRAINTS ' +
               ' WHERE OWNER = ' + QuotedStr(Sistema.Owner) + ' AND TABLE_NAME = ''REPORTS'' AND CONSTRAINT_TYPE = ''P'') '

          Else
            SQL.Text := 'SELECT CONSTNAME FROM SYSCAT.REFERENCES ' +
              'WHERE TABNAME = ''USUXRELXEMP'' AND REFTABNAME = ''OPERFUNC'' AND TABSCHEMA = ''CM''';

          Open;
          if not IsEmpty then
          begin
            Constraint := Fields[0].AsString;
            Close;
            If DtbConstraint.DriverName = 'ORACLE' Then
            Begin

              if not Sistema.UsuarioUnico then
              begin
                 if not ExecutarQuery(QryConstraint, 'ALTER TABLE CM.USUXRELXEMP DISABLE CONSTRAINT ' + Constraint) then
                   raise EdataBaseError.Create('Erro Ao Desabilitar Constraint de Autorização de Relatórios.' + MSGLOGIN);
              end;
            End
            Else
            Begin
              if not ExecutarQuery(QryConstraint, '  ALTER TABLE CM.USUXRELXEMP DROP CONSTRAINT ' + Constraint) then
                raise EdataBaseError.Create('Erro Ao Desabilitar Constraint de Autorização de Relatórios.' + MSGLOGIN);
            End;
          end;
        End;
      End;

      if (ftGrupoRelatorio in FFileTransfs) then
      begin
        with QryAtualiza do
        begin

          //Pendência 28225 - David - 19/06/2008
          //DeleteTable('MSWHERE', '');
          //DeleteTable('MSCOLUNAS', '');
          //DeleteTable('MSTABELAS', '');
          //DeleteTable('MONTASELECT', '');
          //DeleteTable('PARAMREPORTS', 'ORIGEMCM');
          //if not Sistema.UsuarioUnico then DeleteTable('REPORTS', 'ORIGEMCM');
          //DeleteTable('DATAVIEW', 'ORIGEMCMDV');
          
          DeleteTable('GRUPORELATORIO', 'ORIGEMCMGR');
          Close;
          SQL.Text := SQLFonte[0];
          Open;
          FillQuery(TabelasFonte[0], QryAtualiza, False);
          Close;
        end;
      end;

      if ftConsultas in FFileTransfs then
      begin
        if not (ftGrupoRelatorio in FFileTransfs) then
        begin
          DeleteTable('MSWHERE', '');
          DeleteTable('MSCOLUNAS', '');
          DeleteTable('MSTABELAS', '');
          DeleteTable('MONTASELECT', '');
        end;

        for I := 5 to 8 do
          with QryAtualiza do
          begin
            Close;
            SQL.Text := SQLFonte[I];
            Open;
            FillQuery(TabelasFonte[I], QryAtualiza, False);
            Close;
          end;
      end;

      if ftDDTable in FFileTransfs then
      begin
        with QryAtualiza do
        begin
          FStepNum := 0;
          FTotalSteps := 1;
          DoTransfProgress('Lendo tabela ' + TabelasFonte[1]);
          ExecutarQuery(qry, 'DELETE DDFIELD');
          ExecutarQuery(qry, 'DELETE DDTABLE');
          Close;
          SQL.Text := SQLFonte[1];
          Open;
          FillQuery(TabelasFonte[1], QryAtualiza, False);
          Close;
        end;
      end;

      if ftDDField in FFileTransfs then
      begin
        with QryAtualiza do
        begin
          if not (ftDDTable in FFileTransfs) then
            ExecutarQuery(qry, 'DELETE DDFIELD');
          Close;
          SQL.Text := SQLFonte[2];
          Open;
          FillQuery(TabelasFonte[2], QryAtualiza, False);
          Close;
        end;
      end;

      if ftDataView in FFileTransfs then
      begin
        with QryAtualiza do
        begin

          if not (ftGrupoRelatorio in FFileTransfs) then
          begin
            //Pendência 28225 - David - 19/06/2008
            //DeleteTable('PARAMREPORTS', 'ORIGEMCM');
            //if not Sistema.UsuarioUnico then DeleteTable('REPORTS', 'ORIGEMCM');
            DeleteTable('DATAVIEW', 'ORIGEMCMDV');
          end;

          Close;
          SQL.Text := SQLFonte[3];
          Open;
          FillQuery(TabelasFonte[3], QryAtualiza, False);
          Close;
        end;
      end;

      if ftReports in FFileTransfs then
      begin
        with QryAtualiza do
        begin

          if (not (ftGrupoRelatorio in FFileTransfs)) and
             (not (ftDataView in FFileTransfs)) then
          Begin
             //Pendência 28225 - David - 19/06/2008
             //DeleteTable('PARAMREPORTS', 'ORIGEMCM');

             if not Sistema.UsuarioUnico then DeleteTable('REPORTS', 'ORIGEMCM');
          End;
          Close;
          SQL.Text := SQLFonte[4];

          {
           Verifica se a nova query esta OK, ou seja: se os campos da nova query já foram
           criados no banco, caso contrério abre a querye velha.
          }
          Try
             Open;
          Except
             On E:Exception Do
             Begin
                DoOnErrorMessage(self,E.Message);
                SQL.Text := SQLFonteOld[4];
                Open;
             End;
          End;

          FillQuery(TabelasFonte[4], QryAtualiza, False);
          Close;

          Close;
          SQL.Text := SQLFonte[15];
          Open;
          FillQuery(TabelasFonte[15], QryAtualiza, False);
          Close;
        end;
      end;



      if ftAutorizacoes in FFileTransfs then
      begin

      end;

      if ftReports in FFileTransfs then
      begin
        if not ExecutarQuery(qry, 'DELETE FROM USUXRELXEMP U WHERE NOT EXISTS (SELECT 1 FROM REPORTS R WHERE U.IDREPORTS = R.IDREPORTS AND U.ORIGEMCM = R.ORIGEMCM)') then
          raise EdataBaseError.Create('Erro Ao Excluir Items da Autorização de Relatórios.');
      end;

      for I := 0 to NumTabelas - 1 do
      begin
        DeleteFile(WorkingDir + TabelasFonte[I] + '.db');
        DeleteFile(WorkingDir + TabelasFonte[I] + '.mb');
      end;

      DtbBaseDados.Commit;
      DoTransfProgress('');
      Result := True;
    except
      On E:Exception Do
      Begin
         DoOnErrorMessage(self,E.Message);

         sMensErro := FormatErrorMessage(Self,E,'Erro Importando Arquivos.');

         if DtbBaseDados.InTransaction then DtbBaseDados.Rollback;

         Result := False;

         if ftAutorizacoes in FFileTransfs then
         begin
           if (Constraint <> '') then
           begin
              if not Sistema.UsuarioUnico then
              begin
              end;
           end;
         end;

         DoTransfProgress('');
         raise EdataBaseError.Create(sMensErro);
      End;
    end;
  finally
    InternalFree;
    DtbConstraint.Free;
    Qry.Free;
    QryAtualiza.Free;
    QryConstraint.Free;

    qryBackCtrl.Free;

    qrySequence.Free;
    qryFonte.Free;

  end;
end;

{$IFDEF CM4}
function TCMDataTransf.ImportFile: Boolean;
begin
  Result := False;
  if FileExists(FFileName) then
    Result := ImportFile(FFileName);
end;

procedure TCMDataTransf.SetFileName(const Value: TFileName);
begin
  FFileName := Value;
end;

function TCMDataTransf.CreateFile: Boolean;
begin
  Result := CreateFile(FFileName);
end;
{$ENDIF}
procedure TCMDataTransf.SetFileTransfs(const Value: TCMFileTransfs);
begin
  FFileTransfs := Value;
end;

constructor TCMDataTransf.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FileTransfs := [ftReports, ftDataView, ftGrupoRelatorio, ftConsultas];
  FPrefixoServidor := 'CM.';
  fOrigemCM := 1;
  fPassWord := '';
  iNumErro := 0;
end;

procedure TCMDataTransf.SetOnTransfProgress(
    const Value: TOnTransfProgress);
begin
  FOnTransfProgress := Value;
end;

procedure TCMDataTransf.DoTransfProgress(const Msg: string);
begin
  if Assigned(FOnTransfProgress) then
    FOnTransfProgress(Msg, FOperation, FStepNum, FTotalSteps);
  Inc(FStepNum);
end;

procedure TCMDataTransf.DeleteTable(const TableName, KeyField: string);
var
  sSel, sFrom, sWhere: string;
begin
  sSel := Format('SELECT ID%s',[TableName]);
  sFrom := Format(' FROM %s ',[TableName]);
  sWhere := Format(' WHERE %s = ' + IntToStr(fOrigemCM),[KeyField]);
  with TwwQuery.Create(self) do
    try
      DatabaseName := FDatabaseName;
      FOperation := toDeletingTable;
      FStepNum := 0;
      SQL.Text := 'SELECT COUNT(*) ' + sFrom;
      if (Trim(KeyField) <> '') then
        SQL.Text := SQL.Text + sWhere;
      Open;
      FTotalSteps := Fields[0].AsInteger;
      Close;
      SQL.Text := sSel + sFrom;
      DoTransfProgress('Verificando tabela ' + TableName);
      if (Trim(KeyField) <> '') then
        SQL.Text := SQL.Text + sWhere;
      RequestLive := True;
      Open;
      while not EOF do
      begin
        try
          Delete;
        except
          On E:Exception Do
          Begin
            DoOnErrorMessage(self,E.Message);
            Next;
          End;
        end;
        DoTransfProgress('Verificando tabela ' + TableName);
      end;
      Close;
    finally
      Free;
    end;
end;

procedure TCMDataTransf.FillQuery(const TableName: string; qry: TwwQuery;
    FailOnError: Boolean);
var
  I       : Integer;
  TblFonte: TTable;


  stlLog: TStringList;
  qryInteg: TQuery;
  sSQLInteg: string;

       {***} function IntegridadeOK(sTableName: string): boolean;
             begin
               Result := True;
               if (TableName = 'FUNCAO')
               or (TableName = 'FORM') then


               begin
                  if (not TblFonte.FieldByName('IDMODULO').IsNull) then
                  begin
                     sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM MODULO WHERE IDMODULO = ' + TblFonte.FieldByName('IDMODULO').AsString;
                     qryInteg.SQL.Text := sSQLInteg;
                     qryInteg.Open;
                     Result := qryInteg.FieldByName('TOTREG').Value > 0;
                  end;
               end
               else if TableName = 'MONTASELECT' then
                    begin
                       if (not TblFonte.FieldByName('IDMODULO').IsNull) then
                       begin
                         sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM MODULO WHERE IDMODULO = ' + TblFonte.FieldByName('IDMODULO').AsString;
                         qryInteg.SQL.Text := sSQLInteg;
                         qryInteg.Open;
                         Result := qryInteg.FieldByName('TOTREG').Value > 0;
                       end;

                       if (not TblFonte.FieldByName('IDMONTASELECT').IsNull) then
                       begin
                         sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM USUXMSXEMP WHERE IDMONTASELECT = ' + TblFonte.FieldByName('IDMONTASELECT').AsString;
                         qryInteg.SQL.Text := sSQLInteg;
                         qryInteg.Open;
                         Result :=  (Result And qryInteg.FieldByName('TOTREG').Value > 0);
                       end;
                    end
               else if TableName = 'REPORTS' then
                    begin
                       if (not TblFonte.FieldByName('IDMODULO').IsNull) then
                       begin
                         sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM MODULO WHERE IDMODULO = ' + TblFonte.FieldByName('IDMODULO').AsString;
                         qryInteg.SQL.Text := sSQLInteg;
                         qryInteg.Open;
                         Result := qryInteg.FieldByName('TOTREG').Value > 0;
                       end;

                       if Result then
                       begin
                         if (not TblFonte.FieldByName('IDGRUPORELATORIO').IsNull) then
                         begin
                            sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM GRUPORELATORIO WHERE IDGRUPORELATORIO = ' + TblFonte.FieldByName('IDGRUPORELATORIO').AsString;
                            qryInteg.SQL.Text := sSQLInteg;
                            qryInteg.Open;
                            Result := qryInteg.FieldByName('TOTREG').Value > 0;
                         end;
                       end;
                    end
               else if TableName = 'OPERFUNC' then
                    begin
                        sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM FUNCAO WHERE IDFUNCAO = ' + TblFonte.FieldByName('IDFUNCAO').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := qryInteg.FieldByName('TOTREG').Value > 0;

                        sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM MODULO WHERE IDMODULO = ' + TblFonte.FieldByName('IDMODULO').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := (Result and qryInteg.FieldByName('TOTREG').Value > 0);

                        sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM OPERACAO WHERE IDOPERACAO = ' + TblFonte.FieldByName('IDOPERACAO').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := (Result and qryInteg.FieldByName('TOTREG').Value > 0);
                    end
               else if TableName = 'FROBFNOP' then
                    begin
                        sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM OPERFUNC WHERE IDOPERFUNC = ' + TblFonte.FieldByName('IDOPERFUNC').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := qryInteg.FieldByName('TOTREG').Value > 0;

                        sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM FORM WHERE IDFORM = ' + TblFonte.FieldByName('IDFORM').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := (Result and qryInteg.FieldByName('TOTREG').Value > 0);

                        sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM OBJETO WHERE IDOBJETO = ' + TblFonte.FieldByName('IDOBJETO').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := (Result and qryInteg.FieldByName('TOTREG').Value > 0);
                    end
               else if  (TableName = 'MSTABELAS')
                     or (TableName = 'MSWHERE')
                     or (TableName = 'MSCOLUNAS') then
                    begin
                        sSQLInteg := 'SELECT COUNT(*) AS TOTREG FROM MONTASELECT WHERE IDMONTASELECT = ' + TblFonte.FieldByName('IDMONTASELECT').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := qryInteg.FieldByName('TOTREG').Value > 0;
                    end
               else if  (TableName = 'PARAMREPORTS') then
                    begin
                        sSQLInteg :=
                          'SELECT COUNT(*) AS TOTREG FROM REPORTS '+
                          'WHERE IDREPORTS = ' + TblFonte.FieldByName('IDREPORTS').AsString + ' AND '+
                          'ORIGEMCM = ' + TblFonte.FieldByName('ORIGEMCM').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := qryInteg.FieldByName('TOTREG').Value > 0;
                    end
               else if  (TableName = 'DATAVIEW') then
                    begin
                        sSQLInteg :=
                          'SELECT COUNT(*) AS TOTREG FROM REPORTS '+
                          'WHERE ORIGEMCMDV = ' + TblFonte.FieldByName('ORIGEMCMDV').AsString;
                        qryInteg.SQL.Text := sSQLInteg;
                        qryInteg.Open;
                        Result := qryInteg.FieldByName('TOTREG').Value > 0;
                    end;

       {***} end;
begin
  FOperation := toFillingQuery;
  FStepNum := 0;
  TblFonte := TTable.Create(self);


  qryInteg := TQuery.Create(nil);
  qryInteg.DatabaseName := DatabaseName;


  stlLog   := TStringList.Create;
  try
    with TblFonte do
    begin
      DatabaseName := _BaseReports.DatabaseName;
      TableType := ttDefault;
    end;
    TblFonte.Close;
    TblFonte.TableName := TableName;
    TblFonte.Open;
    FTotalSteps := TblFonte.RecordCount;
    DoTransfProgress('Lendo tabela ' + TableName);
    TblFonte.First;
    while not TblFonte.EOF do
    begin

      // Somente faz as inserções
      if    (TableName = 'FUNCAO')
         or (TableName = 'OPERACAO')
         or (TableName = 'FORM')
         or (TableName = 'OBJETO')
         or (TableName = 'OPERFUNC')
         or (TableName = 'FROBFNOP') then
      begin
         if (not IntegridadeOK(TableName)) then
         begin
            TblFonte.Next;
            Continue;
         end;

         qry.Append;

         for I := 0 to qry.FieldCount - 1 do
         begin

           if (I <=  Pred(TblFonte.FieldCount)) then
              qry.FieldByName(TblFonte.Fields[I].FieldName).Value := TblFonte.Fields[I].Value;

           stlLog.Add('Tabela Fonte: '+ TableName);
         end;

         try
           qry.Post;
         except
           on e: exception do
           begin
              stlLog.Add('Exeção: '+ DateToStr(now) + ' ' + e.Message);
              for i := 0 to Pred(qry.FieldCount) do
              begin
                 stlLog.Add('Campo: ' + qry.Fields[i].FieldName);
                 stlLog.Add('Valor: ' + (qry.FieldByName(qry.Fields[i].FieldName).AsString));
              end;
              qry.Cancel;
           end;
         end;
      end
      else
      begin

         if (not IntegridadeOK(TableName)) then
         begin
            TblFonte.Next;
            Continue;
         end;

         qry.Append;

         for I := 0 to qry.FieldCount - 1 do
         begin
           qry.FieldByName(TblFonte.Fields[I].FieldName).Value := TblFonte.Fields[I].Value;
         end;

         try
           qry.Post;
         except
           On E:Exception Do
           Begin
             DoOnErrorMessage(self,E.Message);

             if not FailOnError then
             begin
               qry.Edit;
               for I := 0 to TblFonte.FieldCount - 1 do
               begin
                 qry.FieldByName(TblFonte.Fields[I].FieldName).Value := TblFonte.Fields[I].Value;
               end;
               try
                 qry.Post;
               except
                 On E:Exception Do
                 Begin
                   DoOnErrorMessage(self,E.Message);
                   qry.CANCEL;
                 End;
               end;
             end else
               qry.CANCEL;
           End;
         end;

      end;
      DoTransfProgress('Lendo tabela ' + TableName);
      Application.ProcessMessages;
      TblFonte.Next;
    end;
  finally
    //Henrique Massão
    //stlLog.SaveToFile('c:\BackLog'+ FormatDateTime('ddmmyyyy', date) + '.txt');
    stlLog.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\BackLog'+ FormatDateTime('ddmmyyyy', date) + '.txt');

    TblFonte.Free;
    qryInteg.Free;
  end;
end;

procedure TCMDataTransf.InternalInit;
begin
  FStepNum := 0;
  FTotalSteps := 0;
  WorkingDir := GetTmpPath;
  if (WorkingDir <> '') then
  begin
    if AnsiLastChar(WorkingDir) <> '\' then
      WorkingDir := WorkingDir + '\';
    WorkingDir := WorkingDir + 'CMDataTransf\';
  end else
    WorkingDir := 'C:\Temp\CMDataTransf\';
  ForceDirectories(WorkingDir);

  _BaseReports := TDatabase.Create(self);
  with _BaseReports do
  begin
    DatabaseName := 'dbReports';
    DriverName := 'STANDARD';
    LoginPrompt := False;
    Params.Add('PATH=' + WorkingDir);
    Params.Add('DEFAULT DRIVER=PARADOX');
    Params.Add('ENABLE BCD=FALSE');
    SessionName := 'Default';
    Open;
  end;

  _ZipMaster := TZipMaster.Create(self.Owner);
  _ZipMaster.OnMessage := ZipMasterMessage;

  {$IFDEF CM4}
  SetLength(TabelasFonte, NumTabelas);
  SetLength(SQLFonte, NumTabelas);
  SetLength(SQLFonteOld, NumTabelas);
  {$ENDIF}
  TabelasFonte[00] := 'GRUPORELATORIO';
  TabelasFonte[01] := 'DDTABLE';
  TabelasFonte[02] := 'DDFIELD';
  TabelasFonte[03] := 'DATAVIEW';
  TabelasFonte[04] := 'REPORTS';
  TabelasFonte[05] := 'MONTASELECT';
  TabelasFonte[06] := 'MSWHERE';
  TabelasFonte[07] := 'MSCOLUNAS';
  TabelasFonte[08] := 'MSTABELAS';
  TabelasFonte[09] := 'FUNCAO';
  TabelasFonte[10] := 'OPERACAO';
  TabelasFonte[11] := 'FORM';
  TabelasFonte[12] := 'OBJETO';
  TabelasFonte[13] := 'OPERFUNC';
  TabelasFonte[14] := 'FROBFNOP';
  TabelasFonte[15] := 'PARAMREPORTS';

  //Grupo Relatório
  SQLFonte[0] := 'SELECT ' +
    ' GRUPORELATORIO.IDGRUPORELATORIO , ' +
    ' GRUPORELATORIO.DESCRICAO, ' +
    ' GRUPORELATORIO.ORIGEMCMGR ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[0];
  SQLFonteOld[0] := '';

  //Ddtable
  SQLFonte[1] := 'SELECT ' +
    ' DDTABLE.IDDDTABLE, ' +
    ' DDTABLE.TABLENAME, ' +
    ' DDTABLE.TABLEALIAS, ' +
    ' DDTABLE.DESCRICAO ' +
    ' FROM ' +
    FPrefixoServidor + TabelasFonte[1];
  SQLFonteOld[1] := '';

  //DdField
  SQLFonte[2] := 'SELECT ' +
    '    DDFIELD.IDDDFIELD, ' +
    '    DDFIELD.IDDDTABLE, ' +
    '    DDFIELD.FIELDNAME, ' +
    '    DDFIELD.FIELDALIAS, ' +
    '    DDFIELD.SELECTABLE, ' +
    '    DDFIELD.SEARCHABLE, ' +
    '    DDFIELD.SORTABLE, ' +
    '    DDFIELD.DISPLAYFORMAT, ' +
    '    DDFIELD.CAMPODOBANCO, ' +
    '    DDFIELD.CHAVE, ' +
    '    DDFIELD.FLGOBRIGATORIO, ' +
    '    DDFIELD.DESCRICAO, ' +
    '    DDFIELD.TIPOCHAVE, ' +
    '    DDFIELD.TAMANHO, ' +
    '    DDFIELD.TIPODEDADO ' +
    ' FROM ' +
    FPrefixoServidor + TabelasFonte[2];
  SQLFonteOld[2] := '';

  //Dataview
  SQLFonte[3] := ' SELECT ' +
    '   DATAVIEW.NAME, ' +
    '   DATAVIEW.IDDATAVIEW, ' +
    '   DATAVIEW.CLASSNAME, ' +
    '   DATAVIEW.ORIGEMCMDV, ' +
    '   DATAVIEW.CLASSDESCRIPTION, ' +
    '   DATAVIEW.DESCRIPTION, ' +
    '   DATAVIEW.TEMPLATE ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[3];
  SQLFonteOld[3] := '';

  //Reports
  SQLFonte[4] := 'SELECT ' +
    '   REPORTS.NAME, ' +
    '   REPORTS.IDREPORTS, ' +
    '   REPORTS.ORIGEMCM, ' +
    '   REPORTS.IDGRUPORELATORIO, ' +
    '   REPORTS.IDMODULO, ' +
    '   REPORTS.ORIGEMCMGR, ' +
    '   REPORTS.DESCRIPTION, ' +
    '   REPORTS.TEMPLATE, ' +
    '   REPORTS.IDDATAVIEW, ' +
    '   REPORTS.ORIGEMCMDV, ' +
    '   REPORTS.FLGFILTROMANUAL, ' +
    '   REPORTS.FORMEVENTOS, ' +
    '   REPORTS.FORMPARAMREL, ' +
    '   REPORTS.PPREPORT, ' +
    '   REPORTS.FLGTIPO, ' +
    '   REPORTS.FLGEXIBENOPREVIEW  ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[4];

  SQLFonteOld[4] := 'SELECT ' +
    '   REPORTS.NAME, ' +
    '   REPORTS.IDREPORTS, ' +
    '   REPORTS.ORIGEMCM, ' +
    '   REPORTS.IDGRUPORELATORIO, ' +
    '   REPORTS.IDMODULO, ' +
    '   REPORTS.ORIGEMCMGR, ' +
    '   REPORTS.DESCRIPTION, ' +
    '   REPORTS.TEMPLATE, ' +
    '   REPORTS.IDDATAVIEW, ' +
    '   REPORTS.ORIGEMCMDV, ' +
    '   REPORTS.FLGFILTROMANUAL, ' +
    '   REPORTS.FORMEVENTOS, ' +
    '   REPORTS.FORMPARAMREL, ' +
    '   REPORTS.PPREPORT, ' +
    '   REPORTS.FLGTIPO ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[4];


  //MONTASELECT
  SQLFonte[5] := ' SELECT ' +
    '  MONTASELECT.IDMONTASELECT, ' +
    '  MONTASELECT.IDMODULO, ' +
    '  MONTASELECT.IDGRUPO, ' +
    '  MONTASELECT.ORIGEMCM, ' +
    '  MONTASELECT.NOMEMONTASELECT, ' +
    '  MONTASELECT.FLGDISTINCT, ' +
    '  MONTASELECT.CAMPOFILTROEMPRESA, ' +
    '  MONTASELECT.CAMPOFILTROSISTEMA ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[5];
  SQLFonteOld[5] := '';

  //MSWHERE
  SQLFonte[6] := ' SELECT ' +
    '   MSWHERE.IDMSWHERE, ' +
    '   MSWHERE.DESCWHERE, ' +
    '   MSWHERE.IDMONTASELECT ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[6];
  SQLFonteOld[6] := '';

  //MSCOLUNAS
  SQLFonte[7] := ' SELECT ' +
    '   MSCOLUNAS.IDMSCOLUNAS, ' +
    '   MSCOLUNAS.IDMONTASELECT, ' +
    '   MSCOLUNAS.NOMECOLUNA, ' +
    '   MSCOLUNAS.DESCCOLUNA, ' +
    '   MSCOLUNAS.TIPODADO, ' +
    '   MSCOLUNAS.MASCARA, ' +
    '   MSCOLUNAS.FLGCHAVE, ' +
    '   MSCOLUNAS.LARGURA, ' +
    '   MSCOLUNAS.SENSIVELACAIXA ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[7];
  SQLFonteOld[7] := '';

  //MSTABELAS
  SQLFonte[8] := ' SELECT ' +
    '   MSTABELAS.IDMSTABELAS, ' +
    '   MSTABELAS.NOMETABELAS, ' +
    '   MSTABELAS.IDMONTASELECT ' +
    'FROM ' +
    FPrefixoServidor + TabelasFonte[8];
  SQLFonteOld[8] := '';

  SQLFonte[9] := ' SELECT ' +
    '   FUNCAO.IDFUNCAO, ' +
    '   FUNCAO.NOMEFUNCAO, ' +
    '   FUNCAO.IDMODULO, ' +
    '   FUNCAO.IDFUNCAOPAI ' +

    ' FROM ' +
    FPrefixoServidor + TabelasFonte[9];
  SQLFonteOld[9] := '';

  SQLFonte[10] := ' SELECT ' +
    '   OPERACAO.IDOPERACAO, ' +
    '   OPERACAO.NOMEOPERACAO ' +

    ' FROM ' +
    FPrefixoServidor + TabelasFonte[10];
  SQLFonteOld[10] := '';

  SQLFonte[11] := ' SELECT ' +
    '    FORM.IDFORM, ' +
    '    FORM.NOMEFORM, ' +
    '    FORM.IDMODULO, ' +
    '    FORM.DESCFORM ' +

    ' FROM ' +
    FPrefixoServidor + TabelasFonte[11];
  SQLFonteOld[11] := '';

  SQLFonte[12] := ' SELECT ' +
    '    OBJETO.IDOBJETO, ' +
    '    OBJETO.NOMEOBJETO ' +

    ' FROM ' +
    FPrefixoServidor + TabelasFonte[12];
  SQLFonteOld[12] := '';

  SQLFonte[13] := ' SELECT ' +
    '    OPERFUNC.IDOPERFUNC, ' +
    '    OPERFUNC.IDMODULO, ' +
    '    OPERFUNC.IDOPERACAO, ' +
    '    OPERFUNC.IDFUNCAO ' +

    ' FROM ' +
    FPrefixoServidor + TabelasFonte[13];
  SQLFonteOld[13] := '';

  SQLFonte[14] := ' SELECT ' +
    '    FROBFNOP.IDOPERFUNC, ' +
    '    FROBFNOP.IDOBJETO, ' +
    '    FROBFNOP.IDFORM ' +

    ' FROM ' +
    FPrefixoServidor + TabelasFonte[14];
  SQLFonteOld[14] := '';

  SQLFonte[15] := ' SELECT ' +
    '    PARAMREPORTS.IDPARAMREPORTS, ' +
    '    PARAMREPORTS.IDREPORTS, ' +
    '    PARAMREPORTS.IDMONTASELECT, ' +
    '    PARAMREPORTS.ORIGEMCM, ' +
    '    PARAMREPORTS.CAMPOBANCO, ' +
    '    PARAMREPORTS.CAPTION, ' +
    '    PARAMREPORTS.CONTROLE, ' +
    '    PARAMREPORTS.TIPODEDADO, ' +
    '    PARAMREPORTS.LOOKUPSQL, ' +
    '    PARAMREPORTS.LOOKUPCHAVE, ' +
    '    PARAMREPORTS.LOOKUPDISPLAY, ' +
    '    PARAMREPORTS.LOOKUPDESCRICAO, ' +
    '    PARAMREPORTS.LOOKUPTAMANHO, ' +
    '    PARAMREPORTS.CHECKVALUECHECKED, ' +
    '    PARAMREPORTS.CHECKVALUEUNCHECK, ' +
    '    PARAMREPORTS.RADIOITEMS, ' +
    '    PARAMREPORTS.RADIOVALUES, ' +
    '    PARAMREPORTS.RADIOCOLUMNS, ' +
    '    PARAMREPORTS.RADIOITEMINDEX, ' +
    '    PARAMREPORTS.RADIOHEIGHT, ' +
    '    PARAMREPORTS.COMBOSORTED, ' +
    '    PARAMREPORTS.COMBOSTYLE, ' +
    '    PARAMREPORTS.COMBOITEMS, ' +
    '    PARAMREPORTS.COMBODROPCOUNT, ' +
    '    PARAMREPORTS.LISTITEMS, ' +
    '    PARAMREPORTS.LISTMULTISELECT, ' +
    '    PARAMREPORTS.LISTEXTENDSELECT, ' +
    '    PARAMREPORTS.LISTSORTED, ' +
    '    PARAMREPORTS.LISTSTYLE, ' +
    '    PARAMREPORTS.LISTHEIGHT, ' +
    '    PARAMREPORTS.MSLOOKUPKEY, ' +
    '    PARAMREPORTS.MSLOOKUPDISPLAY, ' +
    '    PARAMREPORTS.REQUIRED, ' +
    '    PARAMREPORTS.MOSTRACOMBOCOMPARA, ' +
    '    PARAMREPORTS.TEXTDEFAULT ' +
    ' FROM ' +
    FPrefixoServidor + TabelasFonte[15];
  SQLFonteOld[15] := '';

  _QryFonte := TwwQuery.Create(self);
  _QryFonte.DatabaseName := FDatabaseName;
end;

procedure TCMDataTransf.InternalFree;
{$IFNDEF CM4}
var
  I: Integer;
{$ENDIF}
begin
  _BaseReports.Close;
  _BaseReports.Free;
  _BaseReports := nil;
  _ZipMaster.Free;
  _ZipMaster := nil;
  {$IFDEF CM4}
  SetLength(TabelasFonte, 0);
  SetLength(SQLFonte, 0);
  SetLength(SQLFonteOld, 0);
  {$ELSE}
  for I := 0 to Pred(NumTabelas) do
  begin
    TabelasFonte[i] := '';
    SQLFonte[i] := '';
    SQLFonteOld[i] := '';
  end;
  {$ENDIF}
  _QryFonte.Free;
  EmptyDir(WorkingDir);
  RemoveDir(WorkingDir);
end;

procedure TCMDataTransf.SetPrefixoServidor(const Value: string);
begin
  FPrefixoServidor := Value;
end;

procedure TCMDataTransf.SetOnRequestLoginDBA(
    const Value: TOnRequestLoginDBA);
begin
  FOnRequestLoginDBA := Value;
end;

procedure TCMDataTransf.DoRequestLoginDBA;
begin
  _DBALoginName := '';
  _DBAPassword := '';
  _Continue := True;
  if Assigned(FOnRequestLoginDBA) then
    FOnRequestLoginDBA(self, _DBALoginName, _DBAPassword, _Continue);
end;

procedure TCMDataTransf.SetDatabaseName(const Value: string);
begin
  FDatabaseName := Value;
end;

procedure TCMDataTransf.ZipMasterMessage(Sender: TObject;
  ErrCode: Integer; sMessage: String);
begin
  inherited;
  If Not _SenhaInvalida Then
     _SenhaInvalida := (Pos('bad password',LowerCase(sMessage)) <> 0);
end;

procedure TCMDataTransf.SetOnErrorMessage(const Value: TOnErrorMessage);
begin
  FOnErrorMessage := Value;
end;

procedure TCMDataTransf.DoOnErrorMessage(Sender: TObject;
  sMessage: String);
begin
  Inc(iNumErro);
  If Assigned(FOnErrorMessage) Then FOnErrorMessage(Sender, ' > ' + IntToStr(iNumErro) + ': ' + sMessage);
end;

function TCMDataTransf.RestoreGrants(iIdBack: integer): boolean;
var
   i: integer;
   sSQLBack, sSQLModelo: string;
   qryDel: TwwQuery;
   qryBack: TwwQuery;
   qryModelo: TwwQuery;
   qry: TwwQuery;
   DtbConstraint, DtbBaseDados: TDatabase;
   lstFieldNames: TStringList;
   TabelasBack: array[9..14] of string;


       {***} procedure RestaurarModeloDeAutorizacao(iIdBack: integer);
             begin

               DoTransfProgress('Movendo Backup --- ' + TabelasBack[10]);
               sSQLBack :=
                 'SELECT IDBACKCTRL, IDOPERACAO, NOMEOPERACAO FROM OPERACAOBACK '+
                 'WHERE IDBACKCTRL = ' + IntToStr(iIdBack)                       ;
               qryBack.SQL.Text := sSQLBack;
               qryBack.Open;

               qryModelo.SQL.Text := SQLFonte[10];
               qryModelo.Open;

               while not qryBack.Eof do
               begin
                  qryModelo.Insert;
                  qryModelo.FieldByName('IDOPERACAO').AsInteger :=
                     qryBack.FieldByName('IDOPERACAO').AsInteger;
                  qryModelo.FieldByName('NOMEOPERACAO').AsString :=
                     qryBack.FieldByName('NOMEOPERACAO').AsString;
                  qryModelo.Post;
                  qryBack.Next;
               end;



               sSQLBack :=
                 'SELECT IDBACKCTRL, IDFUNCAO, NOMEFUNCAO, IDMODULO, '+
                 'IDFUNCAOPAI FROM FUNCAOBACK                        '+
                 'WHERE IDBACKCTRL = ' + IntToStr(iIdBack)           ;

               qryBack.SQL.Text := sSQLBack;
               qryBack.Close;
               qryBack.Open;


               DoTransfProgress('Movendo Backup --- ' + TabelasBack[09]);
               qryModelo.SQL.Text := SQLFonte[09];
               qryModelo.Open;

               while not qryBack.Eof do
               begin
                  qryModelo.Insert;
                  qryModelo.FieldByName('IDFUNCAO').AsInteger :=
                     qryBack.FieldByName('IDFUNCAO').AsInteger;
                  qryModelo.FieldByName('NOMEFUNCAO').AsString :=
                     qryBack.FieldByName('NOMEFUNCAO').AsString;
                  qryModelo.FieldByName('IDMODULO').AsInteger :=
                     qryBack.FieldByName('IDMODULO').AsInteger;
                  qryModelo.FieldByName('IDFUNCAOPAI').AsInteger :=
                     qryBack.FieldByName('IDFUNCAOPAI').AsInteger;
                  qryModelo.Post;
                  qryBack.Next;
               end;



               sSQLBack :=
                 'SELECT IDBACKCTRL, IDOPERFUNC, IDMODULO, IDFUNCAO, '+
                 'IDOPERACAO FROM OPERFUNCBACK                       '+
                 'WHERE IDBACKCTRL = ' + IntToStr(iIdBack)           ;
               qryBack.SQL.Text := sSQLBack;
               qryBack.Close;
               qryBack.Open;

               DoTransfProgress('Movendo Backup --- ' + TabelasBack[13]);
               qryModelo.SQL.Text := SQLFonte[13];
               qryModelo.Open;

               while not qryBack.Eof do
               begin
                  qryModelo.Insert;
                  qryModelo.FieldByName('IDOPERFUNC').AsInteger :=
                     qryBack.FieldByName('IDOPERFUNC').AsInteger;
                  qryModelo.FieldByName('IDMODULO').AsInteger :=
                     qryBack.FieldByName('IDMODULO').AsInteger;
                  qryModelo.FieldByName('IDFUNCAO').AsInteger :=
                     qryBack.FieldByName('IDFUNCAO').AsInteger;
                  qryModelo.FieldByName('IDOPERACAO').AsInteger :=
                     qryBack.FieldByName('IDOPERACAO').AsInteger;
                  qryModelo.Post;
                  qryBack.Next;
               end;



               sSQLBack :=
                 'SELECT IDBACKCTRL, IDOBJETO, NOMEOBJETO               '+
                 'FROM OBJETOBACK                                       '+
                 'WHERE IDBACKCTRL = ' + IntToStr(iIdBack)           ;
               qryBack.SQL.Text := sSQLBack;
               qryBack.Close;
               qryBack.Open;

               DoTransfProgress('Movendo Backup --- ' + TabelasBack[12]);
               qryModelo.SQL.Text := SQLFonte[12];
               qryModelo.Open;

               while not qryBack.Eof do
               begin
                  qryModelo.Insert;
                  qryModelo.FieldByName('IDOBJETO').AsInteger :=
                     qryBack.FieldByName('IDOBJETO').AsInteger;
                  qryModelo.FieldByName('NOMEOBJETO').AsString :=
                     qryBack.FieldByName('NOMEOBJETO').AsString;
                  qryModelo.Post;
                  qryBack.Next;
               end;



               sSQLBack :=
                 'SELECT IDBACKCTRL, IDESPACESSO, IDOPERFUNC, IDPESSOA  '+
                 'FROM AUTORIZABACK                                     '+
                 'WHERE IDBACKCTRL = ' + IntToStr(iIdBack)              ;
               qryBack.SQL.Text := sSQLBack;
               qryBack.Close;
               qryBack.Open;

               DoTransfProgress('Movendo Backup ---  AUTORIZABACK ');
               qryModelo.SQL.Text :=
                 'SELECT IDESPACESSO, IDOPERFUNC, IDPESSOA FROM AUTORIZA';
               qryModelo.Open;

               while not qryBack.Eof do
               begin
                  qryModelo.Insert;
                  qryModelo.FieldByName('IDESPACESSO').AsInteger :=
                     qryBack.FieldByName('IDESPACESSO').AsInteger;
                  qryModelo.FieldByName('IDOPERFUNC').AsInteger :=
                     qryBack.FieldByName('IDOPERFUNC').AsInteger;
                  qryModelo.FieldByName('IDPESSOA').AsInteger :=
                     qryBack.FieldByName('IDPESSOA').AsInteger;
                  qryModelo.Post;
                  qryBack.Next;
               end;



               sSQLBack :=
                 'SELECT IDBACKCTRL, IDFORM, NOMEFORM, IDMODULO, DESCFORM '+
                 'FROM FORMBACK                                           '+
                 'WHERE IDBACKCTRL = ' + IntToStr(iIdBack)                ;
               qryBack.SQL.Text := sSQLBack;
               qryBack.Close;
               qryBack.Open;

               DoTransfProgress('Movendo Backup --- ' + TabelasBack[11]);
               qryModelo.SQL.Text := SQLFonte[11];
               qryModelo.Open;

               while not qryBack.Eof do
               begin
                  qryModelo.Insert;
                  qryModelo.FieldByName('IDFORM').AsInteger :=
                     qryBack.FieldByName('IDFORM').AsInteger;
                  qryModelo.FieldByName('NOMEFORM').AsString :=
                     qryBack.FieldByName('NOMEFORM').AsString;
                  qryModelo.FieldByName('IDMODULO').AsInteger :=
                     qryBack.FieldByName('IDMODULO').AsInteger;
                  qryModelo.FieldByName('DESCFORM').AsString :=
                     qryBack.FieldByName('DESCFORM').AsString;
                  qryModelo.Post;
                  qryBack.Next;
               end;

               sSQLBack :=
                 'SELECT IDBACKCTRL, IDOPERFUNC, IDOBJETO, IDFORM             '+
                 'FROM FROBFNOPBACK                                           '+
                 'WHERE IDBACKCTRL = ' + IntToStr(iIdBack)                ;

               qryBack.SQL.Text := sSQLBack;
               qryBack.Close;
               qryBack.Open;

               DoTransfProgress('Movendo Backup --- ' + TabelasBack[14]);
               qryModelo.SQL.Text := SQLFonte[14];
               qryModelo.Open;

               while not qryBack.Eof do
               begin
                  qryModelo.Insert;
                  qryModelo.FieldByName('IDOPERFUNC').AsInteger :=
                     qryBack.FieldByName('IDOPERFUNC').AsInteger;
                  qryModelo.FieldByName('IDOBJETO').AsInteger :=
                     qryBack.FieldByName('IDOBJETO').AsInteger;
                  qryModelo.FieldByName('IDFORM').AsInteger :=
                     qryBack.FieldByName('IDFORM').AsInteger;
                  qryModelo.Post;
                  qryBack.Next;
               end;

       {***} end;

begin
   Result := True;
   DtbBaseDados := Session.FindDatabase(FDatabaseName);
   if DtbBaseDados = nil then
    raise EDataTransfError.Create(FDatabaseName, ConnectionNotFound);
   InternalInit;
   DtbConstraint := TDatabase.Create(Self);


  TabelasBack[09] := 'FUNCAOBACK';
  TabelasBack[10] := 'OPERACAOBACK';
  TabelasBack[11] := 'FORMBACK';
  TabelasBack[12] := 'OBJETOBACK';
  TabelasBack[13] := 'OPERFUNCBACK';
  TabelasBack[14] := 'FROBFNOPBACK';


   try
     qry := TwwQuery.Create(Self);
     qry.DatabaseName := FDatabaseName;

     qryBack := TwwQuery.Create(self);
     qryBack.DataBaseName := FDataBaseName;

     qryModelo := TwwQuery.Create(Self);


     qryModelo.RequestLive := True;

     qryModelo.DatabaseName := FDataBaseName;

     DtbBaseDados.StartTransaction;
     DoTransfProgress('Deletando tabela ' + TabelasFonte[14]);
     ExecutarQuery(qry, 'DELETE ' + TabelasFonte[14]);


     DoTransfProgress('Deletando tabela ' + TabelasFonte[11]);
     ExecutarQuery(qry, 'DELETE ' + TabelasFonte[11]);


     DoTransfProgress('Deletando tabela ' + TabelasFonte[12]);
     ExecutarQuery(qry, 'DELETE ' + TabelasFonte[12]);


     DoTransfProgress('Deletando tabela AUTORIZA');
     ExecutarQuery(qry, 'DELETE ' + 'AUTORIZA');


     DoTransfProgress('Deletando tabela ' + TabelasFonte[13]);
     ExecutarQuery(qry, 'DELETE ' + TabelasFonte[13]);


     DoTransfProgress('Deletando tabela ' + TabelasFonte[09]);
     ExecutarQuery(qry, 'DELETE ' + TabelasFonte[09]);


     DoTransfProgress('Deletando tabela ' + TabelasFonte[10]);
     ExecutarQuery(qry, 'DELETE ' + TabelasFonte[10]);



     lstFieldNames := TStringList.Create;




     RestaurarModeloDeAutorizacao(iIdBack);

     DtbBaseDados.Commit;

     lstFieldNames.Free;
     qryDel.Free;
     qryBack.Free;
     qryModelo.Free;
     qry.Free;
   except
     on e: exception do
     begin
        DtbBaseDados.Rollback;
        Result := False;
     end;
   end;
end;

{ EDataTransfError }

constructor EDataTransfError.Create(const AFileName: string; ID: Integer);
begin
  FMsgId := ID;
  case ID of
    ImportFileNotFound :
    begin
      FFileName := AFileName;
      inherited CreateFmt(sImportFileNotFound, [AFileName]);
    end;
    ConnectionNotFound : inherited CreateFmt(sConnectionNotFound, [AFileName]);
    InvalidPassword : inherited CreateFmt(sInvalidPassword, [AFileName]);
  end;
end;

end.

