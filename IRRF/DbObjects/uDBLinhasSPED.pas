unit uDBLinhasSPED;

{*******************************************************************************
Analista.: Edilaine Ferraresi
Data.....: 26/08/2013
Kintana..: 1235889
Sol......: 155850
Descrição: Inclusão da Funcionalidade SPED
*******************************************************************************}

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbLinhasSPED = class(TCmDbObject)

  private
    FVLRCREDITO: TCmDbField;
    FIDLINHASPED: TCmDbField;
    FVLRDEBITO: TCmDbField;
    FIDASSOCIACAO: TCmDbField;
    FIDRELATORIODADOS: TCmDbField;
    procedure SetIDASSOCIACAO(const Value: TCmDbField);
    procedure SetIDLINHASPED(const Value: TCmDbField);
    procedure SetIDRELATORIODADOS(const Value: TCmDbField);
    procedure SetVLRCREDITO(const Value: TCmDbField);
    procedure SetVLRDEBITO(const Value: TCmDbField);

  public
    property  IDLINHASPED      : TCmDbField read FIDLINHASPED write SetIDLINHASPED;
    property  IDRELATORIODADOS : TCmDbField read FIDRELATORIODADOS write SetIDRELATORIODADOS;
    property  IDASSOCIACAO     : TCmDbField read FIDASSOCIACAO write SetIDASSOCIACAO;
    property  VLRCREDITO       : TCmDbField read FVLRCREDITO write SetVLRCREDITO;
    property  VLRDEBITO        : TCmDbField read FVLRDEBITO write SetVLRDEBITO;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;
    Function    Insert  : boolean; override;
    Function LoadFromDb : Boolean; Override;

end;


implementation

{ TDbLinhasSPED }

constructor TDbLinhasSPED.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'LINHAS_SPED';

  FIDLINHASPED       := CreateCmDbField('IDLINHASPED',ftfloat,True,True,False,True,'');
  FIdRelatorioDados  := CreateCmDbField('IDRELATORIODADOS',ftfloat,true,false,False,True,'');
  FIdAssociacao      := CreateCmDbField('IDASSOCIACAO',ftfloat,false,false,False,True,'');
  FVlrCredito        := CreateCmDbField('VLRCREDITO',ftfloat,false,false,False,True,'');
  FVlrDebito         := CreateCmDbField('VLRDEBITO',ftfloat,false,false,False,True,'');

end;

function TDbLinhasSPED.Insert: boolean;
begin
   FIdLinhaSPED.AsFloat := LeUltRegistro(Nil, 'LINHAS_SPED'); //GetSequence('LINHAS_SPED');
   Result := Inherited Insert;
end;

function TDbLinhasSPED.LoadFromDb: Boolean;
begin
  Result := inherited LoadFromDB;
end;

procedure TDbLinhasSPED.SetIDASSOCIACAO(const Value: TCmDbField);
begin
  FIDASSOCIACAO := Value;
end;

procedure TDbLinhasSPED.SetIDLINHASPED(const Value: TCmDbField);
begin
  FIDLINHASPED := Value;
end;

procedure TDbLinhasSPED.SetIDRELATORIODADOS(const Value: TCmDbField);
begin
  FIDRELATORIODADOS := Value;
end;

procedure TDbLinhasSPED.SetVLRCREDITO(const Value: TCmDbField);
begin
  FVLRCREDITO := Value;
end;

procedure TDbLinhasSPED.SetVLRDEBITO(const Value: TCmDbField);
begin
  FVLRDEBITO := Value;
end;

end.
 