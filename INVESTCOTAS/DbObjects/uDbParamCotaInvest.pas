{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbParamCotaInvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamCotaInvest = class(TCmDbObject)

  private
    FIdparamcotainvest: TCmDbField;
    FDataultfech: TCmDbField;
    FDATAINICIAL : TCmDbField;
    FDATAENCERRAMENTO : TCmDbField;
    FIDCARTEIRAINVEST : TCmDbField;
    FQTDDECQTD: TCmDbField;
    FQTDDECVLR: TCmDbField;
    FVLRCOTAINICIAL: TCmDbField;
    FMOECODIGO: TCmDbField;
    FPERCTXPERFORM: TCmDbField;
    FPERCTXADM: TCmDbField;
    procedure SetDataultfech(const Value: TCmDbField);
    procedure SetIdparamcotainvest(const Value: TCmDbField);
    procedure SetDATAINICIAL(const Value: TCmDbField);
    procedure SetDATAENCERRAMENTO(const Value: TCmDbField);
    procedure SetIDCARTEIRAINVEST(const Value: TCmDbField);
    procedure SetQTDDECQTD(const Value: TCmDbField);
    procedure SetQTDDECVLR(const Value: TCmDbField);
    procedure SetVLRCOTAINICIAL(const Value: TCmDbField);
    procedure SetMOECODIGO(const Value: TCmDbField);
    procedure SetPERCTXADM(const Value: TCmDbField);
    procedure SetPERCTXPERFORM(const Value: TCmDbField);

  public

     Property Idparamcotainvest: TCmDbField read FIdparamcotainvest write SetIdparamcotainvest;
     Property Dataultfech: TCmDbField read FDataultfech write SetDataultfech;
     Property DATAINICIAL: TCmDbField read FDATAINICIAL write SetDATAINICIAL;
     Property DATAENCERRAMENTO: TCmDbField read FDATAENCERRAMENTO write SetDATAENCERRAMENTO;
     Property IDCARTEIRAINVEST: TCmDbField read FIDCARTEIRAINVEST write SetIDCARTEIRAINVEST;
     Property QTDDECQTD: TCmDbField read FQTDDECQTD write SetQTDDECQTD;
     Property QTDDECVLR: TCmDbField read FQTDDECVLR write SetQTDDECVLR;
     Property VLRCOTAINICIAL: TCmDbField read FVLRCOTAINICIAL write SetVLRCOTAINICIAL;
     Property MOECODIGO: TCmDbField read FMOECODIGO write SetMOECODIGO;
     Property PERCTXPERFORM: TCmDbField read FPERCTXPERFORM write SetPERCTXPERFORM;
     Property PERCTXADM : TCmDbField read FPERCTXADM write SetPERCTXADM;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamCotaInvest }

constructor TDbParamCotaInvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCOTAINVEST';

   fIdparamcotainvest := CreateCmDbField('IDPARAMCOTAINVEST',ftfloat,True,True,False,True,'');
   fDataultfech := CreateCmDbField('DATAULTFECH',ftDateTime,False,False,False,True,'Data do último fechamento');
   FDATAINICIAL := CreateCmDbField('DATAINICIAL',ftDateTime,False,False,False,True,'Data Inicial');
   FDATAENCERRAMENTO := CreateCmDbField('DATAENCERRAMENTO',ftDateTime,False,False,False,True,'Data de Encerramento');
   FIDCARTEIRAINVEST := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'Carteira de Investimentos');
   FQTDDECQTD := CreateCmDbField('QTDDECQTD',ftfloat,False,False,False,True,'Casas decimais da Quantidade');
   FQTDDECVLR := CreateCmDbField('QTDDECVLR',ftfloat,False,False,False,True,'Casas decimais da Cota');
   FVLRCOTAINICIAL := CreateCmDbField('VLRCOTAINICIAL',ftfloat,False,False,False,True,'Valor da Cota Inicial');
   FMOECODIGO := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'Índice de Performance');
   FPERCTXPERFORM  := CreateCmDbField('PERCTXPERFORM',ftfloat,False,False,False,True,'% Taxa de Performance');
   FPERCTXADM  := CreateCmDbField('PERCTXADM',ftfloat,False,False,False,True,'% Taxa de Adminstração');

end;

function TDbParamCotaInvest.Insert: Boolean;
begin

   fIdparamcotainvest.AsFloat := GetSequence('PARAMCOTAINVEST');
   Result := Inherited Insert;

end;

procedure TDbParamCotaInvest.SetDATAENCERRAMENTO(const Value: TCmDbField);
begin
  FDATAENCERRAMENTO := Value;
end;

procedure TDbParamCotaInvest.SetDATAINICIAL(const Value: TCmDbField);
begin
   FDATAINICIAL := Value;
end;

procedure TDbParamCotaInvest.SetIDCARTEIRAINVEST(const Value: TCmDbField);
begin
  FIDCARTEIRAINVEST := Value;
end;

procedure TDbParamCotaInvest.SetDataultfech(const Value: TCmDbField);
begin
  FDataultfech := Value;
end;

procedure TDbParamCotaInvest.SetIdparamcotainvest(const Value: TCmDbField);
begin
  FIdparamcotainvest := Value;
end;

procedure TDbParamCotaInvest.SetQTDDECQTD(const Value: TCmDbField);
begin
  FQTDDECQTD := Value;
end;

procedure TDbParamCotaInvest.SetQTDDECVLR(const Value: TCmDbField);
begin
  FQTDDECVLR := Value;
end;

procedure TDbParamCotaInvest.SetVLRCOTAINICIAL(const Value: TCmDbField);
begin
  FVLRCOTAINICIAL := Value;
end;

procedure TDbParamCotaInvest.SetMOECODIGO(const Value: TCmDbField);
begin
  FMOECODIGO := Value;
end;

procedure TDbParamCotaInvest.SetPERCTXADM(const Value: TCmDbField);
begin
  FPERCTXADM := Value;
end;

procedure TDbParamCotaInvest.SetPERCTXPERFORM(const Value: TCmDbField);
begin
  FPERCTXPERFORM := Value;
end;

end.



