{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbCtrlinterface;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCtrlinterface = class(TCmDbObject)

  private

  public

     Property Vlrtotal: TCmDbField;
     Property Tipo: TCmDbField;
     Property Numreg: TCmDbField;
     Property Mesreferencia: TCmDbField;
     Property Idreferencia: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idlote: TCmDbField;
     Property Flgvoltatmp: TCmDbField;
     Property Flgvoltainterface: TCmDbField;
     Property Flgtipofolha: TCmDbField;
     Property Flgpreparado: TCmDbField;
     Property Flgincluimesconc: TCmDbField;
     Property Flgidatmp: TCmDbField;
     Property Flgidainterface: TCmDbField;
     Property Flgestado: TCmDbField;
     Property Flgemitiucc: TCmDbField;
     Property Flgconcessao: TCmDbField;
     Property Flgatrasodevol: TCmDbField;
     Property Descricao: TCmDbField;
     Property Datavoltatmp: TCmDbField;
     Property Datavoltainterfa: TCmDbField;
     Property Datapreparo: TCmDbField;
     Property Datapagamento: TCmDbField;
     Property Dataidatmp: TCmDbField;
     Property Dataidainterface: TCmDbField;
     Property Dataemitiucc: TCmDbField;
     Property Codportforma: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCtrlinterface }

constructor TDbCtrlinterface.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CTRLINTERFACE';

   fVlrtotal := CreateCmDbField('VLRTOTAL',ftfloat,True,False);
   fTipo := CreateCmDbField('TIPO',ftString,True,False);
   fNumreg := CreateCmDbField('NUMREG',ftfloat,True,False);
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,True,False);
   fIdreferencia := CreateCmDbField('IDREFERENCIA',ftfloat,True,False);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False);
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,False,True);
   fFlgvoltatmp := CreateCmDbField('FLGVOLTATMP',ftfloat,True,False);
   fFlgvoltainterface := CreateCmDbField('FLGVOLTAINTERFACE',ftfloat,True,False);
   fFlgtipofolha := CreateCmDbField('FLGTIPOFOLHA',ftfloat,True,False);
   fFlgpreparado := CreateCmDbField('FLGPREPARADO',ftfloat,True,False);
   fFlgincluimesconc := CreateCmDbField('FLGINCLUIMESCONC',ftfloat,True,False);
   fFlgidatmp := CreateCmDbField('FLGIDATMP',ftfloat,True,False);
   fFlgidainterface := CreateCmDbField('FLGIDAINTERFACE',ftfloat,True,False);
   fFlgestado := CreateCmDbField('FLGESTADO',ftfloat,True,False);
   fFlgemitiucc := CreateCmDbField('FLGEMITIUCC',ftfloat,True,False);
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,True,False);
   fFlgatrasodevol := CreateCmDbField('FLGATRASODEVOL',ftString,True,False);
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False);
   fDatavoltatmp := CreateCmDbField('DATAVOLTATMP',ftDateTime,True,False);
   fDatavoltainterfa := CreateCmDbField('DATAVOLTAINTERFA',ftDateTime,True,False);
   fDatapreparo := CreateCmDbField('DATAPREPARO',ftDateTime,True,False);
   fDatapagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,True,False);
   fDataidatmp := CreateCmDbField('DATAIDATMP',ftDateTime,True,False);
   fDataidainterface := CreateCmDbField('DATAIDAINTERFACE',ftDateTime,True,False);
   fDataemitiucc := CreateCmDbField('DATAEMITIUCC',ftDateTime,True,False);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
end;

function TDbCtrlinterface.Insert: Boolean;
begin

   fIdlote.AsFloat := GetSequence(CTRLINTERFACE);
   Result := Inherited Insert;

end;

end.



