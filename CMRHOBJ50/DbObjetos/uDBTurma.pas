unit uDBTurma;

{--------------------------------------------------------------------------------------------------
Nº SOL......: 223297/17219
Nº PPM......: 800924
Data........: 25/05/2015
Responsável.: Petri Nocentini
Descrição...: Permitir cadastrar um curso com valor custo igual a zero
--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
--------------------------------------------------------------------------------------------------}

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDBTurma = Class(TCmDbObject)

  Private
    FVALORPASS: TCmDbField;
    FCARGAHORARIA: TCmDbField;
    FDTFIM: TCmDbField;
    FVALOROUTROS: TCmDbField;
    FIDCURSO: TCmDbField;
    FVALORHOSP: TCmDbField;
    FIDTURMA: TCmDbField;
    FHRINI: TCmDbField;
    FHRFIM: TCmDbField;
    FIDCIDADES: TCmDbField;
    FDESCRICAO: TCmDbField;
    FVALORCURSO: TCmDbField;
    FDTINI: TCmDbField;
    FCONTEUDO: TCmDbField;
    FOBSERVACAO: TCmDbField;
    procedure SetCARGAHORARIA(const Value: TCmDbField);
    procedure SetDESCRICAO(const Value: TCmDbField);
    procedure SetDTFIM(const Value: TCmDbField);
    procedure SetDTINI(const Value: TCmDbField);
    procedure SetHRFIM(const Value: TCmDbField);
    procedure SetHRINI(const Value: TCmDbField);
    procedure SetIDCIDADES(const Value: TCmDbField);
    procedure SetIDCURSO(const Value: TCmDbField);
    procedure SetIDTURMA(const Value: TCmDbField);
    procedure SetVALORCURSO(const Value: TCmDbField);
    procedure SetVALORHOSP(const Value: TCmDbField);
    procedure SetVALOROUTROS(const Value: TCmDbField);
    procedure SetVALORPASS(const Value: TCmDbField);
    procedure SetCONTEUDO(const Value: TCmDbField);
    procedure SetOBSERVACAO(const Value: TCmDbField);

  Public
    Property IDTURMA : TCmDbField read FIDTURMA write SetIDTURMA;
    Property IDCURSO : TCmDbField read FIDCURSO write SetIDCURSO;
    Property DESCRICAO : TCmDbField read FDESCRICAO write SetDESCRICAO;
    Property DTINI : TCmDbField read FDTINI write SetDTINI;
    Property DTFIM : TCmDbField read FDTFIM write SetDTFIM;
    Property HRINI : TCmDbField read FHRINI write SetHRINI;
    Property HRFIM : TCmDbField read FHRFIM write SetHRFIM;
    Property IDCIDADES : TCmDbField read FIDCIDADES write SetIDCIDADES;
    Property CARGAHORARIA : TCmDbField read FCARGAHORARIA write SetCARGAHORARIA;
    Property VALORCURSO : TCmDbField read FVALORCURSO write SetVALORCURSO;
    Property VALORPASS : TCmDbField read FVALORPASS write SetVALORPASS;
    Property VALORHOSP : TCmDbField read FVALORHOSP write SetVALORHOSP;
    Property VALOROUTROS : TCmDbField read FVALOROUTROS write SetVALOROUTROS;
    property CONTEUDO : TCmDbField read FCONTEUDO write SetCONTEUDO;
    property OBSERVACAO : TCmDbField read FOBSERVACAO write SetOBSERVACAO;


    Constructor Create(Aowner: TCmCustomCdbObject); Override;
    Function Insert: Boolean; Override;
    Function Update: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
    function GetCodigo : integer;

  end;


implementation



{ TDBTurma }

constructor TDBTurma.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TURMA';

   fIdTurma        := CreateCmDbField( 'IDTURMA',       ftfloat,  True,  True,  False, True, '');
   fIdCurso        := CreateCmDbField( 'IDCURSO',       ftfloat,  True,  False, False, True, '');
   fDescricao      := CreateCmDbField( 'DESCRICAO',     ftString, True,  False, False, True, '');
   fDtIni          := CreateCmDbField( 'DTINI',         ftDate,   False, False, False, True, '');
   fDtFim          := CreateCmDbField( 'DTFIM',         ftDate,   False, False, False, True, '');
   fHrIni          := CreateCmDbField( 'HRINI',         ftString, False, False, False, True, '');
   fHrFim          := CreateCmDbField( 'HRFIM',         ftString, False, False, False, True, '');
   fIdCidades      := CreateCmDbField( 'IDCIDADES',     ftfloat,  False, False, False, True, '');
   fCargaHoraria   := CreateCmDbField( 'CARGAHORA',     ftfloat,  False, False, False, True, '');
   fValorCurso     := CreateCmDbField( 'VALORCURSO',    ftfloat,  False, False, False, False, '');  //Petri SOL 223297/17219 PPM 800924
   fValorPass      := CreateCmDbField( 'VALORPASS',     ftfloat,  False, False, False, True, '');
   fValorHosp      := CreateCmDbField( 'VALORHOSP',     ftfloat,  False, False, False, True, '');
   fValorOutros    := CreateCmDbField( 'VALOROUTROS',   ftfloat,  False, False, False, True, '');
   fConteudo       := CreateCmDbField( 'CONTEUDO',      ftBlob,   False, False, False, True, '');
   fObservacao     := CreateCmDbField( 'OBSERVACAO',    ftString, False, False, False, True, '');

end;

function TDBTurma.GetCodigo: integer;
begin
  result := GetSequence('TURMA');
end;

function TDBTurma.Insert: Boolean;
begin
   if fIDTURMA.AsFloat <= 0 then
      fIDTURMA.AsFloat := GetSequence('TURMA');

   Result := Inherited Insert;
end;

function TDBTurma.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTurma.SetCARGAHORARIA(const Value: TCmDbField);
begin
  FCARGAHORARIA := Value;
end;

procedure TDBTurma.SetCONTEUDO(const Value: TCmDbField);
begin
  FCONTEUDO := Value;
end;

procedure TDBTurma.SetDESCRICAO(const Value: TCmDbField);
begin
  FDESCRICAO := Value;
end;

procedure TDBTurma.SetDTFIM(const Value: TCmDbField);
begin
  FDTFIM := Value;
end;

procedure TDBTurma.SetDTINI(const Value: TCmDbField);
begin
  FDTINI := Value;
end;

procedure TDBTurma.SetHRFIM(const Value: TCmDbField);
begin
  FHRFIM := Value;
end;

procedure TDBTurma.SetHRINI(const Value: TCmDbField);
begin
  FHRINI := Value;
end;

procedure TDBTurma.SetIDCIDADES(const Value: TCmDbField);
begin
  FIDCIDADES := Value;
end;

procedure TDBTurma.SetIDCURSO(const Value: TCmDbField);
begin
  FIDCURSO := Value;
end;

procedure TDBTurma.SetIDTURMA(const Value: TCmDbField);
begin
  FIDTURMA := Value;
end;

procedure TDBTurma.SetOBSERVACAO(const Value: TCmDbField);
begin
  FOBSERVACAO := Value;
end;

procedure TDBTurma.SetVALORCURSO(const Value: TCmDbField);
begin
  FVALORCURSO := Value;
end;

procedure TDBTurma.SetVALORHOSP(const Value: TCmDbField);
begin
  FVALORHOSP := Value;
end;

procedure TDBTurma.SetVALOROUTROS(const Value: TCmDbField);
begin
  FVALOROUTROS := Value;
end;

procedure TDBTurma.SetVALORPASS(const Value: TCmDbField);
begin
  FVALORPASS := Value;
end;

function TDBTurma.Update: Boolean;
begin
   Result := Inherited Update;
end;

end.
