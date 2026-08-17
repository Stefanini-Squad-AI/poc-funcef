{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoalterador;
//***************************************************************************************
//Rotina.............: Create, SetFLGVALORBASE
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de informações do campo FLGVALORBASE.
//***************************************************************************************
//Rotina.............: Create, SetFLGLANCANFS
//N. SIG.............: 76750 
//Data da Alteração..: 06/06/2019
//Alteração Form.....: uDbTipoAlterador
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de informações do campo FLGLANCANFS. 
//***************************************************************************************
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Inclusão da FLAG - FLGOBRIGARESERVA
-------------------------------------------------------------------------------------------------- }

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipoalterador = class(TCmDbObject)

  private

     FRecpag: TCmDbField;
     FPlano: TCmDbField;
     FPlaconta: TCmDbField;
     FIdusuarioinclusao: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdempresa: TCmDbField;
     FFlgcalculaimposto: TCmDbField;
     FFlgagregasaldo: TCmDbField;
     FFlgagregabaixa: TCmDbField;
     FDescricao: TCmDbField;
     FConverte: TCmDbField;
     FCodsubconta: TCmDbField;
     FCodnatureza: TCmDbField;
     FCodcorresp: TCmDbField;
     FCodcentrocusto: TCmDbField;
     FCodalterador: TCmDbField;
     FAcresdecres: TCmDbField;
     FFLGUSACCUSTODOC: TCmDbField;
     FFLGCONTABNABAIXA: TCmDbField;
     FFLGINCIDEIRRF: TCmDbField;
    FCODTIPRECDES: TCmDbField;
    FObservacao: TCmDbField; //Bruno Bastos - Pend. 14392 - 12/08/2003
    FFLGOBRIGARESERVA: TCmDbField;
    FFLGLANCANFS: TCmDbField;
    FFLGVALORBASE: TCmDbField;

     Procedure SetRecpag(const Value: TCmDbField);
     Procedure SetPlano(const Value: TCmDbField);
     Procedure SetPlaconta(const Value: TCmDbField);
     Procedure SetIdusuarioinclusao(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdempresa(const Value: TCmDbField);
     Procedure SetFlgcalculaimposto(const Value: TCmDbField);
     Procedure SetFlgagregasaldo(const Value: TCmDbField);
     Procedure SetFlgagregabaixa(const Value: TCmDbField);
     Procedure SetDescricao(const Value: TCmDbField);
     Procedure SetConverte(const Value: TCmDbField);
     Procedure SetCodsubconta(const Value: TCmDbField);
     Procedure SetCodnatureza(const Value: TCmDbField);
     Procedure SetCodcorresp(const Value: TCmDbField);
     Procedure SetCodcentrocusto(const Value: TCmDbField);
     Procedure SetCodalterador(const Value: TCmDbField);
     Procedure SetAcresdecres(const Value: TCmDbField);
     procedure SetFLGCONTABNABAIXA(const Value: TCmDbField);
     procedure SetFLGUSACCUSTODOC(const Value: TCmDbField);
     procedure SetFLGINCIDEIRRF(const Value: TCmDbField);//Bruno Bastos - Pend. 14392 - 12/08/2003
     procedure SetCODTIPRECDES(Const Value: TCmDbField);
     procedure SetObservacao(const Value: TCmDbField);
    procedure SetFLGOBRIGARESERVA(const Value: TCmDbField);
    procedure SetFLGLANCANFS(const Value: TCmDbField);
    procedure SetFLGVALORBASE(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Flgcalculaimposto: TCmDbField read FFlgcalculaimposto write SetFlgcalculaimposto;
     Property Flgagregasaldo: TCmDbField read FFlgagregasaldo write SetFlgagregasaldo;
     Property Flgagregabaixa: TCmDbField read FFlgagregabaixa write SetFlgagregabaixa;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Converte: TCmDbField read FConverte write SetConverte;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codnatureza: TCmDbField read FCodnatureza write SetCodnatureza;
     Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;
     Property Acresdecres: TCmDbField read FAcresdecres write SetAcresdecres;
     Property FLGCONTABNABAIXA: TCmDbField read FFLGCONTABNABAIXA write SetFLGCONTABNABAIXA;
     Property FLGUSACCUSTODOC: TCmDbField read FFLGUSACCUSTODOC write SetFLGUSACCUSTODOC;
     Property FLGINCIDEIRRF: TCmDbField read FFLGINCIDEIRRF write SetFLGINCIDEIRRF; //Bruno Bastos - Pend. 14392 - 12/08/2003
     Property CODTIPRECDES: TCmDbField read FCODTIPRECDES write SetCODTIPRECDES; //Bruno Bastos - Pend. 19025 - 11/05/2005
     property Observacao: TCmDbField read FObservacao write SetObservacao; // amf p:18886 - 27.01.2006
     Property FLGOBRIGARESERVA: TCmDbField read FFLGOBRIGARESERVA write SetFLGOBRIGARESERVA;//Vander Campos - SOL 172384/9603 - KINTANA 1661662

     property FLGLANCANFS: TCmDbField read FFLGLANCANFS write SetFLGLANCANFS; //Cássio Rovaroto - SIG nº 75760
     property FLGVALORBASE : TCmDbField  read FFLGVALORBASE write SetFLGVALORBASE; //Cássio Rovaroto - SIG nº 115585;

     Constructor Create(owner : TCmCustomCdbObject);

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoalterador }

constructor TDbTipoalterador.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOALTERADOR';

   fRecpag := CreateCmDbField('RECPAG',ftString);
   fPlano := CreateCmDbField('PLANO',ftfloat);
   fPlaconta := CreateCmDbField('PLACONTA',ftString);
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat);
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat);
   fFlgcalculaimposto := CreateCmDbField('FLGCALCULAIMPOSTO',ftString);
   fFlgagregasaldo := CreateCmDbField('FLGAGREGASALDO',ftString);
   fFlgagregabaixa := CreateCmDbField('FLGAGREGABAIXA',ftString);
   fDescricao := CreateCmDbField('DESCRICAO',ftString);
   fConverte := CreateCmDbField('CONVERTE',ftString);
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat);
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString);
   fCodcorresp := CreateCmDbField('CODCORRESP',ftString);
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString);
   fCodalterador := CreateCmDbField( 'CODALTERADOR',ftfloat,true,true );
   fAcresdecres := CreateCmDbField('ACRESDECRES',ftString);
   fFLGCONTABNABAIXA := CreateCmDbField('FLGCONTABNABAIXA',ftString);
   fFLGUSACCUSTODOC := CreateCmDbField('FLGUSACCUSTODOC',ftString);
   FFLGINCIDEIRRF := CreateCmDbField('FLGINCIDEIRRF',ftString); //Bruno Bastos - Pend. 14392 - 12/08/2003
   FCODTIPRECDES := CreateCmDbField('CODTIPRECDES',ftString); //Bruno Bastos - Pend. 19025 - 11/05/2005
   FObservacao   := CreateCmDbField('OBSERVACAO', ftString); // amf p:18886 - 26.01.2006
   FFLGOBRIGARESERVA := CreateCmDbField('FLGOBRIGARESERVA', ftString);//Vander Campos - SOL 172384/9603 - KINTANA 1661662
   FFLGLANCANFS := CreateCmDbField('FLGLANCANFS', ftString, False, False, False, False, ''); //Cássio Rovaroto - SIG nº 76750
   FFLGVALORBASE := CreateCmDbField('FLGVALORBASE', ftString, False, False, False, False, ''); //Cássio Rovaroto - SIG nº 115585
end;

function TDbTipoalterador.Insert: Boolean;
begin

   fCodalterador.AsFloat := GetSequence('TIPOALTERADOR');
   Result := Inherited Insert;

end;

function TDbTipoalterador.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipoalterador.SetAcresdecres(const Value: TCmDbField);
begin
     FAcresdecres := value;
end;

procedure TDbTipoalterador.SetCodalterador(const Value: TCmDbField);
begin
     FCodalterador := value;
end;

procedure TDbTipoalterador.SetCodcentrocusto(const Value: TCmDbField);
begin
     FCodcentrocusto := value;
end;

procedure TDbTipoalterador.SetCodcorresp(const Value: TCmDbField);
begin
     FCodcorresp := value;
end;

procedure TDbTipoalterador.SetCodnatureza(const Value: TCmDbField);
begin
     FCodnatureza := value;
end;

procedure TDbTipoalterador.SetCodsubconta(const Value: TCmDbField);
begin
     FCodsubconta := value;
end;

procedure TDbTipoalterador.SetCODTIPRECDES(const Value: TCmDbField);
begin
  FCODTIPRECDES := Value;
end;

procedure TDbTipoalterador.SetConverte(const Value: TCmDbField);
begin
     FConverte := value;
end;

procedure TDbTipoalterador.SetDescricao(const Value: TCmDbField);
begin
     FDescricao := value;
end;

procedure TDbTipoalterador.SetFlgagregabaixa(const Value: TCmDbField);
begin
     FFlgagregabaixa := value;
end;

procedure TDbTipoalterador.SetFlgagregasaldo(const Value: TCmDbField);
begin
     FFlgagregasaldo := value;
end;

procedure TDbTipoalterador.SetFlgcalculaimposto(const Value: TCmDbField);
begin
     FFlgcalculaimposto := value;
end;

procedure TDbTipoalterador.SetFLGCONTABNABAIXA(const Value: TCmDbField);
begin
  FFLGCONTABNABAIXA := Value;
end;

procedure TDbTipoalterador.SetFLGINCIDEIRRF(const Value: TCmDbField);
begin
  FFLGINCIDEIRRF := Value;
end;

procedure TDbTipoalterador.SetFLGLANCANFS(const Value: TCmDbField);
begin
  FFLGLANCANFS := Value;
end;

procedure TDbTipoalterador.SetFLGOBRIGARESERVA(const Value: TCmDbField);
begin
  FFLGOBRIGARESERVA := Value;
end;

procedure TDbTipoalterador.SetFLGUSACCUSTODOC(const Value: TCmDbField);
begin
  FFLGUSACCUSTODOC := Value;
end;

procedure TDbTipoalterador.SetFLGVALORBASE(const Value: TCmDbField);
begin
  FFLGVALORBASE := Value;
end;

procedure TDbTipoalterador.SetIdempresa(const Value: TCmDbField);
begin
     FIdempresa := value;
end;

procedure TDbTipoalterador.SetIdpessoa(const Value: TCmDbField);
begin
     FIdpessoa := value;
end;

procedure TDbTipoalterador.SetIdusuarioinclusao(const Value: TCmDbField);
begin
     FIdusuarioinclusao := value;
end;

procedure TDbTipoalterador.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbTipoalterador.SetPlaconta(const Value: TCmDbField);
begin
     FPlaconta := value;
end;

procedure TDbTipoalterador.SetPlano(const Value: TCmDbField);
begin
     FPlano := value;
end;

procedure TDbTipoalterador.SetRecpag(const Value: TCmDbField);
begin
     FRecpag := value;
end;

end.



