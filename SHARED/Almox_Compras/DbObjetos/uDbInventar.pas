{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbInventar;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbInventar = class(TCmDbObject)

  private
    FTipoInvent: TCmDbField;
    FRecontagEncerrada: TCmDbField;
    FCodAlmoxarifado: TCmDbField;
    FDataTrava: TCmDbField;
    FIdInventario: TCmDbField;
    FUltIdMovRecont: TCmDbField;
    FIdPessoa: TCmDbField;
    FCodGrupoProd: TCmDbField;
    FDataRecontagem: TCmDbField;
    FContagemEncerrada: TCmDbField;
    FDataInventario: TCmDbField;
    FAbertoFechado: TCmDbField;
    FUltIdMovCont: TCmDbField;
    FParcialTotal: TCmDbField;
    procedure SetAbertoFechado(const Value: TCmDbField);
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetCodGrupoProd(const Value: TCmDbField);
    procedure SetContagemEncerrada(const Value: TCmDbField);
    procedure SetDataInventario(const Value: TCmDbField);
    procedure SetDataRecontagem(const Value: TCmDbField);
    procedure SetDataTrava(const Value: TCmDbField);
    procedure SetIdInventario(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetParcialTotal(const Value: TCmDbField);
    procedure SetRecontagEncerrada(const Value: TCmDbField);
    procedure SetTipoInvent(const Value: TCmDbField);
    procedure SetUltIdMovCont(const Value: TCmDbField);
    procedure SetUltIdMovRecont(const Value: TCmDbField);

  public

     Property UltIdMovRecont    : TCmDbField read FUltIdMovRecont write SetUltIdMovRecont;
     Property UltIdMovCont      : TCmDbField read FUltIdMovCont write SetUltIdMovCont;
     Property TipoInvent        : TCmDbField read FTipoInvent write SetTipoInvent;
     Property RecontagEncerrada : TCmDbField read FRecontagEncerrada write SetRecontagEncerrada;
     Property ParcialTotal      : TCmDbField read FParcialTotal write SetParcialTotal;
     Property IdPessoa          : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdInventario      : TCmDbField read FIdInventario write SetIdInventario;
     Property DataTrava         : TCmDbField read FDataTrava write SetDataTrava;
     Property DataRecontagem    : TCmDbField read FDataRecontagem write SetDataRecontagem;
     Property DataInventario    : TCmDbField read FDataInventario write SetDataInventario;
     Property ContagemEncerrada : TCmDbField read FContagemEncerrada write SetContagemEncerrada;
     Property CodGrupoProd      : TCmDbField read FCodGrupoProd write SetCodGrupoProd;
     Property CodAlmoxarifado   : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;
     Property AbertoFechado     : TCmDbField read FAbertoFechado write SetAbertoFechado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbInventar }

constructor TDbInventar.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INVENTAR';

   fUltidmovrecont := CreateCmDbField('ULTIDMOVRECONT',ftfloat,False,False,False,True,'');
   fUltidmovcont := CreateCmDbField('ULTIDMOVCONT',ftfloat,False,False,False,True,'');
   fTipoinvent := CreateCmDbField('TIPOINVENT',ftString,False,False,False,True,'');
   fRecontagencerrada := CreateCmDbField('RECONTAGENCERRADA',ftString,False,False,False,True,'');
   fParcialtotal := CreateCmDbField('PARCIALTOTAL',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdinventario := CreateCmDbField('IDINVENTARIO',ftfloat,True,True,False,True,'');
   fDatatrava := CreateCmDbField('DATATRAVA',ftDateTime,False,False,False,True,'');
   fDatarecontagem := CreateCmDbField('DATARECONTAGEM',ftDateTime,False,False,False,True,'');
   fDatainventario := CreateCmDbField('DATAINVENTARIO',ftDateTime,True,False,False,True,'');
   fContagemencerrada := CreateCmDbField('CONTAGEMENCERRADA',ftString,False,False,False,True,'');
   fCodgrupoprod := CreateCmDbField('CODGRUPOPROD',ftString,False,False,False,True,'');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO',ftfloat,False,False,False,True,'');
   fAbertofechado := CreateCmDbField('ABERTOFECHADO',ftString,False,False,False,True,'');
end;

function TDbInventar.Insert: Boolean;
begin

   fIdinventario.AsFloat := GetSequence('INVENTAR');
   Result := Inherited Insert;

end;

function TDbInventar.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbInventar.SetAbertoFechado(const Value: TCmDbField);
begin
  FAbertoFechado := Value;
end;

procedure TDbInventar.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbInventar.SetCodGrupoProd(const Value: TCmDbField);
begin
  FCodGrupoProd := Value;
end;

procedure TDbInventar.SetContagemEncerrada(const Value: TCmDbField);
begin
  FContagemEncerrada := Value;
end;

procedure TDbInventar.SetDataInventario(const Value: TCmDbField);
begin
  FDataInventario := Value;
end;

procedure TDbInventar.SetDataRecontagem(const Value: TCmDbField);
begin
  FDataRecontagem := Value;
end;

procedure TDbInventar.SetDataTrava(const Value: TCmDbField);
begin
  FDataTrava := Value;
end;

procedure TDbInventar.SetIdInventario(const Value: TCmDbField);
begin
  FIdInventario := Value;
end;

procedure TDbInventar.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbInventar.SetParcialTotal(const Value: TCmDbField);
begin
  FParcialTotal := Value;
end;

procedure TDbInventar.SetRecontagEncerrada(const Value: TCmDbField);
begin
  FRecontagEncerrada := Value;
end;

procedure TDbInventar.SetTipoInvent(const Value: TCmDbField);
begin
  FTipoInvent := Value;
end;

procedure TDbInventar.SetUltIdMovCont(const Value: TCmDbField);
begin
  FUltIdMovCont := Value;
end;

procedure TDbInventar.SetUltIdMovRecont(const Value: TCmDbField);
begin
  FUltIdMovRecont := Value;
end;

end.



