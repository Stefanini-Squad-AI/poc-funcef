{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbEventoCaixaCota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEventoCaixaCota = class(TCmDbObject)

  private
    FStacotiza: TCmDbField;
    FStacaixa: TCmDbField;
    FStaativopassivo: TCmDbField;
    FIdtipodespinvest: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FIdeventocaixacota: TCmDbField;
    FStasomadiminui: TCmDbField;
    FStacota: TCmDbField;
    FDesccaixacota: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FStacpmf: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FIdregra: TCmDbField;
    FFLGMANUALAUT : TCmDbField;
    procedure SetDesccaixacota(const Value: TCmDbField);
    procedure SetIdeventocaixacota(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdtipodespinvest(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetStaativopassivo(const Value: TCmDbField);
    procedure SetStacaixa(const Value: TCmDbField);
    procedure SetStacota(const Value: TCmDbField);
    procedure SetStacotiza(const Value: TCmDbField);
    procedure SetStacpmf(const Value: TCmDbField);
    procedure SetStasomadiminui(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetFLGMANUALAUT(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Stasomadiminui: TCmDbField read FStasomadiminui write SetStasomadiminui;
     Property Stacpmf: TCmDbField read FStacpmf write SetStacpmf;
     Property Stacotiza: TCmDbField read FStacotiza write SetStacotiza;
     Property Stacota: TCmDbField read FStacota write SetStacota;
     Property Stacaixa: TCmDbField read FStacaixa write SetStacaixa;
     Property Staativopassivo: TCmDbField read FStaativopassivo write SetStaativopassivo;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idtipodespinvest: TCmDbField read FIdtipodespinvest write SetIdtipodespinvest;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Ideventocaixacota: TCmDbField read FIdeventocaixacota write SetIdeventocaixacota;
     Property Desccaixacota: TCmDbField read FDesccaixacota write SetDesccaixacota;
     Property FLGMANUALAUT: TCmDbField read FFLGMANUALAUT write SetFLGMANUALAUT;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEventoCaixaCota }

constructor TDbEventoCaixaCota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EVENTOCAIXACOTA';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fStasomadiminui := CreateCmDbField('STASOMADIMINUI',ftString,False,False,False,True,'Status Soma/Diminui');
   fStacpmf := CreateCmDbField('STACPMF',ftString,False,False,False,True,'Status CPMF');
   fStacotiza := CreateCmDbField('STACOTIZA',ftString,False,False,False,True,'Status Cotiza');
   fStacota := CreateCmDbField('STACOTA',ftString,False,False,False,True,'Status Cota');
   fStacaixa := CreateCmDbField('STACAIXA',ftString,False,False,False,True,'Status Caixa');
   fStaativopassivo := CreateCmDbField('STAATIVOPASSIVO',ftString,False,False,False,True,'Status Ativo/Passivo');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'Identificador Tp Operação');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'Identificador Tp Investimento');
   fIdtipodespinvest := CreateCmDbField('IDTIPODESPINVEST',ftfloat,False,False,False,True,'Identificador Despesa');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'Identificador Regra');
   fIdeventocaixacota := CreateCmDbField('IDEVENTOCAIXACOTA',ftfloat,True,True,False,True,'Identificador Caixa / Cota');
   fDesccaixacota := CreateCmDbField('DESCCAIXACOTA',ftString,False,False,False,True,'Evento de Caixa / Cota');
   fFLGMANUALAUT  := CreateCmDbField('FLGMANUALAUT',ftString,False,False,False,True,'Flag Manual/Automático');
end;

function TDbEventoCaixaCota.Insert: Boolean;
begin
   if fIdeventocaixacota.AsFloat = 0 then
      fIdeventocaixacota.AsFloat := GetSequence('EVENTOCAIXACOTA');
   Result := Inherited Insert;

end;


procedure TDbEventoCaixaCota.SetDesccaixacota(const Value: TCmDbField);
begin
  FDesccaixacota := Value;
end;

procedure TDbEventoCaixaCota.SetFLGMANUALAUT(const Value: TCmDbField);
begin
   fFLGMANUALAUT := Value;
end;

procedure TDbEventoCaixaCota.SetIdeventocaixacota(const Value: TCmDbField);
begin
  FIdeventocaixacota := Value;
end;

procedure TDbEventoCaixaCota.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbEventoCaixaCota.SetIdtipodespinvest(const Value: TCmDbField);
begin
  FIdtipodespinvest := Value;
end;

procedure TDbEventoCaixaCota.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbEventoCaixaCota.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbEventoCaixaCota.SetStaativopassivo(const Value: TCmDbField);
begin
  FStaativopassivo := Value;
end;

procedure TDbEventoCaixaCota.SetStacaixa(const Value: TCmDbField);
begin
  FStacaixa := Value;
end;

procedure TDbEventoCaixaCota.SetStacota(const Value: TCmDbField);
begin
  FStacota := Value;
end;

procedure TDbEventoCaixaCota.SetStacotiza(const Value: TCmDbField);
begin
  FStacotiza := Value;
end;

procedure TDbEventoCaixaCota.SetStacpmf(const Value: TCmDbField);
begin
  FStacpmf := Value;
end;

procedure TDbEventoCaixaCota.SetStasomadiminui(const Value: TCmDbField);
begin
  FStasomadiminui := Value;
end;

procedure TDbEventoCaixaCota.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbEventoCaixaCota.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



