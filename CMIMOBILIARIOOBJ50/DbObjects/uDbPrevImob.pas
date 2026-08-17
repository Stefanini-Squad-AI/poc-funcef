{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbPrevimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbPrevimob = class(TCmDbObject)

  private
    FIdimovel: TCmDbField;
    FVlrano: TCmDbField;
    FMescompetencia: TCmDbField;
    FIdprevimob: TCmDbField;
    FAnocompetencia: TCmDbField;
    FCodtipimovel: TCmDbField;
    FVlrmes: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FDtinictbdiaria: TCmDbField;
    FDtfimctbdiaria: TCmDbField;
    FFlgTipoLanc: TCmDbField;
    procedure SetAnocompetencia(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdprevimob(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetMescompetencia(const Value: TCmDbField);
    procedure SetVlrano(const Value: TCmDbField);
    procedure SetVlrmes(const Value: TCmDbField);
    procedure SetDtfimctbdiaria(const Value: TCmDbField);
    procedure SetDtinictbdiaria(const Value: TCmDbField);
    procedure SetFlgTipoLanc(const Value: TCmDbField);

  public

     Property Vlrmes: TCmDbField read FVlrmes write SetVlrmes;
     Property Vlrano: TCmDbField read FVlrano write SetVlrano;
     Property Mescompetencia: TCmDbField read FMescompetencia write SetMescompetencia;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idprevimob: TCmDbField read FIdprevimob write SetIdprevimob;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property Anocompetencia: TCmDbField read FAnocompetencia write SetAnocompetencia;
     Property FlgTipoLanc: TCmDbField read FFlgTipoLanc write SetFlgTipoLanc;
     Property Dtinictbdiaria: TCmDbField read FDtinictbdiaria write SetDtinictbdiaria;
     Property Dtfimctbdiaria: TCmDbField read FDtfimctbdiaria write SetDtfimctbdiaria;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPrevimob }

constructor TDbPrevimob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PREVIMOB';

   fVlrmes := CreateCmDbField('VLRMES',ftfloat,False,False,False,False,'');
   fVlrano := CreateCmDbField('VLRANO',ftfloat,False,False,False,False,'');
   fMescompetencia := CreateCmDbField('MESCOMPETENCIA',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdprevimob := CreateCmDbField('IDPREVIMOB',ftfloat,True,True,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   fAnocompetencia := CreateCmDbField('ANOCOMPETENCIA',ftfloat,False,False,False,True,'');
   fFlgTipoLanc := CreateCmDbField('FLGTIPOLANC',ftString,False,False,False,True,'');   
   fDtinictbdiaria := CreateCmDbField('DTINICTBDIARIA',ftDateTime,False,False,False,True,'');
   fDtfimctbdiaria := CreateCmDbField('DTFIMCTBDIARIA',ftDateTime,False,False,False,True,'');
end;

function TDbPrevimob.Insert: Boolean;
begin

   fIdprevimob.AsFloat := GetSequence('PREVIMOB');
   Result := Inherited Insert;

end;


procedure TDbPrevimob.SetAnocompetencia(const Value: TCmDbField);
begin
  FAnocompetencia := Value;
end;

procedure TDbPrevimob.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbPrevimob.SetDtfimctbdiaria(const Value: TCmDbField);
begin
  FDtfimctbdiaria := Value;
end;

procedure TDbPrevimob.SetDtinictbdiaria(const Value: TCmDbField);
begin
  FDtinictbdiaria := Value;
end;

procedure TDbPrevimob.SetFlgTipoLanc(const Value: TCmDbField);
begin
  FFlgTipoLanc := Value;
end;

procedure TDbPrevimob.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbPrevimob.SetIdprevimob(const Value: TCmDbField);
begin
  FIdprevimob := Value;
end;

procedure TDbPrevimob.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbPrevimob.SetMescompetencia(const Value: TCmDbField);
begin
  FMescompetencia := Value;
end;

procedure TDbPrevimob.SetVlrano(const Value: TCmDbField);
begin
  FVlrano := Value;
end;

procedure TDbPrevimob.SetVlrmes(const Value: TCmDbField);
begin
  FVlrmes := Value;
end;

end.



