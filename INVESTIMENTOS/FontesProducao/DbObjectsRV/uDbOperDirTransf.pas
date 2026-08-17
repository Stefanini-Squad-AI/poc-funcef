{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/10/2010                             }
{                                                       }
{*******************************************************}

unit uDbOperDirTransf;

interface 

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperDirTransf = class(TCmDbObject)

  private
    FIdtipooperacao: TCmDbField;
    FIdtipooperorig: TCmDbField;
    FIdboleta: TCmDbField;
    FIdplanprevctbpatrorig: TCmDbField;
    FObservacao: TCmDbField;
    FIdcartinvestorig: TCmDbField;
    FDatavencorig: TCmDbField;
    FIdforcliorig: TCmDbField;
    FQtdeoperacao: TCmDbField;
    FIdmotivobloqorig: TCmDbField;
    FIdoperacaodireito: TCmDbField;
    FPuorigem: TCmDbField;
    FPercentual: TCmDbField;
    FIdtipooperdest: TCmDbField;
    FIdoperdirtransf: TCmDbField;
    FVlroperacao: TCmDbField;
    FIdcustodiaorig: TCmDbField;
    FDataoperacao: TCmDbField;
    FIdoperinvestorig: TCmDbField;
    FIdinvestorig: TCmDbField;
    FIdplanprevctbpatrdest: TCmDbField;
    FIdoperinvestdest: TCmDbField;
    FIdtipoinvest: TCmDbField;
    procedure SetDataoperacao(const Value: TCmDbField);
    procedure SetDatavencorig(const Value: TCmDbField);
    procedure SetIdboleta(const Value: TCmDbField);
    procedure SetIdcartinvestorig(const Value: TCmDbField);
    procedure SetIdcustodiaorig(const Value: TCmDbField);
    procedure SetIdforcliorig(const Value: TCmDbField);
    procedure SetIdinvestorig(const Value: TCmDbField);
    procedure SetIdmotivobloqorig(const Value: TCmDbField);
    procedure SetIdoperacaodireito(const Value: TCmDbField);
    procedure SetIdoperdirtransf(const Value: TCmDbField);
    procedure SetIdoperinvestdest(const Value: TCmDbField);
    procedure SetIdoperinvestorig(const Value: TCmDbField);
    procedure SetIdplanprevctbpatrdest(const Value: TCmDbField);
    procedure SetIdplanprevctbpatrorig(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetIdtipooperdest(const Value: TCmDbField);
    procedure SetIdtipooperorig(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPuorigem(const Value: TCmDbField);
    procedure SetQtdeoperacao(const Value: TCmDbField);
    procedure SetVlroperacao(const Value: TCmDbField);

  public

     Property Vlroperacao: TCmDbField read FVlroperacao write SetVlroperacao;
     Property Qtdeoperacao: TCmDbField read FQtdeoperacao write SetQtdeoperacao;
     Property Puorigem: TCmDbField read FPuorigem write SetPuorigem;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipooperorig: TCmDbField read FIdtipooperorig write SetIdtipooperorig;
     Property Idtipooperdest: TCmDbField read FIdtipooperdest write SetIdtipooperdest;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatrorig: TCmDbField read FIdplanprevctbpatrorig write SetIdplanprevctbpatrorig;
     Property Idplanprevctbpatrdest: TCmDbField read FIdplanprevctbpatrdest write SetIdplanprevctbpatrdest;
     Property Idoperinvestorig: TCmDbField read FIdoperinvestorig write SetIdoperinvestorig;
     Property Idoperinvestdest: TCmDbField read FIdoperinvestdest write SetIdoperinvestdest;
     Property Idoperdirtransf: TCmDbField read FIdoperdirtransf write SetIdoperdirtransf;
     Property Idoperacaodireito: TCmDbField read FIdoperacaodireito write SetIdoperacaodireito;
     Property Idmotivobloqorig: TCmDbField read FIdmotivobloqorig write SetIdmotivobloqorig;
     Property Idinvestorig: TCmDbField read FIdinvestorig write SetIdinvestorig;
     Property Idforcliorig: TCmDbField read FIdforcliorig write SetIdforcliorig;
     Property Idcustodiaorig: TCmDbField read FIdcustodiaorig write SetIdcustodiaorig;
     Property Idcartinvestorig: TCmDbField read FIdcartinvestorig write SetIdcartinvestorig;
     Property Idboleta: TCmDbField read FIdboleta write SetIdboleta;
     Property Datavencorig: TCmDbField read FDatavencorig write SetDatavencorig;
     Property Dataoperacao: TCmDbField read FDataoperacao write SetDataoperacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperDirTransf }

constructor TDbOperDirTransf.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERDIRTRANSF';

   fVlroperacao := CreateCmDbField('VLROPERACAO',ftfloat,False,False,False,True,'');
   fQtdeoperacao := CreateCmDbField('QTDEOPERACAO',ftfloat,False,False,False,True,'');
   fPuorigem := CreateCmDbField('PUORIGEM',ftfloat,False,False,False,True,'');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'');
   fIdtipooperorig := CreateCmDbField('IDTIPOOPERORIG',ftfloat,False,False,False,True,'');
   fIdtipooperdest := CreateCmDbField('IDTIPOOPERDEST',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatrorig := CreateCmDbField('IDPLANPREVCTBPATRORIG',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatrdest := CreateCmDbField('IDPLANPREVCTBPATRDEST',ftfloat,False,False,False,True,'');
   fIdoperinvestorig := CreateCmDbField('IDOPERINVESTORIG',ftfloat,False,False,False,True,'');
   fIdoperinvestdest := CreateCmDbField('IDOPERINVESTDEST',ftfloat,False,False,False,True,'');
   fIdoperdirtransf := CreateCmDbField('IDOPERDIRTRANSF',ftfloat,True,True,False,True,'');
   fIdoperacaodireito := CreateCmDbField('IDOPERACAODIREITO',ftfloat,False,False,False,True,'');
   fIdmotivobloqorig := CreateCmDbField('IDMOTIVOBLOQORIG',ftfloat,False,False,False,True,'');
   fIdinvestorig := CreateCmDbField('IDINVESTORIG',ftfloat,False,False,False,True,'');
   fIdforcliorig := CreateCmDbField('IDFORCLIORIG',ftfloat,False,False,False,True,'');
   fIdcustodiaorig := CreateCmDbField('IDCUSTODIAORIG',ftfloat,False,False,False,True,'');
   fIdcartinvestorig := CreateCmDbField('IDCARTINVESTORIG',ftfloat,False,False,False,True,'');
   fIdboleta := CreateCmDbField('IDBOLETA',ftString,False,False,False,True,'');
   fDatavencorig := CreateCmDbField('DATAVENCORIG',ftDateTime,False,False,False,True,'');
   fDataoperacao := CreateCmDbField('DATAOPERACAO',ftDateTime,False,False,False,True,'');
end;

function TDbOperDirTransf.Insert: Boolean;
begin

   fIdoperdirtransf.AsFloat := GetSequence('OPERDIRTRANSF');
   Result := Inherited Insert;

end;


procedure TDbOperDirTransf.SetDataoperacao(const Value: TCmDbField);
begin
  FDataoperacao := Value;
end;

procedure TDbOperDirTransf.SetDatavencorig(const Value: TCmDbField);
begin
  FDatavencorig := Value;
end;

procedure TDbOperDirTransf.SetIdboleta(const Value: TCmDbField);
begin
  FIdboleta := Value;
end;

procedure TDbOperDirTransf.SetIdcartinvestorig(const Value: TCmDbField);
begin
  FIdcartinvestorig := Value;
end;

procedure TDbOperDirTransf.SetIdcustodiaorig(const Value: TCmDbField);
begin
  FIdcustodiaorig := Value;
end;

procedure TDbOperDirTransf.SetIdforcliorig(const Value: TCmDbField);
begin
  FIdforcliorig := Value;
end;

procedure TDbOperDirTransf.SetIdinvestorig(const Value: TCmDbField);
begin
  FIdinvestorig := Value;
end;

procedure TDbOperDirTransf.SetIdmotivobloqorig(const Value: TCmDbField);
begin
  FIdmotivobloqorig := Value;
end;

procedure TDbOperDirTransf.SetIdoperacaodireito(const Value: TCmDbField);
begin
  FIdoperacaodireito := Value;
end;

procedure TDbOperDirTransf.SetIdoperdirtransf(const Value: TCmDbField);
begin
  FIdoperdirtransf := Value;
end;

procedure TDbOperDirTransf.SetIdoperinvestdest(const Value: TCmDbField);
begin
  FIdoperinvestdest := Value;
end;

procedure TDbOperDirTransf.SetIdoperinvestorig(const Value: TCmDbField);
begin
  FIdoperinvestorig := Value;
end;

procedure TDbOperDirTransf.SetIdplanprevctbpatrdest(
  const Value: TCmDbField);
begin
  FIdplanprevctbpatrdest := Value;
end;

procedure TDbOperDirTransf.SetIdplanprevctbpatrorig(
  const Value: TCmDbField);
begin
  FIdplanprevctbpatrorig := Value;
end;

procedure TDbOperDirTransf.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbOperDirTransf.SetIdtipooperacao(const Value: TCmDbField);
begin
   FIdtipooperacao := Value;
end;

procedure TDbOperDirTransf.SetIdtipooperdest(const Value: TCmDbField);
begin
  FIdtipooperdest := Value;
end;

procedure TDbOperDirTransf.SetIdtipooperorig(const Value: TCmDbField);
begin
  FIdtipooperorig := Value;
end;

procedure TDbOperDirTransf.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbOperDirTransf.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbOperDirTransf.SetPuorigem(const Value: TCmDbField);
begin
  FPuorigem := Value;
end;

procedure TDbOperDirTransf.SetQtdeoperacao(const Value: TCmDbField);
begin
  FQtdeoperacao := Value;
end;

procedure TDbOperDirTransf.SetVlroperacao(const Value: TCmDbField);
begin
  FVlroperacao := Value;
end;

end.



