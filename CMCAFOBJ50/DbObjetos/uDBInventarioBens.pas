{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 22/08/2003                             }
{                                                       }
{*******************************************************}

{
--------------------------------------------------------------------------------
 Nº SOL......: 172256
 Nº KINTANA..: 1547763
 Data........: 02/08/2012
 Responsável.: Vander Campos
 Descrição...: Ajustes nas mensagens inclusão dos Display Labels
-------------------------------------------------------------------------------
}

unit uDBInventarioBens;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBInventarioBens = class(TCmDbObject)

  private
    FIdinventariobens: TCmDbField;
    FIdselbaixa: TCmDbField;
    FStatus: TCmDbField;
    FDatafimlevant: TCmDbField;
    FIdresponsavel: TCmDbField;
    FDatainilevant: TCmDbField;
    FIdempresa: TCmDbField;
    procedure SetIdinventariobens(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetDatafimlevant(const Value: TCmDbField);
    procedure SetDatainilevant(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetIdselbaixa(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);

  public

     Property Idinventariobens: TCmDbField read FIdinventariobens write SetIdinventariobens;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Datainilevant: TCmDbField read FDatainilevant write SetDatainilevant;
     Property Datafimlevant: TCmDbField read FDatafimlevant write SetDatafimlevant;
     Property Idselbaixa: TCmDbField read FIdselbaixa write SetIdselbaixa;
     Property Status: TCmDbField read FStatus write SetStatus;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBInventarioBens }

constructor TDBInventarioBens.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'INVENTARIOBENS';

   // Vander - SOL: 172256 - KTN: 1547763 # Inclusão de Display Label | fIdinventariobens, fDatainilevant, fDatafimlevant

   fIdinventariobens := CreateCmDbField('IDINVENTARIOBENS',ftfloat,True,True,False,True,'Nº levantamento');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fDatainilevant := CreateCmDbField('DATAINILEVANT',ftDateTime,True,False,False,True,'Data inicio');
   fDatafimlevant := CreateCmDbField('DATAFIMLEVANT',ftDateTime,False,False,False,True,'Data final');
   fIdselbaixa := CreateCmDbField('IDSELBAIXA',ftfloat,False,False,False,True,'');
   fStatus := CreateCmDbField('STATUS',ftfloat,True,False,False,False,'');
end;

function TDBInventarioBens.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBInventarioBens.SetDatafimlevant(const Value: TCmDbField);
begin
  FDatafimlevant := Value;
end;

procedure TDBInventarioBens.SetDatainilevant(const Value: TCmDbField);
begin
  FDatainilevant := Value;
end;

procedure TDBInventarioBens.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBInventarioBens.SetIdinventariobens(const Value: TCmDbField);
begin
  FIdinventariobens := Value;
end;

procedure TDBInventarioBens.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDBInventarioBens.SetIdselbaixa(const Value: TCmDbField);
begin
  FIdselbaixa := Value;
end;

procedure TDBInventarioBens.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

end.



