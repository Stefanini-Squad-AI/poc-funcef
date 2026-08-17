{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemSoli;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject ;

Type
  TDbItemSoli = class(TCmDbObject)

  private
    FIdProcxArt: TCmDbField;
    FIdContratoProd: TCmDbField;
    FQtdePendente: TCmDbField;
    FIdProdvari: TCmDbField;
    FQtdePedida: TCmDbField;
    FCodProcesso: TCmDbField;
    FIdItemSoli: TCmDbField;
    FIdComprador: TCmDbField;
    FCodMedida: TCmDbField;
    FNumSolCompra: TCmDbField;
    FObsItemSolic: TCmDbField;
    FSaldoAcomprar: TCmDbField;
    FCodArtigo: TCmDbField;
    FSoliciAceita: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetCodProcesso(const Value: TCmDbField);
    procedure SetIdComprador(const Value: TCmDbField);
    procedure SetIdContratoProd(const Value: TCmDbField);
    procedure SetIdItemSoli(const Value: TCmDbField);
    procedure SetIdProcxArt(const Value: TCmDbField);
    procedure SetIdProdvari(const Value: TCmDbField);
    procedure SetNumSolCompra(const Value: TCmDbField);
    procedure SetObsItemSolic(const Value: TCmDbField);
    procedure SetQtdePedida(const Value: TCmDbField);
    procedure SetQtdePendente(const Value: TCmDbField);
    procedure SetSaldoAcomprar(const Value: TCmDbField);
    procedure SetSoliciAceita(const Value: TCmDbField);

  public

     Property SoliciAceita   : TCmDbField read FSoliciAceita write SetSoliciAceita;
     Property SaldoAcomprar  : TCmDbField read FSaldoAcomprar write SetSaldoAcomprar;
     Property QtdePendente   : TCmDbField read FQtdePendente write SetQtdePendente;
     Property QtdePedida     : TCmDbField read FQtdePedida write SetQtdePedida;
     Property ObsItemSolic   : TCmDbField read FObsItemSolic write SetObsItemSolic;
     Property NumSolCompra   : TCmDbField read FNumSolCompra write SetNumSolCompra;
     Property IdProdvari     : TCmDbField read FIdProdvari write SetIdProdvari;
     Property IdProcxArt     : TCmDbField read FIdProcxArt write SetIdProcxArt;
     Property IdItemSoli     : TCmDbField read FIdItemSoli write SetIdItemSoli;
     Property IdContratoProd : TCmDbField read FIdContratoProd write SetIdContratoProd;
     Property IdComprador    : TCmDbField read FIdComprador write SetIdComprador;
     Property CodProcesso    : TCmDbField read FCodProcesso write SetCodProcesso;
     Property CodMedida      : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo      : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbItemSoli }

constructor TDbItemSoli.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMSOLI';

   fSoliciaceita    := CreateCmDbField('SOLICIACEITA'   ,ftString,False,False,False,True,'');
   fSaldoacomprar   := CreateCmDbField('SALDOACOMPRAR'  ,ftfloat ,False,False,False,True,'');
   fQtdependente    := CreateCmDbField('QTDEPENDENTE'   ,ftfloat ,False,False,False,True,'');
   fQtdepedida      := CreateCmDbField('QTDEPEDIDA'     ,ftfloat ,False,False,False,True,'');
   fObsitemsolic    := CreateCmDbField('OBSITEMSOLIC'   ,ftBlob,False,False,False,True,'');
   fNumsolcompra    := CreateCmDbField('NUMSOLCOMPRA'   ,ftfloat ,True,False,False,True,'');
   fIdprodvari      := CreateCmDbField('IDPRODVARI'     ,ftfloat ,False,False,False,True,'');
   fIdprocxart      := CreateCmDbField('IDPROCXART'     ,ftfloat ,False,False,False,True,'');
   fIditemsoli      := CreateCmDbField('IDITEMSOLI'     ,ftfloat ,True,True,False,True,'');
   fIdcontratoprod  := CreateCmDbField('IDCONTRATOPROD' ,ftfloat ,False,False,False,True,'');
   fIdcomprador     := CreateCmDbField('IDCOMPRADOR'    ,ftfloat ,False,False,False,True,'');
   fCodprocesso     := CreateCmDbField('CODPROCESSO'    ,ftfloat ,False,False,False,True,'');
   fCodmedida       := CreateCmDbField('CODMEDIDA'      ,ftString,True,False,False,True,'');
   fCodartigo       := CreateCmDbField('CODARTIGO'      ,ftString,True,False,False,True,'');
end;

function TDbItemSoli.Insert: Boolean;
begin
   fIditemsoli.AsFloat := GetSequence('ITEMSOLI');

   fSaldoacomprar.AsFloat := fQtdepedida.AsFloat;
   fQtdependente.AsFloat  := fQtdepedida.AsFloat;

   Result := Inherited Insert;

end;

function TDbItemSoli.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbItemSoli.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbItemSoli.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbItemSoli.SetCodProcesso(const Value: TCmDbField);
begin
  FCodProcesso := Value;
end;

procedure TDbItemSoli.SetIdComprador(const Value: TCmDbField);
begin
  FIdComprador := Value;
end;

procedure TDbItemSoli.SetIdContratoProd(const Value: TCmDbField);
begin
  FIdContratoProd := Value;
end;

procedure TDbItemSoli.SetIdItemSoli(const Value: TCmDbField);
begin
  FIdItemSoli := Value;
end;

procedure TDbItemSoli.SetIdProcxArt(const Value: TCmDbField);
begin
  FIdProcxArt := Value;
end;

procedure TDbItemSoli.SetIdProdvari(const Value: TCmDbField);
begin
  FIdProdvari := Value;
end;

procedure TDbItemSoli.SetNumSolCompra(const Value: TCmDbField);
begin
  FNumSolCompra := Value;
end;

procedure TDbItemSoli.SetObsItemSolic(const Value: TCmDbField);
begin
  FObsItemSolic := Value;
end;

procedure TDbItemSoli.SetQtdePedida(const Value: TCmDbField);
begin
  FQtdePedida := Value;
end;

procedure TDbItemSoli.SetQtdePendente(const Value: TCmDbField);
begin
  FQtdePendente := Value;
end;

procedure TDbItemSoli.SetSaldoAcomprar(const Value: TCmDbField);
begin
  FSaldoAcomprar := Value;
end;

procedure TDbItemSoli.SetSoliciAceita(const Value: TCmDbField);
begin
  FSoliciAceita := Value;
end;

end.



