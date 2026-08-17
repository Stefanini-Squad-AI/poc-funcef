{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbLancPrevImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbLancPrevImob = class(TCmDbObject)

  private
    FIdtipocustorecimo: TCmDbField;
    FAnocompetencia: TCmDbField;
    FCodtipimovel: TCmDbField;
    FVlrmes: TCmDbField;
    FMescompetencia: TCmDbField;
    FFlgajusteanual: TCmDbField;
    FIdlancprevimob: TCmDbField;
    FFlgsituacao: TCmDbField;
    FDtIniCtbDiaria: TCmDbField;
    FDtFimCtbDiaria: TCmDbField;
    procedure SetAnocompetencia(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetFlgajusteanual(const Value: TCmDbField);
    procedure SetFlgsituacao(const Value: TCmDbField);
    procedure SetIdlancprevimob(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetMescompetencia(const Value: TCmDbField);
    procedure SetVlrmes(const Value: TCmDbField);
    procedure SetDtFimCtbDiaria(const Value: TCmDbField);
    procedure SetDtIniCtbDiaria(const Value: TCmDbField);

  public

     Property Vlrmes: TCmDbField read FVlrmes write SetVlrmes;
     Property Mescompetencia: TCmDbField read FMescompetencia write SetMescompetencia;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idlancprevimob: TCmDbField read FIdlancprevimob write SetIdlancprevimob;
     Property Flgsituacao: TCmDbField read FFlgsituacao write SetFlgsituacao;
     Property Flgajusteanual: TCmDbField read FFlgajusteanual write SetFlgajusteanual;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property Anocompetencia: TCmDbField read FAnocompetencia write SetAnocompetencia;
     Property DtIniCtbDiaria: TCmDbField read FDtIniCtbDiaria write SetDtIniCtbDiaria;
     Property DtFimCtbDiaria: TCmDbField read FDtFimCtbDiaria write SetDtFimCtbDiaria;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancPrevImob }

constructor TDbLancPrevImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCPREVIMOB';

   fVlrmes := CreateCmDbField('VLRMES',ftfloat,False,False,False,True,'');
   fMescompetencia := CreateCmDbField('MESCOMPETENCIA',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdlancprevimob := CreateCmDbField('IDLANCPREVIMOB',ftfloat,True,True,False,True,'');
   fFlgsituacao := CreateCmDbField('FLGSITUACAO',ftString,False,False,False,True,'');
   fFlgajusteanual := CreateCmDbField('FLGAJUSTEANUAL',ftString,False,False,False,True,'');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   fAnocompetencia := CreateCmDbField('ANOCOMPETENCIA',ftfloat,False,False,False,True,'');
   fDtinictbdiaria := CreateCmDbField('DTINICTBDIARIA',ftDateTime,False,False,False,True,'');
   fDtfimctbdiaria := CreateCmDbField('DTFIMCTBDIARIA',ftDateTime,False,False,False,True,'');
end;

function TDbLancPrevImob.Insert: Boolean;
begin

   fIdlancprevimob.AsFloat := GetSequence('LANCPREVIMOB');
   Result := Inherited Insert;

end;


procedure TDbLancPrevImob.SetAnocompetencia(const Value: TCmDbField);
begin
  FAnocompetencia := Value;
end;

procedure TDbLancPrevImob.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbLancPrevImob.SetDtFimCtbDiaria(const Value: TCmDbField);
begin
  FDtFimCtbDiaria := Value;
end;

procedure TDbLancPrevImob.SetDtIniCtbDiaria(const Value: TCmDbField);
begin
  FDtIniCtbDiaria := Value;
end;

procedure TDbLancPrevImob.SetFlgajusteanual(const Value: TCmDbField);
begin
  FFlgajusteanual := Value;
end;

procedure TDbLancPrevImob.SetFlgsituacao(const Value: TCmDbField);
begin
  FFlgsituacao := Value;
end;

procedure TDbLancPrevImob.SetIdlancprevimob(const Value: TCmDbField);
begin
  FIdlancprevimob := Value;
end;

procedure TDbLancPrevImob.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbLancPrevImob.SetMescompetencia(const Value: TCmDbField);
begin
  FMescompetencia := Value;
end;

procedure TDbLancPrevImob.SetVlrmes(const Value: TCmDbField);
begin
  FVlrmes := Value;
end;

end.



