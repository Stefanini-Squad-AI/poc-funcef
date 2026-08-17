{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 20/07/2002                             }
{                                                       }
{*******************************************************}

unit uCtrllConfigRelatInforme;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF}, uFuncaoGeral;

  Type
    TCtrllConfigRelatInforme = Class(TCmControlObject)
    private
      FuncaoGeral : TFuncaoGeral;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      function AtualizaLancIRRF(IdBenef, IdModulo : Integer; CodNatureza : string) : Boolean;
      function FormataCPF(CPF : string) : string;
      function strEspacoEsquerda(TamanhoTexto : Integer; Texto : string) : string; //preenche uma string com espaços a direita
      function  Completa(sNome: String; iTam : integer):String;
      function  CompletaZero(sNome: String; iTam : integer):String;
    protected

    End;

implementation

{ TCtrllConfigRelatInforme }

procedure TCtrllConfigRelatInforme.AfterInitialize;
begin
  inherited;
  FuncaoGeral.InitializeAs(Self);
end;

function TCtrllConfigRelatInforme.AtualizaLancIRRF(IdBenef, IdModulo : Integer; CodNatureza : string) : Boolean;
Var
  Ssql : string;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AtualizaLancIRRF(IdBenef, IdModulo, CodNatureza);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
          StartTransaction;
          Ssql := 'UPDATE LANCIRRF SET FLGDARF = ''S'' '+
                  ' WHERE ((FLGDARF = ''N'') '+
                  '    OR (FLGDARF IS NULL)) '+
                  '   AND (IDBENEFIRRF = '+intTostr(IdBenef)+') '+
                  '   AND (CODNATUREZA = '+quotedStr(CodNatureza)+')  '+
                  '   AND (IDMODULO = '+intTostr(IdModulo)+')';
          if not ExecSQL(Ssql) then
             Begin
               Result := False;
               Rollback;
             end
          else
             Begin
               Result := True;
               Commit;
             end;
        except
          Result := false;
          Rollback;
        end;
     end;
end;

function TCtrllConfigRelatInforme.Completa(sNome: String;
  iTam: integer): String;
var i : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := sNome + FuncaoGeral.Spc(iTam - i);
end;

function TCtrllConfigRelatInforme.CompletaZero(sNome: String;
  iTam: integer): String;
var i, k : integer;
begin
   sNome  := trim(sNome);
   i      := length(sNome);
   Result := '';
   for k := 1 to (iTam - i) do
      Result := Result + '0';
   Result := Result + sNome;
end;

constructor TCtrllConfigRelatInforme.Create;
begin
  inherited;
  FuncaoGeral := TFuncaoGeral.create;
end;

destructor TCtrllConfigRelatInforme.Destroy;
begin
  inherited;
  FuncaoGeral.free;
end;

procedure TCtrllConfigRelatInforme.DoChangeDataBase;
begin
  inherited;

end;

function TCtrllConfigRelatInforme.FormataCPF(CPF: string): string;
begin
  Result := Copy(CPF,1,3)+'.'+Copy(CPF,4,3)+'.'+Copy(CPF,7,3)+'-'+Copy(CPF,10,2);
end;

procedure TCtrllConfigRelatInforme.OnCreateAppServer;
begin
  inherited;

end;

function TCtrllConfigRelatInforme.strEspacoEsquerda(TamanhoTexto: Integer;
  Texto: string): string;
var
  numEspacos : integer;
  f          : integer;
  Espacos    : string;
begin
  Espacos := '';
  numEspacos := tamanhoTexto - length(texto);

  for f := 1 to numEspacos do
    Espacos := Espacos + ' ';

  result := Espacos + texto;
end;

end.
