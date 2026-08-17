{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/04/2006                             }
{                                                       }
{*******************************************************}

unit uDbOperCustodia;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperCustodia = class(TCmDbObject)

  private
    FIdtipooperorig: TCmDbField;
    FIdopercustodia: TCmDbField;
    FIdcustodiaorig: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FFlgtipocontaorig: TCmDbField;
    FIdcarteiraorig: TCmDbField;
    FQuantidade: TCmDbField;
    FIdmotivobloqdest: TCmDbField;
    FIdinvestimento: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FIdmotivobloqorig: TCmDbField;
    FIdhistcartinvorig: TCmDbField;
    FIdboleta: TCmDbField;
    FIdcarteiradest: TCmDbField;
    FIdhistcartinvdest: TCmDbField;
    FDatamovcustod: TCmDbField;
    FIdtipooperdest: TCmDbField;
    FIdlote: TCmDbField;
    FFlgtipocontadest: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdcustodiantedest: TCmDbField;
    FIdcustodianteorig: TCmDbField;
    FIdcustodiadest: TCmDbField;
    procedure SetDatamovcustod(const Value: TCmDbField);
    procedure SetFlgtipocontadest(const Value: TCmDbField);
    procedure SetFlgtipocontaorig(const Value: TCmDbField);
    procedure SetIdboleta(const Value: TCmDbField);
    procedure SetIdcarteiradest(const Value: TCmDbField);
    procedure SetIdcarteiraorig(const Value: TCmDbField);
    procedure SetIdcustodiadest(const Value: TCmDbField);
    procedure SetIdcustodiantedest(const Value: TCmDbField);
    procedure SetIdcustodianteorig(const Value: TCmDbField);
    procedure SetIdcustodiaorig(const Value: TCmDbField);
    procedure SetIdhistcartinvdest(const Value: TCmDbField);
    procedure SetIdhistcartinvorig(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdmotivobloqdest(const Value: TCmDbField);
    procedure SetIdmotivobloqorig(const Value: TCmDbField);
    procedure SetIdopercustodia(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetIdtipooperdest(const Value: TCmDbField);
    procedure SetIdtipooperorig(const Value: TCmDbField);
    procedure SetQuantidade(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Quantidade: TCmDbField read FQuantidade write SetQuantidade;
     Property Idtipooperorig: TCmDbField read FIdtipooperorig write SetIdtipooperorig;
     Property Idtipooperdest: TCmDbField read FIdtipooperdest write SetIdtipooperdest;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idopercustodia: TCmDbField read FIdopercustodia write SetIdopercustodia;
     Property Idmotivobloqorig: TCmDbField read FIdmotivobloqorig write SetIdmotivobloqorig;
     Property Idmotivobloqdest: TCmDbField read FIdmotivobloqdest write SetIdmotivobloqdest;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idhistcartinvorig: TCmDbField read FIdhistcartinvorig write SetIdhistcartinvorig;
     Property Idhistcartinvdest: TCmDbField read FIdhistcartinvdest write SetIdhistcartinvdest;
     Property Idcustodiaorig: TCmDbField read FIdcustodiaorig write SetIdcustodiaorig;
     Property Idcustodianteorig: TCmDbField read FIdcustodianteorig write SetIdcustodianteorig;
     Property Idcustodiantedest: TCmDbField read FIdcustodiantedest write SetIdcustodiantedest;
     Property Idcustodiadest: TCmDbField read FIdcustodiadest write SetIdcustodiadest;
     Property Idcarteiraorig: TCmDbField read FIdcarteiraorig write SetIdcarteiraorig;
     Property Idcarteiradest: TCmDbField read FIdcarteiradest write SetIdcarteiradest;
     Property Idboleta: TCmDbField read FIdboleta write SetIdboleta;
     Property Flgtipocontaorig: TCmDbField read FFlgtipocontaorig write SetFlgtipocontaorig;
     Property Flgtipocontadest: TCmDbField read FFlgtipocontadest write SetFlgtipocontadest;
     Property Datamovcustod: TCmDbField read FDatamovcustod write SetDatamovcustod;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperCustodia }

constructor TDbOperCustodia.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERCUSTODIA';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,False,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,False,'');
   fQuantidade := CreateCmDbField('QUANTIDADE',ftfloat,False,False,False,True,'Quantidade');
   fIdtipooperorig := CreateCmDbField('IDTIPOOPERORIG',ftfloat,False,False,False,True,'ID Tipo Operação Origem');
   fIdtipooperdest := CreateCmDbField('IDTIPOOPERDEST',ftfloat,False,False,False,True,'ID Tipo Operação Destino');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'ID do Tipo de Operação');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'ID do Tipo de Investimento');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'Plano Patrocinadora Contábil');
   fIdopercustodia := CreateCmDbField('IDOPERCUSTODIA',ftfloat,True,True,False,True,'ID da Operação');
   fIdmotivobloqorig := CreateCmDbField('IDMOTIVOBLOQORIG',ftfloat,False,False,False,True,'ID Motivo de Bloqueio Origem');
   fIdmotivobloqdest := CreateCmDbField('IDMOTIVOBLOQDEST',ftfloat,False,False,False,True,'ID Motivo de Bloqueio Destino');
   fIdlote := CreateCmDbField('IDLOTE',ftString,False,False,False,True,'Lote');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'ID do Investimento');
   fIdhistcartinvorig := CreateCmDbField('IDHISTCARTINVORIG',ftfloat,False,False,False,True,'ID Histórico Carteira Origem');
   fIdhistcartinvdest := CreateCmDbField('IDHISTCARTINVDEST',ftfloat,False,False,False,True,'ID Histórico Carteira Destino');
   fIdcustodiaorig := CreateCmDbField('IDCUSTODIAORIG',ftfloat,False,False,False,True,'ID Histórico Custódia Origem');
   fIdcustodianteorig := CreateCmDbField('IDCUSTODIANTEORIG',ftfloat,False,False,False,True,'ID Custodiante Origem');
   fIdcustodiantedest := CreateCmDbField('IDCUSTODIANTEDEST',ftfloat,False,False,False,True,'ID Custodiante Destino');
   fIdcustodiadest := CreateCmDbField('IDCUSTODIADEST',ftfloat,False,False,False,True,'ID Histórico Custódia Destino');
   fIdcarteiraorig := CreateCmDbField('IDCARTEIRAORIG',ftfloat,False,False,False,True,'ID Carteira Destino');
   fIdcarteiradest := CreateCmDbField('IDCARTEIRADEST',ftfloat,False,False,False,True,'ID Carteira Origem');
   fIdboleta := CreateCmDbField('IDBOLETA',ftString,False,False,False,True,'Boleta');
   fFlgtipocontaorig := CreateCmDbField('FLGTIPOCONTAORIG',ftString,False,False,False,True,'Tipo Conta Destino');
   fFlgtipocontadest := CreateCmDbField('FLGTIPOCONTADEST',ftString,False,False,False,True,'Tipo Conta Origem');
   fDatamovcustod := CreateCmDbField('DATAMOVCUSTOD',ftDateTime,False,False,False,True,'Data da operação');
end;

function TDbOperCustodia.Insert: Boolean;
begin

   if fIdopercustodia.AsFloat = 0 then
      fIdopercustodia.AsFloat := GetSequence('OPERCUSTODIA');
   Result := Inherited Insert;

end;


procedure TDbOperCustodia.SetDatamovcustod(const Value: TCmDbField);
begin
  FDatamovcustod := Value;
end;

procedure TDbOperCustodia.SetFlgtipocontadest(const Value: TCmDbField);
begin
  FFlgtipocontadest := Value;
end;

procedure TDbOperCustodia.SetFlgtipocontaorig(const Value: TCmDbField);
begin
  FFlgtipocontaorig := Value;
end;

procedure TDbOperCustodia.SetIdboleta(const Value: TCmDbField);
begin
  FIdboleta := Value;
end;

procedure TDbOperCustodia.SetIdcarteiradest(const Value: TCmDbField);
begin
  FIdcarteiradest := Value;
end;

procedure TDbOperCustodia.SetIdcarteiraorig(const Value: TCmDbField);
begin
  FIdcarteiraorig := Value;
end;

procedure TDbOperCustodia.SetIdcustodiadest(const Value: TCmDbField);
begin
  FIdcustodiadest := Value;
end;

procedure TDbOperCustodia.SetIdcustodiantedest(const Value: TCmDbField);
begin
  FIdcustodiantedest := Value;
end;

procedure TDbOperCustodia.SetIdcustodianteorig(const Value: TCmDbField);
begin
  FIdcustodianteorig := Value;
end;

procedure TDbOperCustodia.SetIdcustodiaorig(const Value: TCmDbField);
begin
  FIdcustodiaorig := Value;
end;

procedure TDbOperCustodia.SetIdhistcartinvdest(const Value: TCmDbField);
begin
  FIdhistcartinvdest := Value;
end;

procedure TDbOperCustodia.SetIdhistcartinvorig(const Value: TCmDbField);
begin
  FIdhistcartinvorig := Value;
end;

procedure TDbOperCustodia.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbOperCustodia.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbOperCustodia.SetIdmotivobloqdest(const Value: TCmDbField);
begin
  FIdmotivobloqdest := Value;
end;

procedure TDbOperCustodia.SetIdmotivobloqorig(const Value: TCmDbField);
begin
  FIdmotivobloqorig := Value;
end;

procedure TDbOperCustodia.SetIdopercustodia(const Value: TCmDbField);
begin
  FIdopercustodia := Value;
end;

procedure TDbOperCustodia.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbOperCustodia.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbOperCustodia.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbOperCustodia.SetIdtipooperdest(const Value: TCmDbField);
begin
  FIdtipooperdest := Value;
end;

procedure TDbOperCustodia.SetIdtipooperorig(const Value: TCmDbField);
begin
  FIdtipooperorig := Value;
end;

procedure TDbOperCustodia.SetQuantidade(const Value: TCmDbField);
begin
  FQuantidade := Value;
end;

procedure TDbOperCustodia.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbOperCustodia.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



