{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}
{ Alterações
**********************************************************************
Analista.: Edilaine
SOL......: 196824
Kintana..: 1884092
Data.....: 19/08/2013
Rotina...: GravaInforme
Descrição: Não altera ano de vigencia porque existe uma FK nova na
           tabela  GRUPORUBRICAXLINHASINFORME
**********************************************************************
Analista.: Fernando Xavier
SOL......: 198573
Kintana..: 1910197
Data.....: 11/01/2013
Rotina...: GravarInforme
Descrição: Sistema não esta inserindo um informe novo
**********************************************************************
Analista.: Edilaine Ferraresi
SOL......: 180961
Kintana..: 1677063
Data.....: 29/05/2012
Rotina...: GravarInforme
Descrição: permitir alteração do ano de vigência do informe
**********************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 168331
Kintana..: 1482898
Data.....: 05/01/2012
Rotina...: getMaiorAnoVigencia, ProcurarInforme
Descrição: Foi criada uma rotina para retornar o maior Ano de Vigencia da tabela
           Informe.
**********************************************************************}
unit uCtrlInforme;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbInforme, DB, uDataBase, uSistema, DbClient,
     Wwquery,//Vinicius Maciel -  SOL 168331 - KTN 1482898
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlInforme = Class(TCmControlObject)

    private

    FDbInforme: TDbInforme;

    FCdsInforme: TClientDataSet;

    function getMaiorAnoVigencia : integer; //Vinicius Maciel -  SOL 168331 - KTN 1482898

    procedure SetDbInforme(const Value: TDbInforme);
    procedure SetCdsInforme(const Value: TClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsInforme: TClientDataSet   read FCdsInforme  write SetCdsInforme;
      property DbInforme: TDbInforme read FDbInforme   write setDbInforme;

      property iMaiorAnoVigencia : integer read getMaiorAnoVigencia;  //Vinicius Maciel -  SOL 168331 - KTN 1482898

      {Grava Alterações das Naturezas de rendimento no Banco de Dados}
      Function GravarInforme : Boolean;
      {procura informe}
      function ProcurarInforme(IdInforme: integer;sAno : string='') : OleVariant;   //Vinicius Maciel -  SOL 168331 - KTN 1482898 - adicionei o iAno
      {lista os informes}
      function ListInforme : OleVariant;
      function ListInformeBase : OleVariant;


    protected

    End;

implementation

{ TCtrlInforme }




constructor TCtrlInforme.Create;
begin
  inherited;
  FDbInforme   := TDbInforme.create(self);
end;

destructor TCtrlInforme.Destroy;
begin
  FDbInforme.Free;
  if isAppServer then
    Begin
      FCdsInforme.free;
    end;
  inherited;
end;

procedure TCtrlInforme.DoChangeDataBase;
begin
  inherited;
  DbInforme.DataBaseName   := DataBaseName;
end;




procedure TCtrlInforme.SetCdsInforme(
  const Value: TClientDataSet);
begin
  FCdsInforme := Value;
end;

procedure TCtrlInforme.SetDbInforme(
        const Value: TDbInforme);
begin
  FDbInforme := Value;
end;

function TCtrlInforme.GravarInforme: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarInforme(FCdsInforme.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Edilaine - SOL 180961 / KTN 1677063
           { foi alterara a FK da tabela INFORMEAUX para permitir a execução do código abaixo
             usando DEFERRABLE INITIALLY DEFERRED a integridade é testada apenas no commit, o
             que permite um 'update cascade' }
           FCdsInforme.first;
           // SOL 198573 Kintana 1910197 Inicio
           Result := true;

           if FCdsInforme.FieldByName('IDINFORME').AsString <> '' then
           begin
              while not FCdsInforme.eof do
              begin

                 with  TwwQuery.Create(nil) do
                 try
                    DatabaseName := 'BASEDADOS';
                    Sql.add(' SELECT 1 FROM INFORMEAUX ');
                    Sql.add(' where IDINFORME = '+FCdsInforme.FieldByName('IDINFORME').AsString);
                    Open;
                    if Eof then
                    begin
                       Sql.clear;
                       Sql.add(' insert into INFORMEAUX '+
                               ' (IDINFORME,ANOVIGENCIA) '+
                               ' Values '+
                               ' ( '+FCdsInforme.FieldByName('IDINFORME').AsString+' , '+ quotedstr(FCdsInforme.FieldByName('ANOVIGENCIA').AsString)+' ) ');
                       try
                          ExecSql;
                          Result := True;
                       except
                          Result := False;
                       end;
                    end
                    else
                    begin
                       Sql.clear;
                       Sql.add('update INFORMEAUX set AnoVigencia = '+quotedstr(FCdsInforme.FieldByName('ANOVIGENCIA').AsString)+
                               ' where IDINFORME = '+FCdsInforme.FieldByName('IDINFORME').AsString);
                       try
                          ExecSql;
                          Result := True;
                       except
                          Result := False;
                       end;

                       // Edilaine - SOL 196824 / KTN 1884092
                       Sql.clear;
                       Sql.add('update GRUPORUBRICAXLINHASINFORME set AnoVigencia = '+quotedstr(FCdsInforme.FieldByName('ANOVIGENCIA').AsString)+
                               ' where IDINFORME = '+FCdsInforme.FieldByName('IDINFORME').AsString);
                       try
                          ExecSql;
                          Result := True;
                       except
                          Result := False;
                       end;
                       // Edilaine - SOL 196824 / KTN 1884092 - fim
                    end;
                    Close;
                 finally
                    Free;
                 end;
                 FCdsInforme.next;
              end;
           end;
           // SOL 198573 Kintana 1910197 Fim
           if Result then
              Result := ApplyCds( FCdsInforme,FDbInforme,[FDbInforme.AnoVigencia],[FDbInforme.AnoVigencia], true );

           //Result := ApplyCds( FCdsInforme,FDbInforme,[],[] );

           // Edilaine - SOL 180961 / KTN 1677063 - fim

           Msg    := FDbInforme.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;

//Vinicius Maciel -  SOL 168331 - KTN 1482898 - adicionei o iAno
function TCtrlInforme.ProcurarInforme(idInforme : integer;sAno : String) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM INFORME '+
          ' WHERE IDINFORME = '+IntTostr(IdInforme);
          //Vinicius Maciel -  SOL 168331 - KTN 1482898
          if(sAno <>'') then
          Ssql := Ssql + ' AND ANOVIGENCIA ='+sAno;
          //Vinicius Maciel -  SOL 168331 - KTN 1482898 - FIM
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlInforme.OnCreateAppServer;
begin
  inherited;
  FcdsInforme := TClientDataSet.Create(nil);
end;

function TCtrlInforme.ListInforme: OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT IDINFORME, NOMEINFORME,  CODINFORME '+
          '  FROM INFORME '+
          ' ORDER BY NOMEINFORME';
  Result := GetDataPacket(Ssql);        
end;

function TCtrlInforme.ListInformeBase: OleVariant;
Var
  Ssql :string;
begin
  Ssql := 'SELECT IDINFORME '+
          '  FROM INFORME '+
          ' WHERE ((FLGIRRF = ''S'') OR (FLGBASE = ''S'')) ';
  Result := GetDataPacket(Ssql);
end;

//Vinicius Maciel -  SOL 168331 - KTN 1482898 - INICIO
function TCtrlInforme.getMaiorAnoVigencia: integer;
var
    qryAux : TwwQuery;
    iMaiorAno : integer;
begin
    iMaiorAno := 0;
    qryAux := TwwQuery.Create(nil);
    qryAux.DatabaseName := 'BASEDADOS';
    qryAux.sql.add('SELECT MAX(ANOVIGENCIA) AS ANO FROM INFORME');
    qryAux.close;
    try
    qryAux.open;
    iMaiorAno := qryAux.FieldByName('ANO').asInteger;
    finally
    FreeAndNil(qryAux);
    end;
    Result := iMaiorAno;
end;
//Vinicius Maciel -  SOL 168331 - KTN 1482898 - FIM

end.

